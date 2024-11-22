local applyupgrades = require "sherry/upgrade"
local skills = require "sherry/skills"
local function onpreload(inst, data)
    if data then
        if data.level then
            inst.level = data.level
            applyupgrades(inst)

            if data.health and data.health.health then
                inst.components.health.currenthealth = data.health.health
            end
            if data.hunger and data.hunger.hunger then
                inst.components.hunger.current = data.hunger.hunger
            end
            if data.sanity and data.sanity.current then
                inst.components.sanity.current = data.sanity.current
            end
            inst.components.health:DoDelta(0)
            inst.components.hunger:DoDelta(0)
            inst.components.sanity:DoDelta(0)
        end

        if data.skillUses then
            inst.skillUses = data.skillUses
        end
        if data.skillCooldown then
            inst.skillCooldown = data.skillCooldown
        end

        inst.no_aggro = data.no_aggro or false
        inst.aggro_time_left = data.aggro_time_left or 0
        inst.aggro_cooldown = data.aggro_cooldown or false
        inst.aggro_cooldown_time = data.aggro_cooldown_time or 0
        
        if inst.no_aggro then
            inst:AddTag("notarget")
        end
        
        if inst.aggro_time_left > 0 then
            inst:DoTaskInTime(1, function() skills.UpdateAggroTime(inst) end)
        end
        
        if inst.aggro_cooldown_time > 0 then
            inst:DoTaskInTime(1, function() skills.UpdateCooldownTime(inst) end)
        end
    end
end

local function onsave(inst, data)
    
    data.level = inst.level
    data.charge_time = inst.charge_time

    data.skillUses = inst.skillUses
    data.skillCooldown = inst.skillCooldown

    data.no_aggro = inst.no_aggro
    data.aggro_time_left = inst.aggro_time_left
    data.aggro_cooldown = inst.aggro_cooldown
    data.aggro_cooldown_time = inst.aggro_cooldown_time
    
end

return {
    onpreload = onpreload,
    onsave = onsave
}