-- 雪莉经典声音
if TUNING.SHERRY_SOUND == "sherry_old_sound" then
    RemapSoundEvent("dontstarve/characters/sherry/death_voice", "sherry/sherry/death")
    RemapSoundEvent("dontstarve/characters/sherry/hurt", "sherry/sherry/hurt")
    RemapSoundEvent("dontstarve/characters/sherry/talk_LP", "sherry/sherry/talk_loop")
    TUNING.sherry_sounds = "sherry"
end
-- 中文声音
if TUNING.SHERRY_SOUND == "sherry_cn_sound" then
    RemapSoundEvent("dontstarve/characters/sherry/death_voice", "sherry_cn/sherry_cn/death")
    RemapSoundEvent("dontstarve/characters/sherry/hurt", "sherry_cn/sherry_cn/hurt")
    RemapSoundEvent("dontstarve/characters/sherry/talk_LP", "sherry_cn/sherry_cn/talk_loop")
    TUNING.sherry_sounds = "sherry"
end
-- 洛微声音
if TUNING.SHERRY_SOUND == "willow" then
    TUNING.sherry_sounds = "willow"
end

-- 洛微声音
if TUNING.SHERRY_SOUND == "no_sound" then
    TUNING.sherry_sounds = ""
end