--蓝莓系列
local blueberry_assets = {
    Asset("ANIM", "anim/blueberry.zip"),    
    Asset("ANIM", "anim/blueberry_cooked.zip"),    
    Asset("IMAGE", "images/inventoryimages/blueberry.tex"),    
    Asset("ATLAS", "images/inventoryimages/blueberry.xml"),    
    Asset("IMAGE", "images/inventoryimages/blueberry_cooked.tex"),    
    Asset("ATLAS", "images/inventoryimages/blueberry_cooked.xml"), 
}

local blueberry_cake_assets = {
    Asset("ANIM", "anim/blueberry_cake.zip"), 
    Asset("IMAGE", "images/inventoryimages/blueberry_cake.tex"), 
    Asset("ATLAS", "images/inventoryimages/blueberry_cake.xml"), 
}

local blueberry_cookies_assets = {
    Asset("ANIM", "anim/blueberry_cookies.zip"),  
    Asset("IMAGE", "images/inventoryimages/blueberry_cookies.tex"), 
    Asset("ATLAS", "images/inventoryimages/blueberry_cookies.xml"),  
}

local blueberry_tart_assets = {
    Asset("ANIM", "anim/blueberry_tart.zip"),
    Asset("IMAGE", "images/inventoryimages/blueberry_tart.tex"),
    Asset("ATLAS", "images/inventoryimages/blueberry_tart.xml"),
}

local blueberry_juice_assets = {
    Asset("ANIM", "anim/blueberry_juice.zip"),  
    Asset("IMAGE", "images/inventoryimages/blueberry_juice.tex"),  
    Asset("ATLAS", "images/inventoryimages/blueberry_juice.xml"),  
}

local blueberry_fish_soup_assets = {
    Asset("ANIM", "anim/blueberry_fish_soup.zip"),  
    Asset("IMAGE", "images/inventoryimages/blueberry_fish_soup.tex"), 
    Asset("ATLAS", "images/inventoryimages/blueberry_fish_soup.xml"),  
}

--草莓系列
local strawberry_assets = {
    Asset("ANIM", "anim/strawberry.zip"),  
    Asset("ANIM", "anim/strawberry_cooked.zip"),  
    Asset("IMAGE", "images/inventoryimages/strawberry.tex"),  
    Asset("ATLAS", "images/inventoryimages/strawberry.xml"),  
    Asset("IMAGE", "images/inventoryimages/strawberry_cooked.tex"),  
    Asset("ATLAS", "images/inventoryimages/strawberry_cooked.xml"),  
}

local strawberry_cake_assets = {
    Asset("ANIM", "anim/strawberry_cake.zip"),  
    Asset("IMAGE", "images/inventoryimages/strawberry_cake.tex"),  
    Asset("ATLAS", "images/inventoryimages/strawberry_cake.xml"),  
}

local strawberry_ice_cream_assets = {
    Asset("ANIM", "anim/strawberry_ice_cream.zip"),
    Asset("IMAGE", "images/inventoryimages/strawberry_ice_cream.tex"),
    Asset("ATLAS", "images/inventoryimages/strawberry_ice_cream.xml"),
}

local strawberry_frozen_assets = {
    Asset("ANIM", "anim/strawberry_frozen.zip"),
    Asset("IMAGE", "images/inventoryimages/strawberry_frozen.tex"),
    Asset("ATLAS", "images/inventoryimages/strawberry_frozen.xml"),
}

local strawberry_muffin_assets = {
    Asset("ANIM", "anim/strawberry_muffin.zip"),
    Asset("IMAGE", "images/inventoryimages/strawberry_muffin.tex"),
    Asset("ATLAS", "images/inventoryimages/strawberry_muffin.xml"),
}

local strawberry_pudding_assets = {
    Asset("ANIM", "anim/strawberry_pudding.zip"),
    Asset("IMAGE", "images/inventoryimages/strawberry_pudding.tex"),
    Asset("ATLAS", "images/inventoryimages/strawberry_pudding.xml"),
}

local prefabs = {
	"spoiled_food",
    "blueberry_cooked", 
    "strawberry_cooked"
}

local function on_eat_hot(inst, eater)
    if eater.components.temperature then
        eater.components.temperature:DoDelta(10)  
    end
end

local function on_eat_cold(inst, eater)
    if eater.components.temperature then
        eater.components.temperature:DoDelta(-10)  
    end
end

local function blueberry_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("blueberry")
    inst.AnimState:SetBuild("blueberry")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blueberry.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 1
    inst.components.edible.hungervalue = 9
    inst.components.edible.sanityvalue = 0
    inst.components.edible.foodtype = "VEGGIE"
    inst.components.edible.foodstate = "RAW"

    inst:AddComponent("tradable")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    inst:AddTag("preparedfood")
    inst:AddTag("cookable")

    inst:AddComponent("cookable")
    inst.components.cookable.product = "blueberry_cooked"

    return inst
