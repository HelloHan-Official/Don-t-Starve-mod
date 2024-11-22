local assets = {
    Asset("ANIM", "anim/ribbon_hat.zip"), 
    Asset("ATLAS", "images/inventoryimages/ribbon_hat.xml"), 
    Asset("IMAGE", "images/inventoryimages/ribbon_hat.tex")
}

local prefabs = {}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", "ribbon_hat", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR") 

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD_HAIR")
        owner.AnimState:Show("HEAD")
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

local function AcceptTest(inst, item)
    return item.prefab == "thulecite" 
end

local function OnAccept(inst, giver, item)
    if item.prefab == "thulecite" then
        if inst.components.armor then
            local repair_amount = 350  
            local current = inst.components.armor.condition
            local max = inst.components.armor.maxcondition
            inst.components.armor:SetCondition(math.min(current + repair_amount, max))
        end
    end
end

local function fn(Sim)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst)
    end

    inst.AnimState:SetBank("ribbon_hat")
    inst.AnimState:SetBuild("ribbon_hat")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(1440, 0.9)

    inst:AddComponent("inspectable")

    inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
    inst.components.insulator:SetInsulation(200)

    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0.8)

    inst:AddComponent("modfloatable")
    inst.components.modfloatable.size = "small"

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.nosink = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/ribbon_hat.xml"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(AcceptTest)
    inst.components.trader.onaccept = OnAccept

    inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY 

    if IsDLCEnabled(CAPY_DLC) or IsDLCEnabled(PORKLAND_DLC) then
        inst.components.equippable.walkspeedmult = 0.15
    else
        if IsDLCInstalled(REIGN_OF_GIANTS) then
            inst.components.equippable.walkspeedmult = 1.15
        end
    end

    return inst
end

return Prefab("common/inventory/ribbon_hat", fn, assets, prefabs)
