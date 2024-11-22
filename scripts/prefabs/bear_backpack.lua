local assets = {
    Asset("ANIM", "anim/bear_backpack.zip"),
    Asset("ATLAS", "images/inventoryimages/bear_backpack.xml"),
    Asset("IMAGE", "images/inventoryimages/bear_backpack.tex"),
    
    }

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body", "bear_backpack", "swap_body")
    owner.components.inventory:SetOverflow(inst)
    inst.components.container:Open(owner)
end

local function onopen(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_open", "open")
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
    owner.components.inventory:SetOverflow(nil)
    inst.components.container:Close(owner)
end

local function onclose(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_close", "open")
end

local slotpos = {}

for y = 0, 6 do
	table.insert(slotpos, Vector3(-162, -y*75 + 240 ,0))
	table.insert(slotpos, Vector3(-162 +75, -y*75 + 240 ,0))
end


local function fn()

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()

    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("bear_backpack.tex")

    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst)
    end

    inst.AnimState:SetBank("bear_backpack")
    inst.AnimState:SetBuild("bear_backpack")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("backpack")

    inst:AddComponent("inspectable")

    inst:AddComponent("modfloatable")
    inst.components.modfloatable.size = "small"

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.nosink = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bear_backpack.xml"
    inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/backpack"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY

    --同样是每分钟回复1.33san值
    inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY

    --保暖效果240点
    inst:AddComponent("insulator")
    inst.components.insulator.insulation = 240

    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos)
    inst.components.container.widgetslotpos = slotpos
    inst.components.container.widgetanimbank = "ui_krampusbag_2x8"
    inst.components.container.widgetanimbuild = "ui_krampusbag_2x8"
    inst.components.container.widgetpos = Vector3(-5, -75, 0)
    inst.components.container.side_widget = true
    inst.components.container.type = "pack"

    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    return inst
end

return Prefab("conmon/inventory/bear_backpack", fn, assets)

