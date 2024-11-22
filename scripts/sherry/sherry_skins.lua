local function skins(inst)
    -- 皮肤列表
    local skins = {"sherry", "new_sherry", "new_sherry_2"}
    local skin_names = {
        en = {"Classic Sherry", "Schoolgirl Sherry", "Schoolgirl Sherry 2"},
        zh = {"经典雪莉", "学生妹雪莉", "学生妹雪莉2"}
    }
    inst.current_skin = 1
    inst.AnimState:SetBuild(skins[inst.current_skin])
    TheInput:AddKeyUpHandler(KEY_Z, function()
        local equippedItem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.BODY)
        if equippedItem and equippedItem.prefab == "card" then
            inst.current_skin = (inst.current_skin % #skins) + 1
            inst.AnimState:SetBuild(skins[inst.current_skin])
            local fx = SpawnPrefab("collapse_small")
            if fx then
                fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
            end

            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say("Switched to " .. skin_names.en[inst.current_skin])
            elseif TUNING.LANGUAGE == "Chinese" then
                inst.components.talker:Say("切换到" .. skin_names.zh[inst.current_skin])
            end
        else
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say("I need to equip a 'card' to change my appearance")
            elseif TUNING.LANGUAGE == "Chinese" then
                inst.components.talker:Say("要学生卡才能切换皮肤哦。")
            end
        end
    end)
end
return {
    Skins = skins
}