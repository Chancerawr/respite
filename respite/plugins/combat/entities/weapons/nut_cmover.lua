local PLUGIN = PLUGIN

AddCSLuaFile()

SWEP.PrintName = "CEnt Commander"
SWEP.Slot = 0
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Author = ""
--SWEP.Instructions = "Primary Fire: [RAISED] Punch\nSecondary Fire: Knock/Pickup"
--SWEP.Purpose = "Hitting things, knocking on doors, and moving things."

SWEP.ViewModelFOV = 45
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"

SWEP.ViewTranslation = 4

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""
SWEP.Primary.Damage = 5
SWEP.Primary.Delay = 0.25

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.UseHands = false
SWEP.LowerAngles = Angle(15, -10, -20)

SWEP.IsAlwaysLowered = true
SWEP.FireWhenLowered = true
SWEP.HoldType = "normal"

ALWAYS_RAISED["nut_cmover"] = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Nutscript - Combat"

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
end

function SWEP:Select(select)
	local client = self.Owner
	
	if(select) then
		if(istable(select)) then
			self.selected = select
		else
			self.selected = {}
			self.selected[select] = Vector(0,0,0)
			
			if(SERVER) then
				self:setNetVar("selected", select)

				--movement circle
				client:setNetVar("showAPCircle", select:GetPos())
				client:setNetVar("APCircleEnt", select)
			end
		end
		
		if(CLIENT) then
			if(!istable(select) or !table.IsEmpty(select)) then
				client:EmitSound("buttons/lightswitch2.wav", 75, 125, 1, CHAN_AUTO, 0, 1, {client})
			end
		end
	else
		if(CLIENT) then
			if(self.selected and !table.IsEmpty(self.selected)) then
				client:EmitSound("buttons/lightswitch2.wav", 75, 50, 1, CHAN_AUTO, 0, 1, {client})
			end
		end
	
		self.selected = {}
		
		if(SERVER) then
			self:setNetVar("selected", nil)
			
			--resets ap circle
			--if noclipped admin, we dont need it to be our own circle
			if(client:GetMoveType() == MOVETYPE_NOCLIP) then
				client:setNetVar("showAPCircle", nil)
			else
				client:setNetVar("showAPCircle", client:GetPos())
			end
			
			client:setNetVar("APCircleEnt", nil)
		end
	end
	
	if(CLIENT) then
		self:CreateGhosts()
	end
end

function SWEP:GetSelected()
	return self.selected or {}
end

function SWEP:PrimaryAttack()
	if((self.nextPrimary or 0) < CurTime()) then
		self.nextPrimary = CurTime() + self.Primary.Delay

		local client = self.Owner
		local trace = client:GetEyeTrace()

		self:Select()

		local entity = trace.Entity
		if(IsValid(entity) and entity.combat) then
			self:SingleSelect(trace)
		else
			self:MultiSelect(trace)
		end
	end
end

function SWEP:BoxSelect(mins, maxs)
	local client = self.Owner

	local mins = mins--client.centMoverMins
	local maxs = maxs+Vector(0,0,20)--hitPos+Vector(0,0,20)

	local distMin = math.huge
	local distMax = math.huge
	local nearestMin
	local nearestMax

	local targets = {}

	local entities = ents.FindInBox(mins, maxs)
	for k, entity in ipairs(entities) do
		if(!IsValid(entity)) then continue end
		if(!entity.combat) then continue end
		if(!self:CanSelect(entity)) then continue end

		--creates a new box bound by the entities within it
		--this is so the offset is more sensible
		local pos = entity:GetPos()
		local dist1 = pos:DistToSqr(mins)
		if(dist1 < distMin) then
			nearestMin = pos
			distMin = dist1
		end

		local dist2 = pos:DistToSqr(maxs)
		if(dist2 < distMax) then
			nearestMax = pos
			distMax = dist2
		end

		targets[entity] = Vector(0,0,0) --temporary value
	end
	
	--updates the box
	mins = nearestMin or mins
	maxs = nearestMax or maxs
	
	--find the center of the box so we can create the offset
	local center = mins + (maxs - mins)/2
	
	for entity, _ in pairs(targets) do
		local offset = entity:GetPos() - center
		offset.z = 0
		
		targets[entity] = offset
	end

	self:Select(targets)

	client.centMoverMins = nil
	client.centMoverMaxs = nil