end

local function blueberry_cooked_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("blueberry_cooked")
    inst.AnimState:SetBuild("blueberry_cooked")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blueberry_cooked.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 3
    inst.components.edible.hungervalue = 12
    inst.components.edible.sanityvalue = 1
    inst.components.edible.foodtype = "VEGGIE"
    inst.components.edible.foodstate = "COOKED"

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end

local function blueberry_cake_fn()
    local inst = CreateEntity()  
    inst.entity:AddTransform()  
    inst.entity:AddAnimState() 
    MakeInventoryPhysics(inst) 

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("blueberry_cake")
    inst.AnimState:SetBuild("blueberry_cake")
    inst.AnimState:PlayAnimation("idle") 

    inst:AddComponent("inspectable")  

    inst:AddComponent("stackable") 
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM  

    inst:AddComponent("inventoryitem") 
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blueberry_cake.xml" 

    inst:AddComponent("edible")  
    inst.components.edible.healthvalue = 20  
    inst.components.edible.hungervalue = 62.5 
    inst.components.edible.sanityvalue = 5 
    inst.components.edible.foodtype = "GENERIC"  
    inst.components.edible.foodstate = "COOKED" 

    inst:AddComponent("perishable")  
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)  
    inst.components.perishable:StartPerishing()  
    inst.components.perishable.onperishreplacement = "spoiled_food"  

    inst:AddTag("preparedfood")  

    return inst  
end

local function blueberry_cookies_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("blueberry_cookies")
    inst.AnimState:SetBuild("blueberry_cookies")
    inst.AnimState:PlayAnimation("idle")

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blueberry_cookies.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 10
    inst.components.edible.hungervalue = 25
    inst.components.edible.sanityvalue = 15
    inst.components.edible.foodtype = "VEGGIE"
    inst.components.edible.foodstate = "COOKED"

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end

local function blueberry_tart_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end
    inst.AnimState:SetBank("blueberry_tart")
    inst.AnimState:SetBuild("blueberry_tart")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blueberry_tart.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 20
    inst.components.edible.hungervalue = 62.5 
    inst.components.edible.sanityvalue = 15
    inst.components.edible.foodtype = "MEAT"
    inst.components.edible.foodstate = "COOKED"
    inst.components.edible:SetOnEatenFn(on_eat_hot) 

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end

local function blueberry_juice_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("blueberry_juice")
    inst.AnimState:SetBuild("blueberry_juice")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blueberry_juice.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 10
    inst.components.edible.hungervalue = 20
    inst.components.edible.sanityvalue = 15
    inst.components.edible.foodtype = "VEGGIE"
    inst.components.edible.foodstate = "COOKED"
    inst.components.edible:SetOnEatenFn(on_eat_cold)  

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end

local function blueberry_fish_soup_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("blueberry_fish_soup")
    inst.AnimState:SetBuild("blueberry_fish_soup")
    inst.AnimState:PlayAnimation("idle")

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blueberry_fish_soup.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 30
    inst.components.edible.hungervalue = 62.5 
    inst.components.edible.sanityvalue = 15
    inst.components.edible.foodtype = "MEAT"
    inst.components.edible.foodstate = "COOKED"
    inst.components.edible:SetOnEatenFn(on_eat_hot)

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end
--草莓系列
local function strawberry_fn()
    local inst = CreateEntity()  
    inst.entity:AddTransform()  
    inst.entity:AddAnimState()  
    MakeInventoryPhysics(inst)  

    -- 处理水里的动画
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("strawberry")
    inst.AnimState:SetBuild("strawberry")
    inst.AnimState:PlayAnimation("idle")  

    inst:AddComponent("inspectable")  
    inst:AddComponent("stackable")  
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM 

    inst:AddComponent("inventoryitem")  
    inst.components.inventoryitem.atlasname = "images/inventoryimages/strawberry.xml"  

    inst:AddComponent("edible")  
    inst.components.edible.healthvalue = 1  
    inst.components.edible.hungervalue = 9 
    inst.components.edible.sanityvalue = 0  
    inst.components.edible.foodtype = "VEGGIE"  
    inst.components.edible.foodstate = "RAW"  
    inst:AddComponent("perishable")  
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)  
    inst.components.perishable:StartPerishing() 
    inst.components.perishable.onperishreplacement = "spoiled_food"  

    inst:AddComponent("tradable")
    
    inst:AddTag("preparedfood")  
    inst:AddTag("cookable")  

   
    inst:AddComponent("cookable")
    inst.components.cookable.product = "strawberry_cooked"

    return inst  
end

