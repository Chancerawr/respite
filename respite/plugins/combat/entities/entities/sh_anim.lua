local PLUGIN = PLUGIN

function ENT:walkAnims(distance, walk)
	local run
	if(distance > 300 and !walk) then
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
		local RunAnim = self:getNetVar("RunAnim", self.RunAnim)

		if(RunAnim) then
			if(isnumber(RunAnim)) then
				act = RunAnim
			else
				seq = self:LookupSequence(RunAnim)
			end
		else
			for k, v in pairs(runAnims) do
				seq = self:SelectWeightedSequence(v)
				act = v
				
				if(seq != -1) then break end
			end
		end
	else
		local WalkAnim = self:getNetVar("WalkAnim", self.WalkAnim)
		if(WalkAnim) then
			if(isnumber(WalkAnim)) then
				act = WalkAnim
			else
				seq = self:LookupSequence(WalkAnim)
			end
		else
			for k, v in pairs(walkAnims) do
				seq = self:SelectWeightedSequence(v)
				act = v
				
				if(seq != -1) then break end
			end
		end
	end

	local groundSpeed = 200
	
	if(seq != -1) then
		local tempAnim = self:GetSequence()
		if(tempAnim != seq and !self.prevAnim) then
			self.prevAnim = tempAnim
		end
	
		if(act) then
			self:StartActivity(act)
		elseif(seq) then
			self:ResetSequence(seq)
		end
		
		--this tries to set the speed based on how fast the anim is
		groundSpeed = self:GetSequenceGroundSpeed(self:GetSequence())
		if(groundSpeed < 1) then
			if(run) then --this is just a default value if the animation fails
				groundSpeed = 200
			else
				groundSpeed = 50
			end
		end
	end

	self.loco:SetDesiredSpeed(groundSpeed)
end

function ENT:resetAnim()
	self:ResetSequenceInfo()

	--the anim it was doing before
	local anim = self.prevAnim
	if(!anim) then
		--configured idle animation
		local IdleAnim = self:getNetVar("IdleAnim", self.IdleAnim)
		if(IdleAnim) then
			anim = self:LookupSequence(IdleAnim)
		else --if no preset idle, then try to find one
			for k, v in ipairs(self:GetSequenceList()) do
				if (v:lower():find("idle") and v != "idlenoise") then
					anim = k
					break
				end
			end
			
			--if we still don't have anything
			--just give up and go with 4
			if(!anim) then
				anim = 4
			end
		end
	end
	
	self:ResetSequence(anim)
	self:SetPoseParameter("move_x", 0)
	
	self.prevAnim = nil
end

function ENT:attackAnimStart()
	local AttackAnim = self:getNetVar("AttackAnim", self.AttackAnim)
	if(AttackAnim) then
		if(isnumber(AttackAnim)) then
			--this does not work properly and i do not know why
			self:RestartGesture(AttackAnim)
		else
			local sequence = self:LookupSequence(AttackAnim)

			self:ResetSequence(sequence)
			self:SetCycle(0)
			
			timer.Simple(self:SequenceDuration(sequence), function()
				if(IsValid(self)) then
					self:resetAnim()
				end
			end)
		end
	end
end