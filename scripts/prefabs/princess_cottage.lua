require "prefabutil"

local assets = {Asset("ANIM", "anim/princess_cottage.zip"),
                Asset("ATLAS", "images/inventoryimages/princess_cottage.xml"),
                Asset("IMAGE", "images/inventoryimages/princess_cottage.tex")}

local function onnear(inst)
    inst.AnimState:PlayAnimation("see", false)
    inst.Light:Enable(true)
end

local function onfar(inst)
    inst.AnimState:PlayAnimation("idle")
    inst.Light:Enable(false)
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
    inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
    inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation("idle", true)
end

local function onfinished(inst)
    inst.AnimState:PlayAnimation("idle")
    inst:ListenForEvent("animover", function(inst)
        inst:Remove()
    end)
    inst.SoundEmitter:PlaySound("dontstarve/common/tent_dis_pre")
    inst.persists = false
    inst:DoTaskInTime(16 * FRAMES, function()
        inst.SoundEmitter:PlaySound("dontstarve/common/tent_dis_twirl")
    end)
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle", true)
    inst.SoundEmitter:PlaySound("dontstarve/common/craftable/tent")
end

local custom_strings = {
    ANNOUNCE_NOSLEEP_SUMMER = {
        English = "I can only sleep during the day in summer.",
        Chinese = "只有在夏天才能白天睡觉哦。"
    },
    ANNOUNCE_NODANGERSLEEP = {
        English = "It's too dangerous to sleep now!",
        Chinese = "周围有怪物在游荡！不要睡觉哦。"
    },
    ANNOUNCE_NOHUNGERSLEEP = {
        English = "I'm too hungry to sleep.",
        Chinese = "肚子好饿呀！先填饱肚子吧。"
    }
}

local LANGUAGE = TUNING.LANGUAGE
local function GetLocalizedString(key)
    if LANGUAGE == "English" then
        return custom_strings[key].English
    else
        return custom_strings[key].Chinese
    end
end

local SLEEP_DIST_MONSTER_MUST_BE_FURTHER_THAN = 20

local function CanSleepAtNight(inst)
    return true
end

local function CanSleepAtDay(inst)
    local world = GetWorld()
    return world.components.seasonmanager:IsSummer()
end

local function onsleep(inst, sleeper)
    local isday = GetClock():IsDay()

    if isday and not CanSleepAtDay(inst) then
        if sleeper.components.talker then
            sleeper.components.talker:Say(GetLocalizedString("ANNOUNCE_NOSLEEP_SUMMER"))
        end
        return
    end

    -- 检查附近的怪物
    local nearest_monster = FindEntity(sleeper, SLEEP_DIST_MONSTER_MUST_BE_FURTHER_THAN, function(monster)
        return monster:HasTag("monster") and not monster:HasTag("player") and
                   not (monster.components.follower and monster.components.follower.leader == sleeper)
    end)

    if nearest_monster then
        if sleeper.components.talker then
            sleeper.components.talker:Say(GetLocalizedString("ANNOUNCE_NODANGERSLEEP"))
        end
        return
    end

    if sleeper.components.hunger.current < TUNING.CALORIES_SMALL then
        sleeper.components.talker:Say(GetLocalizedString("ANNOUNCE_NOHUNGERSLEEP"))
        return
    end

    sleeper.components.health:SetInvincible(true)
    sleeper.components.playercontroller:Enable(false)

    GetPlayer().HUD:Hide()
    TheFrontEnd:Fade(false, 1)

    inst:DoTaskInTime(1.2, function()
        GetPlayer().HUD:Show()
        TheFrontEnd:Fade(true, 1)

        local is_summer = GetWorld().components.seasonmanager:IsSummer()

        local sanity_delta = isday and (is_summer and 10) or (is_summer and 20 or 33)
        local health_delta = isday and (is_summer and 10) or (is_summer and 20 or 35)
        local mana_delta = (40)
        -- 白天:扣除 75（夏季）    夜晚:扣除65（夏季）或 75（非夏季）。
        local hunger_delta = isday and (is_summer and -75) or (is_summer and -65 or -75)
        -- san值处理
        if sleeper.components.sanity then
            sleeper.components.sanity:DoDelta(sanity_delta)
        end
        -- 生命值处理
        if sleeper.components.health then
            sleeper.components.health:DoDelta(health_delta, false, "princess_cottage", true)
        end
        -- 魔力值处理
        if sleeper.components.mana then
            local equippedItem = sleeper.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
            if equippedItem and equippedItem.prefab == "ribbon_hat" then
                sleeper.components.mana:DoDelta(mana_delta * 2)
            else
                sleeper.components.mana:DoDelta(mana_delta)
            end
        end
        -- 饥饿值处理
        if sleeper.components.hunger then
            sleeper.components.hunger:DoDelta(hunger_delta, false, true)
        end
        -- 温度处理
        if sleeper.components.temperature then
            local current_temp = sleeper.components.temperature.current
            local target_temp = TUNING.TARGET_SLEEP_TEMP
            local comfort_range = is_summer and 10 or 5

            if current_temp < target_temp - comfort_range then
                sleeper.components.temperature:SetTemperature(target_temp - comfort_range)
            elseif current_temp > target_temp + comfort_range then
                sleeper.components.temperature:SetTemperature(target_temp + comfort_range)
            end
        end

        inst.components.finiteuses:Use(is_summer and 1 or 2)

        if isday then
            GetClock():MakeNextDusk()
        else
            GetClock():MakeNextDay()
        end

        sleeper.components.health:SetInvincible(false)
        sleeper.components.playercontroller:Enable(true)
        sleeper.sg:GoToState("wakeup")
    end)
end

local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    MakeObstaclePhysics(inst, 2)
    inst:AddTag("structure")
    inst:AddTag("tent")

    anim:SetBank("jh")
    anim:SetBuild("jh")
    anim:PlayAnimation("idle", true)

    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("princess_cottage.tex")

    inst.Transform:SetScale(1.00, 1.00, 1.00)

    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(5)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(20)
    inst.components.finiteuses:SetUses(20)
    inst.components.finiteuses:SetOnFinished(onfinished)

    inst:AddComponent("sleepingbag")
    inst.components.sleepingbag.onsleep = onsleep

    inst:ListenForEvent("onbuilt", onbuilt)

    local light = inst.entity:AddLight()
    inst.Light:Enable(false)
    inst.Light:SetRadius(2)
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(0.5)
    inst.Light:SetColour(0 / 255, 121 / 255, 240 / 255)

    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(5, 6)
    inst.components.playerprox:SetOnPlayerNear(onnear)
    inst.components.playerprox:SetOnPlayerFar(onfar)

    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aura = 0.5

    return inst
end

return Prefab("common/objects/princess_cottage", fn, assets),
    MakePlacer("common/princess_cottage_placer", "jh", "jh", "idle")
