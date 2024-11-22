local ModFloatable = Class(function(self, inst)
    self.inst = inst
    self.onwater = false 
    self.onwaterfn = nil
    self.onlandfn = nil

	self.landanim = nil
	self.wateranim = nil
	self.loopland = true
	self.loopwater = true

	self.size = "med" -- "small", "med", "large"

	self.heavyitem = false

    self.xscale = 1.0
    self.yscale = 1.0
    self.zscale = 1.0
	
    self.bobbing_amplitude = 0.1
    self.bobbing_frequency = 1.0
    self.bobbing_phase = 0.0
	
	self.should_parent_effect = true
	self.showing_effect = false

	self.bobbing = true

    local x, y, z = self.inst.Transform:GetScale()
    self.initial_scale = { x = x, y = y, z = z }

	self.inst:ListenForEvent("itemcurrentlyfalling", function() self:PlayThrowAnim() end)
	self.inst:ListenForEvent("onputininventory", function() self:RemoveEffect() end)
	self.inst:ListenForEvent("itemhitwater", function() self:CheckIfYouAreInWater() end)
	self.inst:ListenForEvent("onhitground", function() self:CheckIfYouAreOnGround() end)
end)

function ModFloatable:RemoveEffect()
    self.showing_effect = false

    if self.front_fx ~= nil and self.front_fx:IsValid() then
        self.front_fx:Remove()
        self.front_fx = nil
    end
    if self.back_fx ~= nil and self.back_fx:IsValid() then
        self.back_fx:Remove()
        self.back_fx = nil
    end
end

function ModFloatable:SetScale(scale)
    if scale ~= nil then
        if type(scale) == "table" then
            self.xscale = scale[1]
            self.yscale = scale[2]
            self.zscale = scale[3]
        else
            self.xscale = scale
            self.yscale = scale
            self.zscale = scale
        end

        if self.front_fx ~= nil then
            self.front_fx.Transform:SetScale(self.xscale, self.yscale, self.zscale)
        end
        if self.back_fx ~= nil then
            self.back_fx.Transform:SetScale(self.xscale, self.yscale, self.zscale)
        end
    end
end

function ModFloatable:AttachEffect(effect)
    if self.should_parent_effect then
        effect.entity:SetParent(self.inst.entity)
        effect.Transform:SetPosition(0, self.vert_offset or 0, 0)
    else
        local my_x, my_y, my_z = self.inst.Transform:GetWorldPosition()
        effect.Transform:SetPosition(my_x, my_y + (self.vert_offset or 0), my_z)
    end

    effect.Transform:SetScale(self.xscale, self.yscale, self.zscale)
end

function ModFloatable:SetUpEffect()
    self.showing_effect = true
    if self.front_fx == nil then
        self.front_fx = SpawnPrefab("float_fx_front")
        self:AttachEffect(self.front_fx)
        self.front_fx.AnimState:PlayAnimation("idle_front_" .. self.size, true)
    end

    if self.back_fx == nil then
        self.back_fx = SpawnPrefab("float_fx_back")
        self:AttachEffect(self.back_fx)
        self.back_fx.AnimState:PlayAnimation("idle_back_" .. self.size, true)
    end
end

function ModFloatable:CheckIfYouAreOnGround()
	if not self.inst:GetIsOnWater() then
		self:OnHitLand()
		if self.bobbing then
			self.inst:StopUpdatingComponent(self)
			self:ResetScale()
		end
		self:RemoveEffect()
	end
end

function ModFloatable:CheckIfYouAreInWater()
	if self.inst:GetIsOnWater() then
		self:OnHitWater()
		if self.bobbing then
			self.inst:StartUpdatingComponent(self)
		end
		self:SetUpEffect()
	end
end

function ModFloatable:PlayLandAnim()
	if self.landanim ~= nil and not self.inst.AnimState:IsCurrentAnimation(self.landanim or "") then
	    self.inst.AnimState:PlayAnimation(self.landanim, self.loopland)
	end
	self.inst.AnimState:SetLayer(LAYER_WORLD)
	self.inst.AnimState:SetSortOrder(0)
end

function ModFloatable:PlayWaterAnim()
	if self.wateranim ~= nil and not self.inst.AnimState:IsCurrentAnimation(self.wateranim or "") then
	    self.inst.AnimState:PlayAnimation(self.wateranim, self.loopwater)
	end
	self.inst.AnimState:SetLayer(LAYER_WORLD_BACKGROUND)
	self.inst.AnimState:SetSortOrder(1)
