-- 公主技能
local function CalculateSkillUses(level)
    return math.min(2 + math.floor(level / 40) * 2, 12)
end

local function CalculateCooldown(level)
    return math.max(180 - math.floor(level / 40) * 30, 30)
    -- return math.min(180 - math.floor(level / 40) * 30, 5)
end

local function TriggerIceSpike(inst)
    local equippedItem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    if equippedItem and equippedItem.prefab == "ice_crown" then
        if inst.skillUses > 0 then
            if inst.components.hunger.current >= 21 then
                local currentMana = inst.components.mana:GetCurrent()
                if currentMana >= 20 then
                    if inst.components.inventory:Has("ice", 1) then
                        local pos = inst:GetPosition()

                        for i = 1, math.random(25, 30) do
                            local fx = SpawnPrefab("icespike_fx_" .. math.random(1, 4))
                            fx.Transform:SetPosition(pos.x + math.random(-5, 5), 0, pos.z + math.random(-5, 5))
                        end

                        local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 6, nil, { "player", "shadowcreature" })
                        for _, v in pairs(ents) do
                            if v.components.freezable then
                                v.components.health:DoDelta(-30 - inst.level * 0.75)
                                v.components.freezable:AddColdness(2)
                                v.components.freezable:SpawnShatterFX()
                                v:AddTag("ice2")
                            end
                        end

                        inst.skillUses = inst.skillUses - 1
                        inst.components.hunger:DoDelta(-20)
                        inst.components.mana:DoDelta(-30)

                        inst.components.inventory:ConsumeByName("ice", 1)

                        if inst.skillUses == 0 then
                            inst.skillCooldown = CalculateCooldown(inst.level)
                        end
                    else
                        if TUNING.LANGUAGE == "English" then
                            inst.components.talker:Say("You need an ice block to use this skill!")
                        elseif TUNING.LANGUAGE == "Chinese" then
                            inst.components.talker:Say("还需要一个冰块哦！")
                        end
                    end
                else
                    if TUNING.LANGUAGE == "English" then
                        inst.components.talker:Say(string.format(
                                "The magic value is not enough. The current magic value is:%d ", currentMana))
                    elseif TUNING.LANGUAGE == "Chinese" then
                        inst.components.talker:Say(string.format("魔力值不够呀,当前魔力值:%d", currentMana))
                    end
                end
            else
                if TUNING.LANGUAGE == "English" then
                    inst.components.talker:Say("You can't use the ice spike skill if you're too hungry!")
                elseif TUNING.LANGUAGE == "Chinese" then
                    inst.components.talker:Say("太饿的话是不能用冰刺技能的！")
                end
            end
        elseif inst.skillCooldown > 0 then
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say(string.format("Ice spike skill on cooldown. %d seconds remaining.",
                        math.ceil(inst.skillCooldown)))
            elseif TUNING.LANGUAGE == "Chinese" then
                inst.components.talker:Say(string.format("冰刺技能冷却中,还需 %d 秒。",
                        math.ceil(inst.skillCooldown)))
            end
        else
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say("No more ice spike skill uses left!")
            elseif TUNING.LANGUAGE == "Chinese" then
                inst.components.talker:Say("冰刺技能使用次数已耗尽！")
            end
        end
    end
end

local function UpdateSkillCooldown(inst)
    inst:DoPeriodicTask(1, function()
        if inst.skillCooldown > 0 then
            inst.skillCooldown = inst.skillCooldown - 1
            if inst.skillCooldown == 0 then
                inst.skillUses = CalculateSkillUses(inst.level)
                if TUNING.LANGUAGE == "English" then
                    inst.components.talker:Say(string.format("Ice spike skill ready!", inst.skillUses))
                elseif TUNING.LANGUAGE == "Chinese" then
                    inst.components.talker:Say(string.format("冰刺技能准备就绪!", inst.skillUses))
                end
            end
        end
    end)
end

-- 眼镜技能
local NO_AGGRO_DURATION = 10
local COOLDOWN_DURATION = 120
local function UpdateAggroTime(inst)
    if inst.aggro_time_left > 0 then
        inst.aggro_time_left = inst.aggro_time_left - 1
        if inst.aggro_time_left <= 0 then
            inst.no_aggro = false
            inst:RemoveTag("notarget")
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say("I'm going to be discovered!")
            else
                inst.components.talker:Say("完蛋我要被发现了！")
            end
            inst.aggro_time_left = 0
        else
            inst:DoTaskInTime(1, function()
                UpdateAggroTime(inst)
            end)
        end
    end
end

local function UpdateCooldownTime(inst)
    if inst.aggro_cooldown_time > 0 then
        inst.aggro_cooldown_time = inst.aggro_cooldown_time - 1
        if inst.aggro_cooldown_time <= 0 then
            inst.aggro_cooldown = false
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say("Stealth skills are ready.")
            else
                inst.components.talker:Say("隐身技能已经准备好。")
            end
            inst.aggro_cooldown_time = 0
        else
            inst:DoTaskInTime(1, function()
                UpdateCooldownTime(inst)
            end)
        end
    end
