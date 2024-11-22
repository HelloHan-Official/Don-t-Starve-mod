local Mana = Class(function(self, inst)
    self.inst = inst
    self.current = 0
    self.max = 0

    if inst ~= nil then
        inst:ListenForEvent("onload", function(inst) self:OnLoad() end)
        inst:ListenForEvent("onsave", function(inst) self:OnSave() end)
    end

    self:Init()
end)

function Mana:Init(current, max)
    self.max = max or 100
    self.current = current or self.max
end

function Mana:DoDelta(delta)
    self.current = math.max(0, math.min(self.max, self.current + delta))
    self.inst:PushEvent("manadelta", {newmana = self.current})
end

function Mana:SetMax(max)
    self.max = max
    self.current = math.min(self.current, self.max)
    self.inst:PushEvent("maxmanachanged", {newmax = self.max})
end

function Mana:GetCurrent()
    return self.current
end

function Mana:GetMax()
    return self.max
end

function Mana:GetPercent()
    return self.current / self.max
end

function Mana:OnSave()
    return {
        current = self.current,
        max = self.max
    }
end

function Mana:OnLoad(data)
    if data ~= nil then
        self.current = data.current or self.max
        self.max = data.max or 100
    else
        self:Init()
    end
end

return Mana