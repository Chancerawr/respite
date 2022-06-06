local PLUGIN = PLUGIN

function ENT:walkAnims(distance)
	local run
	if(distance > 300) then
		run = true
	end

	local seq
	local act
	
	--this whole block sucks
	local runAnims = {
		ACT_RUN,
		ACT_HL2MP_RUN_FAST,
	}
	
	local walkAnims = {
		ACT_WALK,
		ACT_HL2MP_WALK,
	}
	
	if(run) then
		if(self.RunAnim) then
			seq = self:LookupSequence(self.RunAnim)
		else
			for k, v in pairs(runAnims) do
				seq = self:SelectWeightedSequence(v)
				act = v
				
				if(seq != -1) then break end
			end
		end
	else
		if(self.WalkAnim) then
			seq = self:LookupSequence(self.WalkAnim)
		else
			for k, v in pairs(walkAnims) do
				seq = self:SelectWeightedSequence(v)
				act = v
				
				if(seq != -1) then break end
			end
		end
	end

	groundSpeed = 200
	
	if(seq != -1) then
		local tempAnim = self:GetSequence()
		if(tempAnim != seq and !self.prevAnim) then
			self.prevAnim = tempAnim
		end
	
		if(act) then
			self:StartActivity(act)
		end
		
		if(seq) then
			self:ResetSequence(seq)
		end
		
		--this tries to set the speed based on how fast the anim is
		groundSpeed = self:GetSequenceGroundSpeed(seq)
		if(groundSpeed < 1) then
			if(run) then --this is just a default value if the animation fails
				groundSpeed = 200
			else
				groundSpeed = 50
			end
		end
	end
	
	self.loco:SetDesiredSpeed(groundSpeed)
	self:SetPlaybackRate(1)
	self:SetPoseParameter("move_x", 1)
end

function ENT:resetAnim()
	local prevAnim = self.prevAnim or self.idle
	
	self:SetSequence(prevAnim)
	
	self.prevAnim = nil
end

function ENT:setAnim()
	if(self.savedAnim) then
		local savedAnim = tonumber(self.savedAnim)
		
		timer.Simple(1, function()
			self:ResetSequence(savedAnim)
			
			if(self.IdleAnim) then
				self.idle = self:LookupSequence(self.IdleAnim) or 4
			else
				for k, v in ipairs(self:GetSequenceList()) do
					if (v:lower():find("idle") and v != "idlenoise") then
						self.idle = k
						return
					end
				end
				
				self.idle = 4
			end
		end)
	elseif(self.IdleAnim) then
		self.idle = self:LookupSequence(self.IdleAnim)
		self:ResetSequence(self:LookupSequence(self.IdleAnim))
	else
		for k, v in ipairs(self:GetSequenceList()) do
			if (v:lower():find("idle") and v != "idlenoise") then
				self.idle = k
				return self:ResetSequence(k)
			end
		end

		self.idle = 4
		self:ResetSequence(4)
	end
end

function ENT:attackAnimStart()
	if(self.AttackAnim) then
		local sequence = self:LookupSequence(self.AttackAnim)
		
		self:ResetSequence(sequence)
		
		timer.Simple(self:SequenceDuration(sequence), function()
			if(IsValid(self)) then
				self:setAnim()
			end
		end)
	end
end