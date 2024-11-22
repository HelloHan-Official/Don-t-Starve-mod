local assets =
{
    Asset("ANIM", "anim/paper.zip"),
    Asset("ATLAS", "images/inventoryimages/paper.xml"), 
    Asset("IMAGE", "images/inventoryimages/paper.tex"), 
}

local prefabs = {}

local function fn(Sim)
    local inst = CreateEntity() 
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    
    anim:SetBank("paper")
    anim:SetBuild("paper")
    anim:PlayAnimation("idle")
    
    MakeInventoryPhysics(inst)
    MakeSmallBurnable(inst)
    MakeSmallPropagator(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst:AddTag("paper")
    inst:AddTag("cattoy")
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "paper"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/paper.xml"

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM 

    return inst
end

return Prefab("common/inventory/paper", fn, assets)
