local assets = {
    Asset("ANIM", "anim/snow_finch_fan.zip"),
    Asset("ANIM", "anim/swap_snow_finch_fan.zip"),
    Asset("ATLAS", "images/inventoryimages/snow_finch_fan.xml"),
    Asset("IMAGE", "images/inventoryimages/snow_finch_fan.tex")
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_snow_finch_fan", "swap_snow_finch_fan")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function getspawnlocation(inst, target)
    local tarPos = target:GetPosition()
    local pos = inst:GetPosition()
    local vec = tarPos - pos
    vec = vec:Normalize()
    local dist = pos:Dist(tarPos)
    return pos + (vec * (dist * .15))
end

local function cantornado(staff, caster, target, pos)
    return target and (
        (target.components.health and target.components.combat and caster.components.combat:CanTarget(target)) 
        or (target.components.workable and not table.contains(
            {ACTIONS.NET, ACTIONS.FISH},
            target.components.workable:GetWorkAction()
        ))
    )
end
local function spawntornado(staff, target, pos)
    local owner = staff.components.inventoryitem.owner
    if owner then
        if owner.components.moisture then
            local moistureDelta = math.min(owner.components.moisture:GetMoisture(), 20)
            owner.components.moisture:DoDelta(-moistureDelta)
        end
        if owner.components.temperature then
            local currentTemp = owner.components.temperature:GetCurrent()
            local tempDelta = 30
            local newTemp = math.max(currentTemp - tempDelta, 5)  
            owner.components.temperature:SetTemperature(newTemp)
        end
    end
    
    local tornados_spawned = 0
    local spawnPos = getspawnlocation(staff, target)
    local targetPos = target:GetPosition()

    for i = 1, 3 do
        local tornado = SpawnPrefab("tornado")
        if tornado then
            tornados_spawned = tornados_spawned + 1
            tornado.WINDSTAFF_CASTER = owner
            local angle = i * (2 * PI / 3)
            local offset = Vector3(math.cos(angle), 0, math.sin(angle)) * 2
            tornado.Transform:SetPosition((spawnPos + offset):Get())
            tornado.components.knownlocations:RememberLocation("target", targetPos)
        end
    end
    if tornados_spawned > 0 then
        staff.components.finiteuses:Use(1)
        if owner and owner.components.talker then
            if TUNING.LANGUAGE == "English" then
                owner.components.talker:Say("Be careful! got windy!")
            elseif TUNING.LANGUAGE == "Chinese" then
                owner.components.talker:Say("当心！起风了！")
            end
        end
    end
end

local function OnFinished(inst)
    inst:Remove()
end

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)

    if SaveGameIndex:IsModeShipwrecked() or SaveGameIndex:IsModePorkland() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    inst.AnimState:SetBank("snow_finch_fan")
    inst.AnimState:SetBuild("snow_finch_fan")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/snow_finch_fan.xml"

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(10)
    inst.components.finiteuses:SetUses(10)
    inst.components.finiteuses:SetOnFinished(OnFinished)

    inst:AddComponent("spellcaster")
    inst.components.spellcaster.canuseontargets = true
    inst.components.spellcaster.canusefrominventory = false
    inst.components.spellcaster:SetSpellTestFn(cantornado)
    inst.components.spellcaster:SetSpellFn(spawntornado)
    inst.components.spellcaster.castingstate = "castspell_tornado"
    inst.components.spellcaster.actiontype = "SCIENCE"

    inst:AddTag("nopunch")

    return inst
end

return Prefab("common/inventory/snow_finch_fan", fn, assets)