end

function SWEP:MultiSelect(trace)
	local client = self.Owner
	
	if (trace.Hit) then
		local hitPos = trace.HitPos
		if(!client.dragMins) then
			client.selectSwep = self
			client.dragMins = hitPos
		end
	end
end

function SWEP:SingleSelect(trace)
	local client = self.Owner
	
	if (trace.Hit) then
		local entity = trace.Entity
		
		if(IsValid(entity) and entity.combat) then
			if(self:CanSelect(entity)) then
				self:Select(entity)
			end	
		end
	end
end

function SWEP:CanSelect(entity)
	if(
	self.Owner:IsAdmin() 
	or ((entity.GetCreator and entity:GetCreator()) == self.Owner) 
	or entity.playerControlled
	) then
		return true
	else
		return false
	end
end

function SWEP:SecondaryAttack()
	self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)

	local client = self.Owner

	client.centMoverMins = nil
	client.centMoverMaxs = nil

	local data = {}
		data.start = self.Owner:GetShootPos()
		data.endpos = data.start + self.Owner:GetAimVector()*4096
		--data.filter = {self.Owner, self}
		data.filter = function(ent)
			if(ent == self.Owner or ent == ent.Owner) then
				return false
			end
			
			if(ent.combat) then
				return false
			end
			
			return true
		end
	local trace = util.TraceLine(data)

	if (trace.HitPos) then
		local selected = self:GetSelected()

		for entity, offset in pairs(selected) do
			if(IsValid(entity)) then
				if(SERVER) then
					local forceWalk = client:KeyDown(IN_SPEED)
					local angle = client:GetAngles()
					angle.x = 0
				
					entity.follow = nil
					entity:movementStart(trace.HitPos+offset, forceWalk, angle)
				end
			end
		end
		
		--not sure if i like it
		--client:EmitSound("buttons/lightswitch2.wav", 75, 75, 1, CHAN_AUTO, 0, 1, {client})
	end
end

function SWEP:Reload()
	if(CLIENT) then
		if(!self.Owner:IsAdmin()) then return end
	
		if((self.nextReload or 0) < CurTime()) then
			self.nextReload = CurTime()+0.5
		
			local selected = self:GetSelected()

			for entity, offset in pairs(selected) do
				if(!IsValid(entity)) then return end
				
				local command = vgui.Create("nutCombatCommand")
				command:CEntConfig(entity, self)
				
				break --sucks but we only want the first one i guess-
			end
		end
	end
end

function SWEP:Deploy()
	if(CLIENT) then
		self:CreateGhosts()
	end
end

function SWEP:Holster()
	local client = self.Owner

	if(SERVER) then
		if(client:GetMoveType() == MOVETYPE_NOCLIP) then
			client:setNetVar("showAPCircle", nil)
		end
	else --CLIENT
		self:RemoveGhosts()
	end
	
	client.CSWEPHighlight = nil
	client.centMoverMins = nil

	return true
end

