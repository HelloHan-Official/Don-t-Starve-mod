local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local function sherryPostInit(sherry)
    -- 断剑
    local broken_sword = Recipe("broken_sword",
        {Ingredient("flint", 4), Ingredient("twigs", 2), Ingredient("houndstooth", 2)}, RECIPETABS.SHERRY_TAB, {
            SCIENCE = 0
        })
    broken_sword.atlas = "images/inventoryimages/broken_sword.xml"

     -- 冬之刃
     local winter_sword = Recipe("winter_sword",
     {Ingredient("broken_sword", 1, "images/inventoryimages/broken_sword.xml"), Ingredient("cane", 1)},
     RECIPETABS.SHERRY_TAB, {
         SCIENCE = 2
     })
 winter_sword.atlas = "images/inventoryimages/winter_sword.xml"

    -- 血之刃
    local blood_sword = Recipe("blood_sword",
    {Ingredient("winter_sword", 1,"images/inventoryimages/winter_sword.xml", 1), Ingredient("redgem", 2)}, RECIPETABS.SHERRY_TAB, {
        SCIENCE = 2
    })
    blood_sword.atlas = "images/inventoryimages/blood_sword.xml"

    -- 试卷
    local paper = Recipe("paper", {Ingredient("cutgrass", 2), Ingredient("log", 1)}, RECIPETABS.SHERRY_TAB, {
        SCIENCE = 1
    })
    paper.atlas = "images/inventoryimages/paper.xml"

     -- 蓝宝石可制作
     local bluegem = Recipe("bluegem", {Ingredient("redgem", 1),Ingredient("paper", 1, "images/inventoryimages/paper.xml")}, RECIPETABS.SHERRY_TAB, {
        SCIENCE = 2
    })

    -- 雪雀扇
    local snow_finch_fan = Recipe("snow_finch_fan", {Ingredient("feather_robin_winter", 10), Ingredient("bluegem", 2),
                                                     Ingredient("rope", 2)}, RECIPETABS.SHERRY_TAB, {
        SCIENCE = 2
    })
    snow_finch_fan.atlas = "images/inventoryimages/snow_finch_fan.xml"

    -- 蓝莓种子
    local blueberry_seeds = Recipe("blueberry_seeds", {Ingredient("seeds", 1), Ingredient("blue_cap", 1)},
        RECIPETABS.SHERRY_TAB, {
            SCIENCE = 1
        })
    blueberry_seeds.atlas = "images/inventoryimages/blueberry_seeds.xml"

    -- 草莓种子
    local strawberry_seeds = Recipe("strawberry_seeds", {Ingredient("seeds", 1), Ingredient("red_cap", 1)},
        RECIPETABS.SHERRY_TAB, {
            SCIENCE = 1
        })
    strawberry_seeds.atlas = "images/inventoryimages/strawberry_seeds.xml"

    -- 纸飞机
    local paper_plane = Recipe("paper_plane", {Ingredient("paper", 1, "images/inventoryimages/paper.xml")},
        RECIPETABS.SHERRY_TAB, {
            SCIENCE = 1
        })
    paper_plane.atlas = "images/inventoryimages/paper_plane.xml"

    -- 故事书
    local story_book = Recipe("story_book",
        {Ingredient("paper", 5, "images/inventoryimages/paper.xml"), Ingredient("pigskin", 1)}, RECIPETABS.SHERRY_TAB, {
            SCIENCE = 2
        })
    story_book.atlas = "images/inventoryimages/story_book.xml"

    -- 雪莉的眼镜
    local glasses = Recipe("glasses", {Ingredient("rope", 2), Ingredient("boards", 4), Ingredient("petals", 5)},
        RECIPETABS.SHERRY_TAB, {
            SCIENCE = 1
        })
    glasses.atlas = "images/inventoryimages/glasses.xml"

    -- 缎带帽
    local ribbon_hat = Recipe("ribbon_hat", {Ingredient("glasses", 1,"images/inventoryimages/glasses.xml"), Ingredient("ruinshat", 1)},
    RECIPETABS.SHERRY_TAB, {
        SCIENCE = 2
    })
    ribbon_hat.atlas = "images/inventoryimages/ribbon_hat.xml"

    -- 冰冠
    local ice_crown = Recipe("ice_crown", {Ingredient("ice", 15), Ingredient("fireflies", 1),Ingredient("bluegem", 1)}, RECIPETABS.SHERRY_TAB, {
        SCIENCE = 2
    })
    ice_crown.atlas = "images/inventoryimages/ice_crown.xml"

     --血环
     local halo = Recipe("halo", {Ingredient("ice_crown", 1,"images/inventoryimages/ice_crown.xml"),Ingredient("blood_sword", 1,"images/inventoryimages/blood_sword.xml")}, RECIPETABS.SHERRY_TAB, {
        SCIENCE = 2
    })
    halo.atlas = "images/inventoryimages/halo.xml"

    -- 雪莉的学生卡
    local card = Recipe("card", {Ingredient("boards", 3), Ingredient("paper", 2, "images/inventoryimages/paper.xml")},
        RECIPETABS.SHERRY_TAB, {
            SCIENCE = 2
        })
    card.atlas = "images/inventoryimages/card.xml"

    -- 羽毛背包
    local feather_backpack = Recipe("feather_backpack", {Ingredient("feather_robin_winter", 12), Ingredient("rope", 5)},
        RECIPETABS.SHERRY_TAB, {
            SCIENCE = 2
        })
    feather_backpack.atlas = "images/inventoryimages/feather_backpack.xml"

    -- 小熊书包
    local bear_backpack = Recipe("bear_backpack", {Ingredient("bearger_fur", 2), Ingredient("bundlewrap", 2)},
        RECIPETABS.SHERRY_TAB, {
            SCIENCE = 2
        })
    bear_backpack.atlas = "images/inventoryimages/bear_backpack.xml"

    -- 公主小屋
    local princess_cottage = Recipe("princess_cottage", {Ingredient("boards", 12), Ingredient("goldnugget",6), Ingredient("ice",10)},
    RECIPETABS.SHERRY_TAB, {
        SCIENCE = 2
    })
    princess_cottage.placer="princess_cottage_placer"
    princess_cottage.min_spacing= 5
    princess_cottage.atlas = "images/inventoryimages/princess_cottage.xml"
end

AddSimPostInit(function(inst)
    if inst.prefab == "sherry" then
        sherryPostInit(inst)
    end
end)
