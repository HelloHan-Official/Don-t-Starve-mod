local skills = require "sherry/skills"

local function display_status(inst)
    local levelText = ""
    if inst.level >= 0 then
        if TUNING.LANGUAGE == "English" then
            levelText = "Sherry's Level: " .. inst.level
        elseif TUNING.LANGUAGE == "Chinese" then
            levelText = "雪莉的等级: " .. inst.level .. "级"
        end
    end

    local modeText = ""
    local mode = TUNING.MODE
    if mode == "easy" then
        modeText = TUNING.LANGUAGE == "English" and " Current Difficulty: Easy Mode" or " 当前难度：轻松模式"
    elseif mode == "normal" then
        modeText = TUNING.LANGUAGE == "English" and " Current Difficulty: Normal Mode" or " 当前难度：普通模式"
    elseif mode == "hard" then
        modeText = TUNING.LANGUAGE == "English" and " Current Difficulty: Hard Mode" or " 当前难度：困难模式"
    end

    local manaText = ""
    local current_mana = inst.components.mana:GetCurrent()
    local max_mana = inst.components.mana:GetMax()
    manaText = TUNING.LANGUAGE == "English" and string.format("Current Mana: %d/%d ", current_mana, max_mana) or
                   string.format("当前魔力值: %d/%d ", current_mana, max_mana)

    local equippedItem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    local finalText = levelText .. "\n" .. modeText .. "\n" .. manaText .. "\n"

    if equippedItem then
        if equippedItem.prefab == "ice_crown" then
            finalText = finalText ..
                            (TUNING.LANGUAGE == "English" and
                                string.format("Ice Spike used! Remaining uses: %d", inst.skillUses) or
                                string.format("冰刺技能剩余次数：%d", inst.skillUses))
        elseif equippedItem.prefab == "glasses" then
            if inst.no_aggro then
                finalText = finalText ..
                                (TUNING.LANGUAGE == "English" and
                                    string.format("Remaining time in hatred-free mode: %d seconds", inst.aggro_time_left) or
                                    string.format("隐身技能剩余时间: %d 秒", inst.aggro_time_left))
            else
                finalText = finalText ..
                                (TUNING.LANGUAGE == "English" and "Hateless mode is currently not active." or
                                    "隐身技能等待启用中。")
            end
        elseif equippedItem.prefab == "halo" then
            finalText = finalText ..
                            (TUNING.LANGUAGE == "English" and "Stop time skill pending." or
                                "停止时间技能等待中。")
        elseif equippedItem.prefab == "ribbon_hat" then
            finalText = finalText ..
            (TUNING.LANGUAGE == "English" and "Now it’s double mana recovery!" or
                "现在是双倍魔力值恢复！")
        end
    else
        finalText = finalText .. (TUNING.LANGUAGE == "English" and "You need to equip a head item to see skill info!" or
                        "请装备头部道具以查看技能信息。")
    end

    if finalText ~= "" then
        inst:AddComponent("talker")
        inst.components.talker.fontsize = 25
        inst.components.talker.offset = Vector3(0, -400, 0)
        inst.components.talker:Say(finalText, 3)
        inst:AddComponent("talker")
    end
end

local function OnLoad(inst)
    local function trigger_skills()
        local equippedItem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if equippedItem and
            (equippedItem.prefab == "ice_crown" or equippedItem.prefab == "glasses" or equippedItem.prefab == "halo" or
                equippedItem.prefab == "ribbon_hat") then
            skills.TriggerIceSpike(inst)
            skills.NoAggroMode(inst)
            skills.Time_stops(inst)
            skills.Dobble_mana_increase(inst)
        else
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say(
                    "I have to wear an ice crown, rimmed glasses, blood ring, and ribbon hat before I can use skills.")
            elseif TUNING.LANGUAGE == "Chinese" then
                inst.components.talker:Say("我要戴上冰冠、边框眼镜、血环、缎带帽才可以用技能。")
            end
        end
    end

    if TUNING.SKILL == "CTRL+V" then
        local ctrlPressed = false
        TheInput:AddKeyDownHandler(KEY_LCTRL, function()
            ctrlPressed = true
        end)
        TheInput:AddKeyUpHandler(KEY_LCTRL, function()
            ctrlPressed = false
        end)
        TheInput:AddKeyUpHandler(KEY_V, function()
            if ctrlPressed then
                trigger_skills()
            end
        end)
    else
        TheInput:AddKeyUpHandler(KEY_V, trigger_skills)
    end

    local keyDownTime = 0
    local longPressThreshold = 0.5

    TheInput:AddControlHandler(CONTROL_OPEN_DEBUG_MENU, function(down)
        if down then
            keyDownTime = TheSim:GetTick()
        else
            local keyUpTime = TheSim:GetTick()
            local pressDuration = (keyUpTime - keyDownTime) / 30

            if pressDuration >= longPressThreshold then
                display_status(inst) -- 长按，显示状态
            else
                trigger_skills() -- 短按，释放技能
            end
        end
    end)

    if TUNING.VIEW_STATUS == "CTRL+X" then
        local ctrlPressed = false
        TheInput:AddKeyDownHandler(KEY_LCTRL, function()
            ctrlPressed = true
        end)
        TheInput:AddKeyUpHandler(KEY_LCTRL, function()
            ctrlPressed = false
        end)
        TheInput:AddKeyUpHandler(KEY_X, function()
            if ctrlPressed then
                display_status(inst)
            end
        end)
    else
        TheInput:AddKeyUpHandler(KEY_X, function()
            display_status(inst)
        end)
    end
    -- 以下为测试mod功能
    -- 保存游戏
    local ctrlPressed = false
    TheInput:AddKeyDownHandler(KEY_LCTRL, function()
        ctrlPressed = true
    end)
    TheInput:AddKeyUpHandler(KEY_LCTRL, function()
        ctrlPressed = false
    end)
    TheInput:AddKeyUpHandler(KEY_F1, function()
        if ctrlPressed then
            c_save()
        end
    end)
    -- 回溯存档
    local ctrlPressed = false
    TheInput:AddKeyDownHandler(KEY_LCTRL, function()
        ctrlPressed = true
    end)
    TheInput:AddKeyUpHandler(KEY_LCTRL, function()
        ctrlPressed = false
    end)
    TheInput:AddKeyUpHandler(KEY_F2, function()
        if ctrlPressed then
            c_reset()
        end
    end)
    -- 魔力值一键扣除
    local ctrlPressed = false
    TheInput:AddKeyDownHandler(KEY_LCTRL, function()
        ctrlPressed = true
    end)
    TheInput:AddKeyUpHandler(KEY_LCTRL, function()
        ctrlPressed = false
    end)
    TheInput:AddKeyUpHandler(KEY_P, function()
        if ctrlPressed then
            inst.components.mana:DoDelta(-50)
            inst:AddComponent("talker")
            inst.components.talker:Say("魔力值扣除50")
        end
    end)
end

return {
    OnLoad = OnLoad
}
