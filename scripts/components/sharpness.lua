local Sharpness = Class(function(self, inst)
    self.inst = inst
    self.max = 100
    self.current = self.max
end)

function Sharpness:SetMax(max)
    self.max = max
    self.current = self.max
end

function Sharpness:GetMax()
    return self.max
end

function Sharpness:SetCurrent(current)
    self.current = math.clamp(current, 0, self.max)
end

function Sharpness:GetCurrent()
    return self.current
end

function Sharpness:DoDelta(delta)
    self:SetCurrent(self.current + delta)
end

function Sharpness:GetPercent()
    return self.current / self.max
end

function Sharpness:SetPercent(percent)
    self:SetCurrent(self.max * percent)
end

function Sharpness:OnSave()
    return {
        current = self.current,
        max = self.max
    }
end

function Sharpness:OnLoad(data)
    if data ~= nil then
        if data.max ~= nil then
            self:SetMax(data.max)
        end
        if data.current ~= nil then
            self:SetCurrent(data.current)
        end
    end
    self.inst:PushEvent("sharpnessloaded")
    
    -- 立即更新武器伤害
    if self.inst.UpdateWeaponDamage then
        self.inst:UpdateWeaponDamage()
    end
end
return Sharpness
