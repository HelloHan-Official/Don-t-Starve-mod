local MakePlayerCharacter = require "prefabs/player_common"
local applyupgrades = require "sherry/upgrade"
local oneat = require "sherry/eat_logic"
local save_load = require "sherry/save_load"
local inventory = require "sherry/inventory"
local check_key = require "sherry/check_key"
local skills = require "sherry/skills"
local skins = require "sherry/sherry_skins"

local assets = {
    Asset("ANIM", "anim/sherry.zip"),
    Asset("ANIM", "anim/new_sherry.zip"),
    Asset("ANIM", "anim/new_sherry_2.zip"),
    Asset("SOUNDPACKAGE", "sound/eatfood.fev"), -- 经典 
    Asset("SOUND", "sound/eatfood.fsb"),
    Asset("SOUNDPACKAGE", "sound/eatfood_cn.fev"),-- 中文吃东西
    Asset("SOUND", "sound/eatfood_cn.fsb"),
}
local prefabs = {}
local onsave = save_load.onsave
local onpreload = save_load.onpreload
local start_inv = inventory.get_inventory()

local function fn(inst)
    skins.Skins(inst)
    local level = inst.level
    local sherry = TUNING.sherry_sounds
    inst.soundsname = sherry
    inst.AnimState:SetBuild(TUNING.SHERRY_SKIN)
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.MiniMapEntity:SetIcon("sherry.tex")

    inst.components.health:SetMaxHealth(100)
    inst.components.hunger:SetMax(100)
    inst.components.sanity:SetMax(150)

    if TUNING.LANGUAGE == "English" then
        inst.components.talker:Say("Sherry has been waiting for you!")
    elseif TUNING.LANGUAGE == "Chinese" then
        inst.components.talker:Say("雪莉等你好久了！")
    end

    if TUNING.ISNOT_COLD == "true" then
        inst.components.temperature.hurtrate = 0.75
    else
        inst:RemoveComponent("freezable")
        inst.components.temperature.mintemp = 18
        inst.components.temperature.hurtrate = 1.5
    end
    
	inst:AddComponent("talker")
    inst:AddComponent("reader")
    inst:AddTag("bookreader")
    inst.components.temperature.overheattemp = 70
    inst.components.locomotor.walkspeed = 4
    inst.components.locomotor.runspeed = 6
    inst.components.eater:SetOnEatFn(oneat)

    if TUNING.MODE == "easy" then
        -- 模组测试内容:如果发现初始等级为200请注释下面这一行代码，并取消注释 --> inst.level = 150
        -- inst.level = 200
        inst.level = 150
        inst.components.health.absorb = 0.25
        inst.components.combat.damagemultiplier = 1
        inst.components.hunger.hungerrate = 0.9 * TUNING.WILSON_HUNGER_RATE
    elseif TUNING.MODE == "normal" then
        inst.level = 1
        inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
        inst.components.combat.damagemultiplier = 1
    elseif TUNING.MODE == "hard" then
        inst.level = 1
        inst.components.health.absorb = -0.25
        inst.components.hunger.hungerrate = 1.1 * TUNING.WILSON_HUNGER_RATE
        inst.components.combat.damagemultiplier = 0.75
    end

    inst.is_skill_on_cooldown = false
    inst.skill_cooldown_time = 0
    inst.skillUses = skills.CalculateSkillUses(inst.level)
    inst.skillCooldown = 0
    skills.UpdateSkillCooldown(inst)
    skills.ManaIncrease(inst)
    check_key.OnLoad(inst)

    inst.OnSave = onsave
    inst.OnPreLoad = onpreload

end

return MakePlayerCharacter("sherry", prefabs, assets, fn, start_inv)
