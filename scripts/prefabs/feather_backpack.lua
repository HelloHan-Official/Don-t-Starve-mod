local assets = {
    Asset("ANIM", "anim/feather_backpack.zip"),
    Asset("ATLAS", "images/inventoryimages/feather_backpack.xml"),
    Asset("IMAGE", "images/inventoryimages/feather_backpack.tex"),
    

    }

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body", "feather_backpack", "swap_body")
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

for y = 0, 4 do
    table.insert(slotpos, Vector3(-162, -y * 75 + 115, 0))
    table.insert(slotpos, Vector3(-162 + 75, -y * 75 + 115, 0))
end

local function fn()

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()

    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("feather_backpack.tex")

    MakeInventoryPhysics(inst)

    --因为是羽毛做的所所以会被点燃
    MakeSmallBurnable(inst)
    MakeSmallPropagator(inst)
    inst.components.burnable:SetOnBurntFn(function()
        if inst.inventoryitemdata then
            inst.inventoryitemdata = nil
        end

        if inst.components.container then
            inst.components.container:DropEverything()
            inst.components.container:Close()
            inst:RemoveComponent("container")
        end

        local ash = SpawnPrefab("ash")
        ash.Transform:SetPosition(inst.Transform:GetWorldPosition())

        inst:Remove()
    end)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst)
    end

    inst.AnimState:SetBank("feather_backpack")
    inst.AnimState:SetBuild("feather_backpack")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("backpack")

    inst:AddComponent("inspectable")

    inst:AddComponent("modfloatable")
    inst.components.modfloatable.size = "small"

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.nosink = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/feather_backpack.xml"
    inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/backpack"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY

    --装备上后会获得0.1的移速加成
    if IsDLCEnabled(CAPY_DLC) or IsDLCEnabled(PORKLAND_DLC) then
        inst.components.equippable.walkspeedmult = 0.1
    else
        if IsDLCInstalled(REIGN_OF_GIANTS) then
            inst.components.equippable.walkspeedmult = 1.1
        end
    end

    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos)
    inst.components.container.widgetslotpos = slotpos
    inst.components.container.widgetanimbank = "ui_backpack_2x5"
    inst.components.container.widgetanimbuild = "ui_backpack_2x5"
    inst.components.container.widgetpos = Vector3(-5, -70, 0)
    inst.components.container.side_widget = true
    inst.components.container.type = "pack"

    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    return inst
end
return Prefab("conmon/inventory/feather_backpack", fn, assets)

