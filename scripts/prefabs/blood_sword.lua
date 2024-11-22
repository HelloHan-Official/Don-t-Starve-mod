local assets = {
    Asset("ANIM", "anim/blood_sword.zip"),
    Asset("ANIM", "anim/swap_blood_sword.zip"),
    Asset("ATLAS", "images/inventoryimages/blood_sword.xml"),
    Asset("IMAGE", "images/inventoryimages/blood_sword.tex"),
    Asset("ATLAS", "images/inventoryimages/blood_sword_2.xml"),
    Asset("IMAGE", "images/inventoryimages/blood_sword_2.tex"),

    Asset("SOUNDPACKAGE", "sound/youdeath.fev"),
    Asset("SOUND", "sound/youdeath.fsb"),
}

local function IsHardMode()
    return TUNING.MODE == "hard"
end

local quotes = {
    English = {"Death is coming!", "Your time has come!", "Embrace the void!", "Feel the power of blood!",
               "Another soul for the blade!"},
    Chinese = {"死亡降临！", "无人生还！", "你的死亡，证明我的存在！",
               "心之所向，剑之所指！", "恨意如火，焚尽你的一切！"}
}

local function SayQuotes(inst)
    local language = TUNING.LANGUAGE == "English" and "English" or "Chinese"
    local randomQuote = quotes[language][math.random(#quotes[language])]
    inst.components.talker:Say(randomQuote, 2)

end

local function onequip(inst, owner)

    if inst.equip_count == nil then
        inst.equip_count = 0
    end
    inst.equip_count = inst.equip_count + 1
    if inst.equip_count >= 3 then
        if not IsHardMode() then
            owner:AddComponent("talker")
            owner.components.talker:Say(TUNING.LANGUAGE == "English" and
                                            "Blood Blade can only be used normally in Hard Mode" or
                                            "血之刃只在困难模式才能正常使用", 3)

        end
        inst.equip_count = 0
    end

    owner.AnimState:OverrideSymbol("swap_object", "swap_blood_sword", "swap_blood_sword")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
    inst.Light:Enable(true)

    if IsHardMode() then
        if TUNING.DIZZY == "true" then
            owner:AddTag("not_hit_stunned")
        end
        if inst.damageTask == nil then
            inst.damageTask = inst:DoPeriodicTask(1, function()
                if inst.components.weapon.damage < 216 then
                    if TUNING.SAN == "false" then
                        inst.components.weapon.damage = inst.components.weapon.damage + 2
                    else
                        inst.components.weapon.damage = inst.components.weapon.damage + 1
                    end
                end
            end)
        end

        if inst.sanitydrain == nil then
            inst.sanitydrain = inst:DoPeriodicTask(1, function()
                if owner.components.sanity then
                    if TUNING.SAN == "false" then
                        owner.components.sanity:DoDelta(-2)
                    else
                        owner.components.sanity:DoDelta(-1)
                    end
                    if owner.components.sanity:GetPercent() < 0.5 then
                        if TUNING.SAN == "false" then
                            owner.components.health:DoDelta(-0.5)
                        else
                            owner.components.health:DoDelta(-0.25)
                        end
                    end
                end
            end)
        end
    end
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")

    if IsHardMode() then
        if TUNING.DIZZY == "true" then
            owner:RemoveTag("not_hit_stunned")
        end

        if inst.damageTask then
            inst.damageTask:Cancel()
            inst.damageTask = nil
        end

        if inst.sanitydrain then
            inst.sanitydrain:Cancel()
            inst.sanitydrain = nil
        end
    end
    if IsHardMode() then
        inst.components.weapon.damage = 68
    end
    inst.Light:Enable(false)
end

local function SpawnKillEffect(x, y, z)
    local fx = SpawnPrefab("red_leaves")
    if fx then
        fx.Transform:SetPosition(x, y, z)
        fx.Transform:SetScale(2, 2, 2)
    end

    local fx2 = SpawnPrefab("red_leaves_chop")
    if fx2 then
        fx2.Transform:SetPosition(x, y, z)
        fx2.Transform:SetScale(2, 2, 2)
    end
end

local function onattack(inst, attacker, target)
    if not IsHardMode() then
        return
    end
    if target:HasTag("epic") then
        target.components.health:DoDelta(-40)
        SpawnPrefab("sanity_lower").Transform:SetPosition(inst:GetPosition():Get())
    end
    if math.random() < 0.01 then
        target.components.health:Kill()
		if TUNING.SHERRY_SOUND == "sherry_cn_sound" then
                inst.SoundEmitter:PlaySound("youdeath/youdeath/death")
            end
        SayQuotes(attacker)

        local x, y, z = target.Transform:GetWorldPosition()
        SpawnKillEffect(x, y, z)

        local lightning = SpawnPrefab("lightning")
        lightning.Transform:SetPosition(x, y, z)

        if TUNING.SAN == "false" then
            attacker.components.health:SetPercent(1)
            if attacker.components.sanity then
                attacker.components.sanity:SetPercent(1)
            end
        else
            if attacker.components.sanity:GetPercent() < 0.5 then
                attacker.components.health:SetPercent(1)
                if attacker.components.sanity then
                    attacker.components.sanity:SetPercent(1)
                end
            end
        end
    end
    if attacker.components.sanity then
        if TUNING.SAN == "false" then
            attacker.components.sanity:DoDelta(1)
        else
            attacker.components.sanity:DoDelta(0.5)
        end
    end
end

local function onperish(inst)
    local new_sword = SpawnPrefab("broken_sword")
    new_sword.Transform:SetPosition(inst.Transform:GetWorldPosition())
    inst:Remove()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("blood_sword")
    inst.AnimState:SetBuild("blood_sword")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("blood_sword.tex")

    inst:AddTag("sharp")
    inst:AddTag("tool")

    if TUNING.CHOP_HACK == "true" then
        if IsHardMode() then
            inst:AddComponent("tool")
            inst.components.tool:SetAction(ACTIONS.CHOP, 4)
            inst.components.tool:SetAction(ACTIONS.MINE, 1)
            if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
                inst.components.tool:SetAction(ACTIONS.HACK, 4)
            end
        end
    end

    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst:AddComponent("weapon")
    if IsHardMode() then
        inst.components.weapon:SetDamage(68)
    else
        inst.components.weapon:SetDamage(34)
    end
    inst.components.weapon:SetOnAttack(onattack)

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    if IsHardMode() then
        if IsDLCEnabled(CAPY_DLC) or IsDLCEnabled(PORKLAND_DLC) then
            inst.components.equippable.walkspeedmult = 0.3
        else
            if IsDLCInstalled(REIGN_OF_GIANTS) then
                inst.components.equippable.walkspeedmult = 1.3
            end
        end
    end
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blood_sword.xml"

    inst.entity:AddLight()
    inst.Light:SetRadius(IsHardMode() and 2.5 or 1)
    inst.Light:SetFalloff(0.5)
    inst.Light:SetIntensity(0.8)
    inst.Light:SetColour(1, 0, 0)
    inst.Light:Enable(false)

    return inst
end

local function fn_2()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("blood_sword")
    inst.AnimState:SetBuild("blood_sword")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("blood_sword.tex")

    inst:AddTag("sharp")
    inst:AddTag("tool")

    if TUNING.CHOP_HACK == "true" then
        if IsHardMode() then
            inst:AddComponent("tool")
            inst.components.tool:SetAction(ACTIONS.CHOP, 4)
            inst.components.tool:SetAction(ACTIONS.MINE, 1)
            if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
                inst.components.tool:SetAction(ACTIONS.HACK, 4)
            end
        end
    end

    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst:AddComponent("weapon")
    if IsHardMode() then
        inst.components.weapon:SetDamage(68)
    else
        inst.components.weapon:SetDamage(34)
    end
    inst.components.weapon:SetOnAttack(onattack)

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(150)
    inst.components.finiteuses:SetUses(150)
    inst.components.finiteuses:SetOnFinished(onperish)
    inst.components.finiteuses:SetConsumption(ACTIONS.CHOP, 1)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
        inst.components.finiteuses:SetConsumption(ACTIONS.HACK, 1)
    end

    if IsHardMode() then
        if IsDLCEnabled(CAPY_DLC) or IsDLCEnabled(PORKLAND_DLC) then
            inst.components.equippable.walkspeedmult = 0.3
        else
            if IsDLCInstalled(REIGN_OF_GIANTS) then
                inst.components.equippable.walkspeedmult = 1.3
            end
        end
    end
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blood_sword_2.xml"

    inst.entity:AddLight()
    inst.Light:SetRadius(IsHardMode() and 2.5 or 1)
    inst.Light:SetFalloff(0.5)
    inst.Light:SetIntensity(0.8)
    inst.Light:SetColour(1, 0, 0)
    inst.Light:Enable(false)

    return inst
end

return Prefab("blood_sword", fn, assets), Prefab("blood_sword_2", fn_2, assets)
