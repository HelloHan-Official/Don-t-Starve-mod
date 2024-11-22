local assets = {
    Asset("ANIM", "anim/winter_sword.zip"), 
    Asset("ANIM", "anim/swap_winter_sword.zip"),
    Asset("ATLAS", "images/inventoryimages/winter_sword.xml"),
    Asset("IMAGE", "images/inventoryimages/winter_sword.tex")
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_winter_sword", "swap_winter_sword")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")

    inst.equip_count = (inst.equip_count or 0) + 1
    if inst.equip_count >= 3 then
        if inst.components.sharpness and inst.components.weapon and owner.components.talker then
            local sharpness = inst.components.sharpness:GetPercent()
            local damage = inst.components.weapon.damage
            local message = string.format(
                TUNING.LANGUAGE == "English" and
                "Winter Sword's current sharpness value: %.2f%%, damage value: %.2f" or
                "冬之刃当前锋利值: %.2f%%, 伤害值: %.2f",
                sharpness * 100, damage
            )
            owner.components.talker:Say(message, 5)
        end
        inst.equip_count = 0
    end
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function UpdateWeaponDamage(inst)
    local sharpness_percent = inst.components.sharpness:GetPercent()
    local damage_reduction = math.min(34, 34 * (1 - sharpness_percent))
    inst.components.weapon:SetDamage(68 - damage_reduction)

    if inst.components.finiteuses then
        local durability_percent = inst.components.finiteuses:GetPercent()
        local owner = inst.components.inventoryitem.owner
        if owner and owner.components.talker then
            if durability_percent <= 0.1 and not inst.warned_at_5_percent then
                local message = TUNING.LANGUAGE == "English" 
                    and "The Winter Sword is about to break! It can be repaired with ice!" 
                    or "冬之刃就快坏掉了！可以使用冰块修复！"
                owner.components.talker:Say(message, 5)
                inst.warned_at_5_percent = true
            elseif durability_percent > 0.1 then
                inst.warned_at_5_percent = false
            end
        end
    end
end

local function spawnIceEffects(target, chance, damage)
    if target.components.freezable and math.random() < chance then
        target.components.freezable:AddColdness(1)
        target.components.freezable:SpawnShatterFX()
        local fx = SpawnPrefab("icespike_fx_" .. math.random(1, 4))
        fx.Transform:SetPosition(target.Transform:GetWorldPosition())
        if target.components.health then
            target.components.health:DoDelta(-damage)
        end
    end
end

local function onattack(inst, attacker, target)
    UpdateWeaponDamage(inst)
    inst.components.sharpness:DoDelta(-1)

    local isBoss = target:HasTag("epic")
    spawnIceEffects(target, isBoss and 0.25 or 0.5, 15)

    if isBoss then
        target.components.health:DoDelta(-30)
        SpawnPrefab("eye_charge").Transform:SetPosition(inst:GetPosition():Get())
    end

    if target.components.health and target.components.health:IsDead() then
        local ice_count = isBoss and 5 or (math.random() < 0.1 and 1 or 0)
        for i = 1, ice_count do
            local ice = SpawnPrefab("ice")
            ice.Transform:SetPosition(target.Transform:GetWorldPosition())
        end
    end
end

local function AcceptTest(inst, item)
    return item.prefab == "ice" 
end

local function OnAccept(inst, giver, item)
    if item.prefab == "ice" then
        local uses_to_restore = 15
        inst.components.finiteuses:SetUses(math.min(
            inst.components.finiteuses.current + uses_to_restore, 
            inst.components.finiteuses.total
        ))
        if inst.components.sharpness then
            inst.components.sharpness:DoDelta(0.1 * inst.components.sharpness:GetMax())
        end
        UpdateWeaponDamage(inst) 
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("winter_sword")
    inst.AnimState:SetBuild("winter_sword")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("sharp")
    inst:AddTag("tool")

    local isPorklandOrShipwrecked = SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked()
    if TUNING.CHOP_HACK == "true" then
        inst:AddComponent("tool")
        inst.components.tool:SetAction(ACTIONS.CHOP, 4)
        if isPorklandOrShipwrecked then
            inst.components.tool:SetAction(ACTIONS.HACK, 4)
        end
    end

    if isPorklandOrShipwrecked then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(68)
    inst.components.weapon:SetOnAttack(onattack)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(300)
    inst.components.finiteuses:SetUses(300)
    inst.components.finiteuses:SetOnFinished(function(inst)
        local new_sword = SpawnPrefab("broken_sword")
        new_sword.Transform:SetPosition(inst.Transform:GetWorldPosition())
        inst:Remove()
    end)
    inst.components.finiteuses:SetConsumption(ACTIONS.CHOP, 1)
    if isPorklandOrShipwrecked then
        inst.components.finiteuses:SetConsumption(ACTIONS.HACK, 1)
    end

    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(AcceptTest)
    inst.components.trader.onaccept = OnAccept

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    if IsDLCEnabled(CAPY_DLC) or IsDLCEnabled(PORKLAND_DLC) then
        inst.components.equippable.walkspeedmult = 0.25
    elseif IsDLCInstalled(REIGN_OF_GIANTS) then
        inst.components.equippable.walkspeedmult = 1.25
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/winter_sword.xml"

    inst:AddComponent("sharpness")
    inst.components.sharpness:SetMax(200)
    inst.components.sharpness:SetCurrent(200)

    inst.UpdateWeaponDamage = UpdateWeaponDamage

    inst:ListenForEvent("sharpnessloaded", function(inst)
        inst:UpdateWeaponDamage()
    end)
    UpdateWeaponDamage(inst)

    return inst
end

return Prefab("winter_sword", fn, assets)
