name = "Sherry(雪莉)"
description = "增加一份单独的皮肤,语音,演讲稿\n已经对雪莉以及道具平衡性调整\n请仔细设置配置选项进行游玩\n对DS的兼容比较差,推荐开启任意DLC游玩\nIncompatible with DS"
author = "Monoko(HELLO_HAN重置)"
version = "9.2.3"
forumthread = ""
api_version = 6

-- 对于各个DLC和联机版的兼容性
dont_starve_compatible = false
reign_of_giants_compatible = true
dst_compatible = false
shipwrecked_compatible = true
hamlet_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options = {

    
    --语言更换
    {
        name = "language",
        label = " 语言 Language",
        options = {
            { description = "中文Chinese", data = "Chinese" },
            { description = "英语English", data = "English" },
        },
        default = "Chinese",
    },

    -- 游玩难度
    {
        name = "mode",
        label = "mode 游玩体验",
        options = {
            { description = "轻松 easy", data = "easy" },
            { description = "正常 normal", data = "normal" },
            { description = "困难 hard", data = "hard" },
        },
        default = "normal",
    },

    {
        name = "mana",
        label = "Initial mana 初始魔力值 ",
        options = {
            { description = "100", data = "100" },
            { description = "200", data = "200" },
            { description = "300", data = "300" },
        },
        default = "200",
    },

    -- 皮肤的更换
    {
        name = "skins",
        label = "Sherry 皮肤Skin",
        options = {
            { description = "新皮肤 NewSkin", data = "new_sherry" },
            { description = "皮肤2 NewSkin2", data = "new_sherry_2" },
            { description = "经典 classic", data = "sherry" },
        },
        default = "new_sherry",
    },
    
    {
        name = "sound",
        label = "Sherry 声音sound",
        options = {
            { description = "经典 classic", data = "sherry_old_sound" },
            { description = "中文 chinese", data = "sherry_cn_sound" },
            { description = "洛微 willow", data = "willow" },
            { description = "无声 no sound", data = "no_sound" },
        },
        default = "sherry_old_sound",
    },

    {
        name = "skill",
        label = "使用技能 Use skills",
        options = {
            { description = "V", data = "V" },
            { description = "CTRL+V", data = "CTRL+V" },
        },
        default = "V",
    },

    {
        name = "view_status",
        label = "查看信息 view status",
        options = {
            { description = "X", data = "X" },
            { description = "CTRL+X", data = "CTRL+X" },
        },
        default = "X",
    },

    {
        name = "story_book",
        label = "故事书 book",
        options = {
            { description = "恢复 recover", data = "recover" },
            { description = "讲故事 story", data = "story" },
            { description = "雨停 stop rain", data = "weather" },
            { description = "季节 season", data = "season" },
        },
        default = "recover",
    },

    {
        name = "Whether_random",
        label = "随机伤害 Damage",
        options = {
            { description = "开启 Random", data = "true" },
            { description = "固定 fixed", data = "false" },
            
        },
        default = "true",
    },

    {
        name = "chop_hack",
        label = "武器劈砍chop hack",
        options = {
            { description = "开启 yes", data = "true" },
            { description = "关闭 no", data = "false" },
        },
        default = "true",
    },

    {
        name = "cold",
        label = "寒冷和冰冻Cold Frozen",
        options = {
            { description = "惧怕 Afraid", data = "true" },
            { description = "不怕 Not afraid", data = "false" },
        },
        default = "true",
    },

    {
        name = "valise",
        label = "手提箱展示 valise",
        options = {
            { description = "左下角 left", data = "left" },
            { description = "中上方 center", data = "center" },
            { description = "右下角 right", data = "right" },
        },
        default = "center",
    },

    {
        name = "dizzy",
        label = "免疫硬直 dizzy(HAM)",
        options = {
            { description = "不免疫 no", data = "false" },
            { description = "免疫 yes", data = "true" },
            
        },
        default = "false",
    },

    {
        name = "san",
        label = "san值扣除 san",
        options = {
            { description = "每秒2点 2 sanity", data = "false" },
            { description = "每秒1点 1 sanity", data = "true" },
        },
        default = "false",
    },


}