local function strawberry_cooked_fn()
    local inst = CreateEntity() 
    inst.entity:AddTransform()  
    inst.entity:AddAnimState()  
    MakeInventoryPhysics(inst)  

    -- 处理水里的动画
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("strawberry_cooked")
    inst.AnimState:SetBuild("strawberry_cooked")
    inst.AnimState:PlayAnimation("idle")  

    inst:AddComponent("inspectable")  

    inst:AddComponent("stackable") 
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM  

    inst:AddComponent("inventoryitem")  
    inst.components.inventoryitem.atlasname = "images/inventoryimages/strawberry_cooked.xml" 

    inst:AddComponent("edible")  
    inst.components.edible.healthvalue = 3  
    inst.components.edible.hungervalue = 12  
    inst.components.edible.sanityvalue = 1  
    inst.components.edible.foodtype = "VEGGIE"  
    inst.components.edible.foodstate = "COOKED"  

    inst:AddComponent("perishable")  
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)  
    inst.components.perishable:StartPerishing()  
    inst.components.perishable.onperishreplacement = "spoiled_food"  

    return inst  
end

local function strawberry_cake_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    -- 处理水里的动画
    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("strawberry_cake")
    inst.AnimState:SetBuild("strawberry_cake")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/strawberry_cake.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 20
    inst.components.edible.hungervalue = 62.5 
    inst.components.edible.sanityvalue = 15
    inst.components.edible.foodtype = "GENERIC"
    inst.components.edible.foodstate = "COOKED"

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    inst:AddTag("preparedfood")

    return inst
end

local function strawberry_ice_cream_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("strawberry_ice_cream")
    inst.AnimState:SetBuild("strawberry_ice_cream")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/strawberry_ice_cream.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 15
    inst.components.edible.hungervalue = 25
    inst.components.edible.sanityvalue = 20
    inst.components.edible.foodtype = "VEGGIE"
    inst.components.edible.foodstate = "COOKED"
    inst.components.edible:SetOnEatenFn(on_eat_cold)

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERFAST)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end

local function strawberry_frozen_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("strawberry_frozen")
    inst.AnimState:SetBuild("strawberry_frozen")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/strawberry_frozen.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 20
    inst.components.edible.hungervalue = 10
    inst.components.edible.sanityvalue = 30
    inst.components.edible.foodtype = "VEGGIE"
    inst.components.edible.foodstate = "COOKED"
    inst.components.edible:SetOnEatenFn(on_eat_cold)

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end

local function strawberry_muffin_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("strawberry_muffin")
    inst.AnimState:SetBuild("strawberry_muffin")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/strawberry_muffin.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 20
    inst.components.edible.hungervalue = 62.5 
    inst.components.edible.sanityvalue = 10
    inst.components.edible.foodtype = "VEGGIE"
    inst.components.edible.foodstate = "COOKED"

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end

local function strawberry_pudding_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("strawberry_pudding")
    inst.AnimState:SetBuild("strawberry_pudding")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/strawberry_pudding.xml"

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 20
    inst.components.edible.hungervalue = 20
    inst.components.edible.sanityvalue = 5
    inst.components.edible.foodtype = "VEGGIE"
    inst.components.edible.foodstate = "COOKED"
    
    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    return inst
end

return 
--蓝莓系列
Prefab("common/inventory/blueberry", blueberry_fn, blueberry_assets, prefabs),
Prefab("common/inventory/blueberry_cooked", blueberry_cooked_fn, blueberry_assets), 
Prefab( "common/inventory/blueberry_cake", blueberry_cake_fn, blueberry_cake_assets, prefabs),
Prefab( "common/inventory/blueberry_cookies", blueberry_cookies_fn, blueberry_cookies_assets, prefabs),
Prefab( "common/inventory/blueberry_tart", blueberry_tart_fn, blueberry_tart_assets, prefabs),
Prefab( "common/inventory/blueberry_juice", blueberry_juice_fn, blueberry_juice_assets, prefabs),
Prefab( "common/inventory/blueberry_fish_soup", blueberry_fish_soup_fn, blueberry_fish_soup_assets, prefabs),
--草莓系列
Prefab("common/inventory/strawberry", strawberry_fn, strawberry_assets, prefabs),
Prefab("common/inventory/strawberry_cooked", strawberry_cooked_fn, strawberry_assets),
Prefab("common/inventory/strawberry_cake", strawberry_cake_fn, strawberry_cake_assets, prefabs),
Prefab("common/inventory/strawberry_ice_cream", strawberry_ice_cream_fn, strawberry_ice_cream_assets, prefabs),
Prefab("common/inventory/strawberry_frozen", strawberry_frozen_fn, strawberry_frozen_assets, prefabs),
Prefab("common/inventory/strawberry_muffin", strawberry_muffin_fn, strawberry_muffin_assets, prefabs),
Prefab("common/inventory/strawberry_pudding", strawberry_pudding_fn, strawberry_pudding_assets, prefabs)