end

local function NoAggroMode(inst)
    local equippedItem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    if equippedItem and equippedItem.prefab == "glasses" then
        local currentMana = inst.components.mana:GetCurrent()
        if currentMana >= 40 then
            if inst.aggro_cooldown then
                if TUNING.LANGUAGE == "English" then
                    inst.components.talker:Say(string.format("No hatred mode is cooling down, time remaining: %d ",
                            inst.aggro_cooldown_time))
                else
                    inst.components.talker:Say(string.format("隐身技能冷却中，剩余时间: %d 秒",
                            inst.aggro_cooldown_time))
                end
                return
            end

            inst.no_aggro = not inst.no_aggro
            if inst.no_aggro then
                inst:AddTag("notarget")
                if TUNING.LANGUAGE == "English" then
                    inst.components.talker:Say("No one will notice me!")
                else

                    inst.components.talker:Say("不会有人注意到我的!")
                end
                inst.components.sanity:DoDelta(-5)
                inst.components.mana:DoDelta(-40)
                inst.aggro_time_left = NO_AGGRO_DURATION + math.min(inst.level * 0.1, 20)
                UpdateAggroTime(inst)

                inst.aggro_cooldown = true
                inst.aggro_cooldown_time = COOLDOWN_DURATION
                UpdateCooldownTime(inst)
            else
                inst:RemoveTag("notarget")
                if TUNING.LANGUAGE == "English" then
                    inst.components.talker:Say("I'm going to be discovered!")
                else
                    inst.components.talker:Say("完蛋我要被发现了！")
                end
                inst.aggro_time_left = 0
            end
        else
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say(string.format(
                        "The magic value is not enough. The current magic value is:%d ", currentMana))
            elseif TUNING.LANGUAGE == "Chinese" then
                inst.components.talker:Say(string.format("魔力值不够哦,当前魔力值:%d", currentMana))
            end
        end
    end
end

-- 血环技能
local function Time_stops(inst)
    local equippedItem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    if equippedItem and equippedItem.prefab == "halo" then
        if not IsPaused() then
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say("Time stops!")
            else
                inst.components.talker:Say("时间停止！")
            end
            inst:DoTaskInTime(0.1, function()
                SetPause(true)
            end)
        else
            SetPause(false)
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say("Time flows again!")
            else
                inst.components.talker:Say("时间重新流动！")
            end
        end
    end
end

local function ManaIncrease(inst)
    inst:ListenForEvent("killed", function(inst, data)
        local victim = data.victim
        local equippedItem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if equippedItem and equippedItem.prefab == "ribbon_hat" then
            if victim and victim:HasTag("epic") then
                inst.components.mana:DoDelta(80)
                inst.components.talker:Say(TUNING.LANGUAGE == "English" and
                        "Defeat the boss and restore 40 points of magic power!" or
                        "魔力值恢复80点！")
            else
                if math.random() <= 0.2 then
                    inst.components.mana:DoDelta(20)
                    inst.components.talker:Say(TUNING.LANGUAGE == "English" and
                            "Defeat the boss and restore 10 points of magic power!" or
                            "魔力值恢复20点！")
                end
            end
        else
            if victim and victim:HasTag("epic") then
                inst.components.mana:DoDelta(40)
                inst.components.talker:Say(TUNING.LANGUAGE == "English" and
                        "Defeat the boss and restore 40 points of magic power!" or
                        "魔力值恢复40点！")
            else
                if math.random() <= 0.2 then
                    inst.components.mana:DoDelta(10)
                    inst.components.talker:Say(TUNING.LANGUAGE == "English" and
                            "Defeat the boss and restore 10 points of magic power!" or
                            "魔力值恢复10点！")
                end
            end
        end
    end, inst)
end
--缎带帽技能
local function Dobble_mana_increase(inst)
    local equippedItem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    if equippedItem and equippedItem.prefab == "ribbon_hat" then
        inst:AddComponent("talker")
        inst.components.talker:Say(TUNING.LANGUAGE == "English" and
                "Just wearing the ribbon hat can restore double the magic value!" or
                "缎带帽只需要佩戴就能回复双倍魔力值哦！")
    end
end
return {
    -- 冰冠技能
    TriggerIceSpike = TriggerIceSpike,
    CalculateSkillUses = CalculateSkillUses,
    CalculateCooldown = CalculateCooldown,
    UpdateSkillCooldown = UpdateSkillCooldown,
    -- 眼镜技能
    UpdateAggroTime = UpdateAggroTime,
    UpdateCooldownTime = UpdateCooldownTime,
    NoAggroMode = NoAggroMode,
    Time_stops = Time_stops,
    --缎带帽技能
    Dobble_mana_increase = Dobble_mana_increase,
    -- 魔力增加
    ManaIncrease = ManaIncrease
}
