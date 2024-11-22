local assets = {
    Asset("ANIM", "anim/ice_crown.zip"),
    Asset("ATLAS", "images/inventoryimages/ice_crown.xml"),
    Asset("IMAGE", "images/inventoryimages/ice_crown.tex")
}

local prefabs = {}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", "ice_crown", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAIR_HAT")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAIR")
    end
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAIR")
    end
end

local function opentop_onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", "ice_crown", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
    inst.Light:Enable(true)

    owner.AnimState:Show("HEAD")
    owner.AnimState:Hide("HEAD_HAIR")
end

local function AcceptTest(inst, item)
    return item.prefab == "ice" 
end

local function OnAccept(inst, giver, item)
    if item.prefab == "ice" then
        if inst.components.armor then
            local repair_amount = 60  
            local current = inst.components.armor.condition
            local max = inst.components.armor.maxcondition
            inst.components.armor:SetCondition(math.min(current + repair_amount, max))
        end
    end
end

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddLight()

    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("ice_crown")
    inst.AnimState:SetBuild("ice_crown")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("hat")

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(1200, 0.9)

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
    inst.components.inventoryitem.atlasname = "images/inventoryimages/ice_crown.xml"

    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(AcceptTest)
    inst.components.trader.onaccept = OnAccept

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable:SetOnEquip(opentop_onequip)

    inst.Light:SetRadius(1)
    inst.Light:SetFalloff(5)
    inst.Light:SetIntensity(0.1)
    inst.Light:SetColour(1,1,1)
    inst.Light:Enable(true)

    if IsDLCEnabled(CAPY_DLC) or IsDLCEnabled(PORKLAND_DLC) then
        inst.components.equippable.walkspeedmult = 0.1
    else
        if IsDLCInstalled(REIGN_OF_GIANTS) then
            inst.components.equippable.walkspeedmult = 1.1
        end
    end

    return inst
end

return Prefab("common/inventory/ice_crown", fn, assets, prefabs)