if(CLIENT) then
	function SWEP:RemoveGhosts()
		for entity, offset in pairs(self.ghosts or {}) do
			SafeRemoveEntity(entity)
		end
		
		self.ghosts = {}
	end

	function SWEP:CreateGhosts()
		self:RemoveGhosts()

		local selected = self:GetSelected()
		for entity, offset in pairs(selected) do
			if(!IsValid(entity)) then continue end
		
			local ghost = ents.CreateClientProp(entity:GetModel())

			-- If there's too many entities we might not spawn..
			if (!IsValid(ghost)) then return end

			ghost:SetModel(entity:GetModel())
			ghost:SetPos(entity:GetPos())
			ghost:SetAngles(entity:GetAngles())
			ghost:Spawn()

			ghost:SetModelScale(entity:GetModelScale())
			--ghost:SetMaterial(entity:GetMaterial())
			ghost:SetMaterial("models/player/player_chrome1")
			
			for k, v in pairs(entity:GetBodyGroups() or {}) do
				ghost:SetBodygroup(v.id, entity:GetBodygroup(v.id))
			end

			ghost:ResetSequence(entity:GetSequence())

			--ghost:SetSolid(SOLID_VPHYSICS)
			ghost:SetMoveType(MOVETYPE_NONE)
			ghost:SetNotSolid(true)
			ghost:SetRenderMode(RENDERMODE_TRANSALPHA)
			
			local color = entity:GetColor()
			if(color != Color(255,255,255)) then
				ghost:SetColor(Color(color.r, color.g, color.b, color.a*0.5))
			else
				ghost:SetColor(Color(255, 255, 255, 150))
			end
			
			self.ghosts[ghost] = offset
		end
	end
	
	function SWEP:UpdateGhosts()
		local client = self.Owner
		local trace = client:GetEyeTrace()
		
		local pos = trace.HitPos
		local ang = client:GetAngles()
		ang.x = 0
	
		if(pos) then
			local ghosts = self.ghosts or {}

			for ghost, offset in pairs(ghosts) do
				if(!IsValid(ghost)) then continue end

				ghost:SetPos(pos+offset)
				ghost:SetAngles(ang)
			end
		end
	end

	function SWEP:Think()
		self:UpdateGhosts()
	end

	function SWEP:OnRemove()
		SafeRemoveEntity(self.GhostEntity)
		self.GhostEntity = nil
	end

	function SWEP:DrawHUD()
		local client = LocalPlayer()
		local alpha = 255

		local selected = self:getNetVar("selected")
		if(selected and IsValid(selected)) then
			local name = selected:Name()
			
			nut.util.drawText(name.. " Selected", ScrW() * 0.5, ScrH() * 0.3, ColorAlpha(Color(50,50,255), alpha), 1, 1, "nutSmallFont", alpha * 1)
			nut.util.drawText("Secondary Fire to move to location.", ScrW() * 0.5, ScrH() * 0.3 + 16, ColorAlpha(Color(50,255,50), alpha), 1, 1, "nutSmallFont", alpha * 1)
		end
		
		if((self.nextCEntTrace or 0) < CurTime()) then
			local data = {}
				data.start = self.Owner:GetShootPos()
				data.endpos = data.start + self.Owner:GetAimVector()*4096
				data.filter = {self.Owner, self}
			local trace = util.TraceLine(data)

			if (trace.Hit) then
				local entity = trace.Entity
				if(entity.combat) then
					self.viewed = entity:Name()
					client.CSWEPHighlight = entity
					
					self.nextCEntTrace = CurTime() + 1
				else
					self.viewed = nil
					client.CSWEPHighlight = nil
				end
			end
		end
		
		if(self.viewed) then
			local name = self.viewed
		
			nut.util.drawText(name.. " Viewed", ScrW() * 0.5, ScrH() * 0.7, ColorAlpha(Color(255,50,50), alpha), 1, 1, "nutSmallFont", alpha * 1)
		end
	end
	
	hook.Add("PostDrawOpaqueRenderables", "centMoverSelectBox", function()
		local client = LocalPlayer()

		local mins = client.dragMins
		local maxs = client.dragMaxs
		
		if(mins) then
			if(!maxs) then
				local trace = client:GetEyeTrace()
		
				local pos = trace.HitPos
				
				maxs = pos
			end
			
			local center = (maxs - mins)/2
			
			local minActual = mins - center
			local maxActual = maxs - center
		
			render.DrawWireframeBox(center, Angle(0,0,0), minActual, maxActual, Color(0, 255, 0))
		end
	end)
end