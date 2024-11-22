local assets = {
    Asset("ANIM", "anim/card.zip"),
    Asset("ATLAS", "images/inventoryimages/card.xml"),
    Asset("IMAGE", "images/inventoryimages/card.tex"),
}

local function OnBlocked(owner)
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body", "card", "swap_body")
    inst:ListenForEvent("blocked", OnBlocked, owner)

    if inst.equip_count == nil then
        inst.equip_count = 0
    end
    inst.equip_count = inst.equip_count + 1
    if inst.equip_count >= 3 then
        owner:AddComponent("talker")
        owner.components.talker:Say(TUNING.LANGUAGE == "English" and "Press the z button to switch skins" or "按下按键Z就能切换皮肤哦",4)
        inst.equip_count = 0                             
    end
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
    inst:RemoveEventCallback("blocked", OnBlocked, owner)
end

local function fn(Sim)

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModeShipwrecked() then
        MakeInventoryFloatable(inst)
    end

    inst.AnimState:SetBank("card")
    inst.AnimState:SetBuild("card")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")

    inst:AddComponent("modfloatable")
    inst.components.modfloatable.size = "small"

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.nosink = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/card.xml"

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(1200, 0.85)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY

    return inst
end
return Prefab("common/inventory/card", fn, assets)
