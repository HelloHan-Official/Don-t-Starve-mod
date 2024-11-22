local require = GLOBAL.require
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH
modimport("scripts/sherry/sherry_assets.lua") -- 各种图片、xml
modimport("scripts/sherry/prefabs.lua") -- 预制物导入
modimport("scripts/sherry/sherry_tuning.lua") -- 自定选项
modimport("scripts/sherry/minimap.lua") -- 小地图显示
modimport("scripts/sherry/cook.lua") -- 食物的制作配方
modimport("scripts/sherry/add_pot.lua") -- 食物的制作配方
modimport("scripts/sherry/strings.lua") -- 人物和道具的介绍
modimport("scripts/sherry/speech.lua") -- 人物单独演讲稿
modimport("scripts/sherry/tabs.lua") -- 单独的制作栏
modimport("scripts/sherry/sounds.lua") -- 雪莉声音
modimport("scripts/sherry/make_mode.lua") -- 制作难度
modimport("scripts/sherry/prefabpostinit.lua") --初始魔力值
modimport("scripts/floatable_API.lua")
PrefabFiles = GLOBAL.prefabs
Assets = GLOBAL.assets
AddModCharacter("sherry")
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "sherry") -- 设置人物性别





--[[
 

   _____ _                                                  _     _                         _ 
  / ____| |                                                | |   | |                       | |
 | (___ | |__   ___ _ __ _ __ _   _    ___ __ _ _   _  __ _| |__ | |_   _   _  ___  _   _  | |
  \___ \| '_ \ / _ \ '__| '__| | | |  / __/ _` | | | |/ _` | '_ \| __| | | | |/ _ \| | | | | |
  ____) | | | |  __/ |  | |  | |_| | | (_| (_| | |_| | (_| | | | | |_  | |_| | (_) | |_| | |_|
 |_____/|_| |_|\___|_|  |_|   \__, |  \___\__,_|\__,_|\__, |_| |_|\__|  \__, |\___/ \__,_| (_)
                               __/ |                   __/ |             __/ |              
                              |___/                   |___/             |___/               

]]
