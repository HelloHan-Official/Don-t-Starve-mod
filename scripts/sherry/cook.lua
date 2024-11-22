-- 蓝莓蛋糕
local blueberry_cake = {
    name = "blueberry_cake",
    test = function(cooker, names, tags)
        return (names.blueberry and names.blueberry > 1) and not tags.fish and not tags.meat and
                   (not names.twigs or names.twigs == 0) and not tags.egg and tags.veggie
    end,
    priority = 30, -- 优先级适中
    weight = 1, -- 权重
    foodtype = "VEGGIE", -- 类型
    health = 20, -- 生命值恢复
    hunger = 62.5, -- 饥饿值恢复
    sanity = 5, -- 理智值恢复
    perishtime = TUNING.PERISH_SLOW, -- 腐烂时间
    cooktime = 0.75 -- 烹饪时间
}

AddCookerRecipe("cookpot", blueberry_cake)

-- 蓝莓蛋挞
local blueberry_tart = {
    name = "blueberry_tart",
    test = function(cooker, names, tags)
        return (names.blueberry and names.blueberry > 1) and tags.egg and tags.sweetener and not tags.meat and
                   not tags.fish and (not names.twigs or names.twigs == 0)
    end,
    priority = 30, -- 优先级适中
    weight = 1, -- 权重
    foodtype = "VEGGIE", -- 类型（改为素食以便配方更容易制作）
    health = 20, -- 生命值恢复
    hunger = 62.5, -- 饥饿值恢复
    sanity = 15, -- 理智值恢复
    perishtime = TUNING.PERISH_SLOW, -- 腐烂时间
    cooktime = 1 -- 烹饪时间
}

AddCookerRecipe("cookpot", blueberry_tart)

-- 蓝莓果汁
local blueberry_juice = {
    name = "blueberry_juice",
    test = function(cooker, names, tags)
        return (names.blueberry and names.blueberry > 1) and names.ice and names.ice >= 1 and not tags.meat and
                   not tags.fish and not tags.egg
    end,
    priority = 20, -- 优先级稍低
    weight = 1, -- 权重
    foodtype = "VEGGIE", -- 类型
    health = 10, -- 生命值恢复
    hunger = 20, -- 饥饿值恢复
    sanity = 15, -- 理智值恢复
    perishtime = TUNING.PERISH_FAST, -- 快速腐烂
    cooktime = 0.5 -- 烹饪时间
}

AddCookerRecipe("cookpot", blueberry_juice)

-- 蓝莓鱼汤
local blueberry_fish_soup = {
    name = "blueberry_fish_soup",
    test = function(cooker, names, tags)
        return (names.blueberry and names.blueberry > 1) and tags.fish and tags.fish > 1
    end,
    priority = 25, -- 优先级适中
    weight = 1, -- 权重
    foodtype = "MEAT", -- 类型
    health = 30, -- 生命值恢复
    hunger = 62.5, -- 饥饿值恢复
    sanity = 15, -- 理智值恢复
    perishtime = TUNING.PERISH_SLOW, -- 慢速腐烂
    cooktime = 1.0 -- 烹饪时间
}

AddCookerRecipe("cookpot", blueberry_fish_soup)

-- 蓝莓饼干
local blueberry_cookies = {
    name = "blueberry_cookies",
    test = function(cooker, names, tags)
        return
            (names.blueberry and names.blueberry >= 2) and tags.sweetener and tags.sweetener >= 1 and not tags.meat and
                not tags.fish and (not names.twigs or names.twigs == 0)
    end,
    priority = 25, -- 优先级适中
    weight = 1, -- 权重
    foodtype = "VEGGIE", -- 类型
    health = 10, -- 生命值恢复
    hunger = 25, -- 饥饿值恢复
    sanity = 15, -- 理智值恢复
    perishtime = TUNING.PERISH_MED, -- 中速腐烂
    cooktime = 0.5 -- 烹饪时间
}

AddCookerRecipe("cookpot", blueberry_cookies)

