local assets = {
    Asset("ANIM", "anim/broken_sword.zip"),
    Asset("ANIM", "anim/swap_broken_sword.zip"),
    Asset("ATLAS", "images/inventoryimages/broken_sword.xml"),
    Asset("IMAGE", "images/inventoryimages/broken_sword.tex")
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_broken_sword", "swap_broken_sword")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onattack(inst, attacker, target)
    if TUNING.WHETHER_RANDOM == "true" then
        local randomdamage = math.random(25, 50) 
        inst.components.weapon:SetDamage(randomdamage)
    else
        inst.components.weapon:SetDamage(35)   
    end
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function onperish(inst)
    inst:Remove()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("broken_sword")
    inst.AnimState:SetBuild("broken_sword")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("sharp")
    inst:AddTag("tool")

    if TUNING.CHOP_HACK == "true" then
        inst:AddComponent("tool")
        inst.components.tool:SetAction(ACTIONS.CHOP, 1.5)
        if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
            inst.components.tool:SetAction(ACTIONS.HACK, 1.5)
        end
    end

    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(250)
    inst.components.finiteuses:SetUses(250)
    inst.components.finiteuses:SetOnFinished(onperish)
    inst.components.finiteuses:SetConsumption(ACTIONS.CHOP, 1)

    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
        inst.components.finiteuses:SetConsumption(ACTIONS.HACK, 1)
    end

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/broken_sword.xml"

    inst:AddComponent("weapon")
    inst.components.weapon:SetOnAttack(onattack)  
	
	if TUNING.WHETHER_RANDOM == "true" then
        local initial_damage = math.random(25, 50)
        inst.components.weapon:SetDamage(initial_damage)
    else
        inst.components.weapon:SetDamage(35)
    end

    return inst
end

return Prefab("broken_sword", fn, assets)