end  

function ModFloatable:OnHitWater(skipcrocodogtest)
	self.onwater = true
	self:PlayWaterAnim()
	if self.onwaterfn then
		self.onwaterfn(self.inst)
	end
	if self.heavyitem then
		self.inst.Physics:SetVel(0, 0, 0)
	end
	self.inst.PushEvent("hitwater")
	self.inst:AddTag("aquatic")

	if self.inst.components.burnable and not self.inst.components.burnable.burntonwater then
		self.inst.components.burnable:Extinguish()
	end

	if self.inst.components.sinkable then
		self.inst.components.sinkable:onhitwater()
	end

--	print("I hit water!")

	local fx = SpawnPrefab("splash_water_drop")
	if self.inst.SoundEmitter then
		self.inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/item_float")
	end 
	fx.Transform:SetPosition(self.inst.Transform:GetWorldPosition())

    if not skipcrocodogtest and GetWorld().components.hounded then
    	-- don't forget to reject all the crocodog drops here
		if not self.inst:HasTag("monstermeat") and self.inst.components.edible and self.inst.components.edible.foodtype == "MEAT" and not self.inst:HasTag("spawnnosharx") then 		
            local roll = math.random()
			local chance = TUNING.SHARKBAIT_CROCODOG_SPAWN_MULT * self.inst.components.edible.hungervalue
	        if roll < chance then
	        	if math.random()<0.6 then
                	GetWorld().components.hounded:SummonHound()
                else
                	for i=1,math.random(2,4) do
	                	GetWorld().components.hounded:SummonSharx()
                	end
            	end	
	        end
		end 
	end 
end

function ModFloatable:OnHitLand(loading)
	self.onwater = false
	self:PlayLandAnim()
	if self.onlandfn then
		self.onlandfn(self.inst)
	end
	self.inst.PushEvent("hitland")
	self.inst:RemoveTag("aquatic")
	
--	print("I hit land!")
end

function ModFloatable:PlayThrowAnim()
	if self.inst:GetIsOnWater() then
		self:PlayWaterAnim()
	else
		self:PlayLandAnim()
	end
end

function ModFloatable:OnSave()
	return {onwater = self.onwater}
end

function ModFloatable:OnLoad(data)
	if data and data.onwater then
        self:OnHitWater(true)
		if self.bobbing then
			self.inst:StartUpdatingComponent(self)
		end
		self:SetUpEffect()
    else 
        self:OnHitLand(true)
		if self.bobbing then
			self.inst:StopUpdatingComponent(self)
			self:ResetScale()
		end
		self:RemoveEffect()
    end
end

function ModFloatable:SetBobbingParameters(amplitude, frequency, phase)
    self.bobbing_amplitude = amplitude
    self.bobbing_frequency = frequency
    self.bobbing_phase = phase
end

function ModFloatable:ResetScale()
    if self.inst.Transform and self.initial_scale then
        self.inst.Transform:SetScale(self.initial_scale.x, self.initial_scale.y, self.initial_scale.z)
    end
end

function ModFloatable:UpdateScale(scalex, scaley, scalez)
    if self.inst.Transform then
        self.inst.Transform:SetScale(1, scaley, 1)
    end
end

function ModFloatable:CalculateBobbing(dt)
	self.elapsed_time = (self.elapsed_time or 0) + dt
	local scalex = self.initial_scale.x + self.bobbing_amplitude * math.sin(self.bobbing_frequency * self.elapsed_time + self.bobbing_phase)
	local scaley = self.initial_scale.y + self.bobbing_amplitude * math.sin(self.bobbing_frequency * self.elapsed_time + self.bobbing_phase)
	local scalez = self.initial_scale.z + self.bobbing_amplitude * math.sin(self.bobbing_frequency * self.elapsed_time + self.bobbing_phase)
	self:UpdateScale(scalex, scaley, scalez)
end

function ModFloatable:OnUpdate(dt)
    if self.inst:GetIsOnWater() and self.bobbing then
		self:CalculateBobbing(dt)
    end
end

function ModFloatable:SetOnHitWaterFn(fn)
	self.onwaterfn = fn
end

function ModFloatable:SetOnHitLandFn(fn)
	self.onlandfn = fn
end

return ModFloatable
