local assets = {
    Asset("ANIM", "anim/seeds.zip"),
    Asset("ANIM", "anim/strawberry.zip"),
    Asset("IMAGE", "images/inventoryimages/strawberry_seeds.tex"),
    Asset("ATLAS", "images/inventoryimages/strawberry_seeds.xml"),
}

local prefabs = {"spoiled_food"}

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    MakeInventoryPhysics(inst)
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("seeds")
    inst.AnimState:SetBuild("seeds")
    inst.AnimState:SetRayTestOnBB(true)
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("edible")
    inst.components.edible.foodtype = "SEEDS"
    inst.components.edible.foodstate = "RAW"
    inst.components.edible.healthvalue = TUNING.HEALING_TINY
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/strawberry_seeds.xml"

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    inst:AddComponent("cookable")
    inst.components.cookable.product = "seeds_cooked"

    inst:AddComponent("bait")

    inst:AddComponent("plantable")
    inst.components.plantable.growtime = TUNING.SEEDS_GROW_TIME * 1.5
    inst.components.plantable.product = "strawberry"

    return inst
end

return Prefab("common/inventory/strawberry_seeds", fn, assets, prefabs)
