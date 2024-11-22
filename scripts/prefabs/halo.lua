local assets = {
    Asset("ANIM", "anim/halo.zip"),
    Asset("ATLAS", "images/inventoryimages/halo.xml"),
    Asset("IMAGE", "images/inventoryimages/halo.tex")
}

local function IsHardMode()
    return TUNING.MODE == "hard"
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", "halo", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")
    inst.Light:Enable(true)
    inst.components.fueled:StartConsuming()

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Hide("HEAD_HAIR")
    end
    if inst.equip_count == nil then
        inst.equip_count = 0
    end
    inst.equip_count = inst.equip_count + 1
    if inst.equip_count >= 3 then
        if not IsHardMode() then
            owner:AddComponent("talker")
            owner.components.talker:Say(TUNING.LANGUAGE == "English" and
                    "Blood rings are fully functional only in hard mode" or
                    "血环在困难模式才能有完全的功能", 3)
        end

        inst.equip_count = 0
    end

    if IsHardMode() then
        if inst.effecttask == nil then
            inst.effecttask = inst:DoPeriodicTask(10, function()
                if owner.components.hunger then
                    owner.components.hunger:DoDelta(-10)
                end
                if owner.components.hunger and owner.components.sanity and owner.components.health then
                    local current_hunger = owner.components.hunger:GetPercent() * 100
                    if current_hunger > 0 then
                        if owner.components.sanity:GetPercent() < 1 then
                            owner.components.sanity:DoDelta(10)
                        else
                            owner.components.health:DoDelta(5)
                        end
                    end
                end
            end)
        end
    end
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
    inst.Light:Enable(false)
    inst.components.fueled:StopConsuming()

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAIR")
    end

    if inst.effecttask then
        inst.effecttask:Cancel()
        inst.effecttask = nil
    end
end

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst)
    end

    inst.AnimState:SetBank("halo")
    inst.AnimState:SetBuild("halo")
    inst.AnimState:PlayAnimation("idle")
    inst:AddTag("hat")

    inst:AddComponent("armor")
    if IsHardMode() then
        inst.components.armor:InitCondition(99999, 0.9)
    else
        inst.components.armor:InitCondition(2400, 0.9)
    end
    inst:AddComponent("inspectable")

    inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
    inst.components.insulator:SetInsulation(120)

    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0.5)

    inst:AddComponent("modfloatable")
    inst.components.modfloatable.size = "small"

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.nosink = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/halo.xml"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("fueled")
    inst.components.fueled.accepting = true
    inst.components.fueled.maxfuel = 9600
    inst.components.fueled:InitializeFuelLevel(9600)
    inst.components.fueled:SetDepletedFn(function(inst)
        inst:Remove()
    end)

    inst.entity:AddLight()
    inst.Light:SetRadius(IsHardMode() and 3 or 1.5)
    inst.Light:SetFalloff(0.8)
    inst.Light:SetIntensity(0.8)
    inst.Light:SetColour(1, 1, 1)
    inst.Light:Enable(false)

    return inst
end

return Prefab("common/inventory/halo", fn, assets)
