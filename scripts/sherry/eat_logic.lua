local applyupgrades = require "sherry/upgrade"
local function oneat(inst, food)
    -- 喜欢的食物
    if food.prefab == "jammypreserves" or -- 果酱          
    food.prefab == "icecream" or -- 冰淇淋
    food.prefab == "taffy" or -- 太妃糖
    food.prefab == "jellyopop" or -- 海滩 果冻冰棒
    food.prefab == "butterflymuffin" or -- 蝴蝶松饼 
    food.prefab == "flowersalad" or -- 巨人国 花瓣沙拉
    food.prefab == "trailmix" or -- 干果杂烩
    food.prefab == "spicyvegstinger" or -- 哈姆雷特 蔬菜鸡尾酒
    -- food.prefab == "dragonfruit" or -- 火龙果生吃
    -- food.prefab == "dragonfruit_cooked" or -- 烤火龙果
    food.prefab == "bananapop" or -- 海滩 香蕉冻
    food.prefab == "coffee" or -- 海滩 咖啡
    -- food.prefab == "freshfruitcrepes" or --海滩 鲜果可丽饼
    food.prefab == "fruitmedley" or -- 巨人国 水果拼盘
    food.prefab == "watermelonicle" or -- 西瓜冰
    food.prefab == "gummy_cake" or -- 哈姆雷特 软糖蛋糕
    food.prefab == "honeyham" or -- 蜜汁火腿
    food.prefab == "honeynuggets" or -- 蜜汁卤肉
    food.prefab == "icedtea" or -- 哈姆雷特 冰茶
    food.prefab == "tea" or -- 哈姆雷特 茶
    food.prefab == "waffles" or -- 华夫饼
    food.prefab == "goatmilk" or -- 带电的羊奶
    -- 自定的食物
    food.prefab == "blueberry_cake" or -- 蓝莓蛋糕
    food.prefab == "blueberry_cookies" or -- 蓝莓曲奇
    food.prefab == "blueberry_fish_soup" or -- 蓝莓鱼汤
    food.prefab == "blueberry_juice" or -- 蓝莓果汁
    food.prefab == "blueberry_tart" or -- 蓝莓蛋挞
    food.prefab == "strawberry_cake" or -- 草莓蛋糕
    food.prefab == "strawberry_frozen" or -- 冰冻草莓
    food.prefab == "strawberry_ice_cream" or -- 草莓甜筒
    food.prefab == "strawberry_muffin" or -- 草莓松饼
    food.prefab == "strawberry_pudding" -- 草莓布丁
    then

        local equippedItem = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if equippedItem and equippedItem.prefab == "ribbon_hat" then

            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say("Delicious! Magic value increases!")
            end
            if TUNING.LANGUAGE == "Chinese" then
                inst.components.talker:Say("真好吃！魔力值增加50！")
            end
            inst.components.mana:DoDelta(50) -- 恢复魔力值  
        else
            if TUNING.LANGUAGE == "English" then
                inst.components.talker:Say("Delicious! Magic value increases!")
            end
            if TUNING.LANGUAGE == "Chinese" then
                inst.components.talker:Say("真好吃！魔力值增加25！")
            end
            inst.components.mana:DoDelta(25) -- 恢复魔力值
        end

        -- 播放提供的语言
        --  inst.SoundEmitter:PlaySound("暂时搁置")

        -- 满足要求后进行升级
        if inst.level < 200 then
            inst.level = inst.level + 1
            -- 升级函数回调
            applyupgrades(inst)
            -- 播放动画
            SpawnPrefab("sparklefx").Transform:SetPosition(inst:GetPosition():Get())
            if TUNING.SHERRY_SOUND == "sherry_old_sound" then
                inst.SoundEmitter:PlaySound("eatfood/eat/eat")
            end
            if TUNING.SHERRY_SOUND == "sherry_cn_sound" then
                inst.SoundEmitter:PlaySound("eatfood_cn/eat/eat_cn")
            end
            inst.HUD.controls.status.heart:PulseGreen()
            inst.HUD.controls.status.stomach:PulseGreen()
            inst.HUD.controls.status.brain:PulseGreen()

            inst.HUD.controls.status.brain:ScaleTo(1.3, 1, .7)
            inst.HUD.controls.status.heart:ScaleTo(1.3, 1, .7)
            inst.HUD.controls.status.stomach:ScaleTo(1.3, 1, .7)
        end
    end

    local sanity_delta = 0
    local message = ""
    if TUNING.MODE == "easy" then
        if not food:HasTag("meat") then
            sanity_delta = 10
            message = TUNING.LANGUAGE == "English" and "Too delicious!" or "真好吃！"
        end
    elseif TUNING.MODE == "hard" then
        if food:HasTag("meat") or food.prefab == "baconeggs" or food.prefab == "frogglebunwich" or food.prefab ==
            "guacamole" or food.prefab == "kabobs" or food.prefab == "bonestew" or food.prefab == "monsterlasagna" or
            food.prefab == "monstertartare" or food.prefab == "perogies" or food.prefab == "hotchili" or food.prefab ==
            "surfnturf" or food.prefab == "turkeydinner" or food.prefab == "unagi" then
            sanity_delta = -10
            message = TUNING.LANGUAGE == "English" and "This meat is unsettling..." or "我不喜欢吃肉"
        end
    end
    if sanity_delta ~= 0 then
        inst.components.sanity:DoDelta(sanity_delta)
        inst.components.talker:Say(message)
    end
end

return oneat
