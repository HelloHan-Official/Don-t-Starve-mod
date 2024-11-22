-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- This API is used primarily for making modded items floatable without needing to add your own ripple effect on the item's build. --
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

-- Modify moisturelistener for inventoryitem to make modded items wet when they hit the water:
AddComponentPostInit("moisturelistener", function(self)
    local _UpdateMoisture = self.UpdateMoisture
    self.UpdateMoisture = function(self, ...)
		if self.inst:IsValid()  and not (self.inst.components.inventoryitem and self.inst.components.inventoryitem.owner) and self.inst.components.modfloatable		
			and self.inst.components.modfloatable.onwater then 
			self.moisture = GLOBAL.TUNING.MOISTURE_MAX_WETNESS
			self.targetMoisture = self.moisture
		end
		_UpdateMoisture(self, ...)
	end
end)

-- Modify inventoryitem to make modded floatable items not play their ripple effect / splash effect too early:
AddComponentPostInit("inventoryitem", function(self)
    local _OnStartFalling = self.OnStartFalling
    self.OnStartFalling = function(self, ...)
		self.inst:PushEvent("itemcurrentlyfalling")
		_OnStartFalling(self, ...)
	end
	
	local _OnHitWater = self.OnHitWater
    self.OnHitWater = function(self, ...)
		self.inst:PushEvent("itemhitwater")
		_OnHitWater(self, ...)
	end
end)
