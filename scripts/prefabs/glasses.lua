local assets = {
    Asset("ANIM", "anim/glasses.zip"), 
    Asset("ATLAS", "images/inventoryimages/glasses.xml"), 
    Asset("IMAGE", "images/inventoryimages/glasses.tex")
}

local prefabs = {}

local function onequip(inst, owner)

    owner.AnimState:OverrideSymbol("swap_hat", "glasses", "swap_hat")

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
    owner.AnimState:OverrideSymbol("swap_hat", "glasses", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Hide("HAIR_HAT")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    owner.AnimState:Show("HEAD")
    owner.AnimState:Hide("HEAD_HAIR")

    if inst.components.fueled then
        inst.components.fueled:StartConsuming()
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

    inst.AnimState:SetBank("glasses") -- 动画的总名字
    inst.AnimState:SetBuild("glasses") -- smcl文件的名字
    inst.AnimState:PlayAnimation("idle") -- 丢地上的动画 

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(1200, 0.85)

    inst:AddComponent("inspectable")
    
    inst:AddComponent("modfloatable")
    inst.components.modfloatable.size = "small"

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.nosink = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/glasses.xml"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable:SetOnEquip(opentop_onequip)

    -- 装备后san值的回复每分钟1.33san
    inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY
    -- 装备后有0.1的移速加成
    if IsDLCEnabled(CAPY_DLC) or IsDLCEnabled(PORKLAND_DLC) then

        inst.components.equippable.walkspeedmult = 0.1
    else
        if IsDLCInstalled(REIGN_OF_GIANTS) then
            inst.components.equippable.walkspeedmult = 1.1
        end
    end

    return inst
end
return Prefab("common/inventory/glasses", fn, assets, prefabs)
