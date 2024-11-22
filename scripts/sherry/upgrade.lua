local function applyupgrades(inst)
    local max_upgrades = 200
    local upgrades = math.min(inst.level, max_upgrades)

    local hunger_percent = inst.components.hunger:GetPercent()
    local health_percent = inst.components.health:GetPercent()
    local sanity_percent = inst.components.sanity:GetPercent()

    if TUNING.MODE == "easy" then           --轻松模式
        inst.components.hunger.max = math.ceil(100 + upgrades * 1)
        inst.components.health.maxhealth = math.ceil(100 + upgrades * 1)
        inst.components.sanity.max = math.ceil(150 + upgrades * 1)
    elseif TUNING.MODE == "normal" then     --正常模式
        if upgrades <= 10 then
            inst.components.hunger.max = 100 + upgrades * 2
            inst.components.health.maxhealth = 100 + upgrades * 2
            inst.components.sanity.max = 150 + upgrades * 2
        elseif upgrades <= 50 then
            inst.components.hunger.max = 120 + (upgrades - 10)
            inst.components.health.maxhealth = 120 + (upgrades - 10)
            inst.components.sanity.max = 170 + (upgrades - 10)
        else
            inst.components.hunger.max = math.min(200, 160 + ((upgrades - 50) * 0.27))
            inst.components.health.maxhealth = math.min(200, 160 + (upgrades - 50) * 0.27)
            inst.components.sanity.max = math.min(250, 210 + (upgrades - 50) * 0.27)
        end
    elseif TUNING.MODE == "hard" then       --困难模式
        inst.components.hunger.max = math.ceil(100 + upgrades * 0.5)
        inst.components.health.maxhealth = math.ceil(100 + upgrades * 0.5)
        inst.components.sanity.max = math.ceil(150 + upgrades * 0.5)
    end

    inst.components.hunger:SetPercent(hunger_percent)
    inst.components.health:SetPercent(health_percent)
    inst.components.sanity:SetPercent(sanity_percent)

    if upgrades >= 200 then
        if inst.components.combat.AddDamageModifier ~= nil then
            inst.components.combat:AddDamageModifier("sherry", 0.1)
        end
        inst.components.combat.damagemultiplier = 1.1
    end
end

return applyupgrades