-- 草莓系列

-- 草莓蛋糕 (Strawberry Cake)
local strawberry_cake = {
    name = "strawberry_cake",
    test = function(cooker, names, tags)
        return
            names.strawberry and names.strawberry >= 1 and tags.sweetener and tags.sweetener >= 1 and not tags.fish and
                not tags.meat and not names.ice
    end,
    priority = 25, -- 优先级适中
    weight = 1, -- 权重
    foodtype = "VEGGIE", -- 类型
    health = 20, -- 生命值恢复
    hunger = 62.5, -- 饥饿值恢复
    sanity = 15, -- 理智值恢复
    perishtime = TUNING.PERISH_SLOW, -- 腐烂时间
    cooktime = 1.0 -- 烹饪时间
}

AddCookerRecipe("cookpot", strawberry_cake)

-- 草莓甜筒 (Strawberry Ice Cream)
local strawberry_ice_cream = {
    name = "strawberry_ice_cream",
    test = function(cooker, names, tags)
        return names.strawberry and names.strawberry >= 1 and names.ice and names.ice >= 1 and tags.sweetener and
                   tags.sweetener >= 1 and not tags.meat and not tags.fish and not tags.egg
    end,
    priority = 20, -- 优先级稍低
    weight = 1, -- 权重
    foodtype = "VEGGIE", -- 类型
    health = 15, -- 生命值恢复
    hunger = 25, -- 饥饿值恢复
    sanity = 20, -- 理智值恢复
    perishtime = TUNING.PERISH_SUPERFAST, -- 超快速腐烂
    cooktime = 1 -- 烹饪时间
}

AddCookerRecipe("cookpot", strawberry_ice_cream)

-- 草莓冰棒 (Strawberry Frozen)
local strawberry_frozen = {
    name = "strawberry_frozen",
    test = function(cooker, names, tags)
        return names.strawberry and names.strawberry >= 1 and names.ice and names.twigs and not tags.meat and
                   not tags.fish and not tags.egg
    end,
    priority = 10, -- 优先级低
    weight = 1, -- 权重
    foodtype = "VEGGIE", -- 类型
    health = 20, -- 生命值恢复
    hunger = 10, -- 饥饿值恢复
    sanity = 30, -- 理智值恢复
    perishtime = TUNING.PERISH_MED, -- 中速腐烂
    cooktime = 0.5 -- 烹饪时间
}

AddCookerRecipe("cookpot", strawberry_frozen)

-- 草莓松饼 (Strawberry Muffin)
local strawberry_muffin = {
    name = "strawberry_muffin",
    test = function(cooker, names, tags)
        return
            names.strawberry and names.strawberry >= 2 and tags.sweetener and tags.sweetener >= 1 and not tags.meat and
                not tags.fish
    end,
    priority = 30, -- 优先级适中
    weight = 1, -- 权重
    foodtype = "VEGGIE", -- 类型
    health = 20, -- 生命值恢复
    hunger = 62.5, -- 饥饿值恢复
    sanity = 10, -- 理智值恢复
    perishtime = TUNING.PERISH_MED, -- 中速腐烂
    cooktime = 1 -- 烹饪时间
}

AddCookerRecipe("cookpot", strawberry_muffin)

-- 草莓布丁 (Strawberry Pudding)
local strawberry_pudding = {
    name = "strawberry_pudding",
    test = function(cooker, names, tags)
        return names.strawberry and names.strawberry >= 1 and tags.egg and not tags.meat and not tags.fish and
                   (not names.twigs or names.twigs == 0)
    end,
    priority = 15, -- 优先级较低
    weight = 1, -- 权重
    foodtype = "VEGGIE", -- 类型
    health = 20, -- 生命值恢复
    hunger = 20, -- 饥饿值恢复
    sanity = 5, -- 理智值恢复
    perishtime = TUNING.PERISH_MED, -- 中速腐烂
    cooktime = 1 -- 烹饪时间
}

AddCookerRecipe("cookpot", strawberry_pudding)
