local assets = {
    Asset("ANIM", "anim/valise.zip"),
    Asset("ATLAS", "images/inventoryimages/valise.xml"),
    Asset("IMAGE", "images/inventoryimages/valise.tex"),
    --中文语音
    Asset("SOUNDPACKAGE", "sound/try.fev"),
    Asset("SOUND", "sound/try.fsb"),
}

local function onopen(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_open", "open")
end
local function onclose(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/backpack_close", "close")
end

local slotpos = {}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(slotpos, Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

-- 防止把手提箱放进手提箱
local function itemtest(inst, item, slot)
    inst:AddComponent("talker")
    if item.prefab == "valise" then
        -- 根据游戏中的语言显示不同的消息
        if TUNING.LANGUAGE == "English" then
            inst.components.talker:Say("Sherry knows you are smart, but this is wrong o(*≧д≦)o!!")
        elseif TUNING.LANGUAGE == "Chinese" then
            inst.components.talker:Say("雪莉知道你很聪明,但这样是不对哦o(*≧д≦)o!!")

            if TUNING.SHERRY_SOUND == "sherry_cn_sound" then
                inst.SoundEmitter:PlaySound("try/try_cn/try")
            end
        end
        return false
    end
    if item.prefab == "oinc" or item.prefab == "oinc10" or item.prefab == "oinc100" then
       
        if TUNING.LANGUAGE == "English" then
            inst.components.talker:Say("Don't put money in it, it will be stolen by thieves.")
        elseif TUNING.LANGUAGE == "Chinese" then
            inst.components.talker:Say("不要把钱放进去,会被小偷偷走的。")
        end
        return false
    end
    return true
end
local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()

    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("valise.tex")

    MakeInventoryPhysics(inst)

    inst:AddTag("structure")
    inst:AddTag("irreplaceable")

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("valise")
    inst.AnimState:SetBuild("valise")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")
    
    inst:AddTag("backpack")
    inst:AddTag("waterproofer")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/valise.xml"
    inst.components.inventoryitem.cangoincontainer = true
    inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/backpack"

    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_MED)

    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos)
    inst.components.container.widgetslotpos = slotpos
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    if TUNING.VALISE =="left" then
        inst.components.container.widgetpos = Vector3(-730, -370, 0) 
    elseif TUNING.VALISE =="center" then
        inst.components.container.widgetpos = Vector3(0, 200, 0) 
    elseif TUNING.VALISE =="right" then
        inst.components.container.widgetpos = Vector3(730, -370, 0)    
    end
    inst.components.container.side_align_tip = 160
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
    inst.components.container.itemtestfn = itemtest

    return inst
end

return Prefab("common/inventory/valise", fn, assets)
