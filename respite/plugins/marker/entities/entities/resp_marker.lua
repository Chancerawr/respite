local PLUGIN = PLUGIN

if (SERVER) then
	AddCSLuaFile()
end

ENT.Type			= "anim"
ENT.Base 			= "base_gmodentity"
ENT.Spawnable		= true
ENT.AdminSpawnable  = true
ENT.PrintName		= "Marker"
ENT.Category 		= "Respite"
ENT.RenderGroup 	= RENDERGROUP_TRANSLUCENT
ENT.Instructions 	= ""

ENT.Editable = true

function ENT:SpawnFunction(client, tr)
	if !tr.Hit then
		return
	end
	
	local ent = ents.Create(self.ClassName)
	ent:SetPos(tr.HitPos + tr.HitNormal)
	ent:SetAngles(client:GetAngles())
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:Initialize()	
	self:SetModel("models/hunter/blocks/cube05x05x05.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:DrawShadow(false)
	
	local phys = self:GetPhysicsObject()  	
	if IsValid(phys) then
		phys:EnableCollisions(false)
		phys:EnableGravity(false)
		phys:EnableMotion(false)
	end

	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

	if(SERVER) then
		if(!self.loaded) then
			self:SetMarkerColor(Vector(1,1,1))
		end
	end
end

function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "MarkerName", { KeyName = "markername", Edit = { type = "String", title = "Name", category = "Marker", order = 1 } } )
	self:NetworkVar( "Vector", 0, "MarkerColor", { KeyName = "markercolor", Edit = { type = "VectorColor", title = "Color", category = "Marker", order = 2 } } )
end

function ENT:OnTakeDamage(dmginfo)
end

--[[
function ENT:GetMarkerColor()
	local colData = self:GetMarkerColor()

	--local color = Color(colData[1], colData[2], colData[3])
	local color = Color(255,255,255)

	return color
end
--]]

--[[
function ENT:GetName()
	local name = self:GetMarkerName() or ""

	return name
end
--]]

--[[
function ENT:GetTextColor()
	local color = self:GetMarkerColor()

	return color
end
--]]

function ENT:OnRemove()
	if (!self.nutForceDelete) then
		if (!PLUGIN.loadedData) then return end
		if (self.nutIsSafe) then return end
		if (nut.shuttingDown) then return end
	end
	
	PLUGIN:SaveMarkers()
end

if(SERVER) then
	function ENT:Think()
		--if held with physgun, gravgun, or hands
		if(self:IsPlayerHolding()) then
			self.playerMoved = true
		elseif(self.playerMoved) then
			self.playerMoved = nil

			PLUGIN:SaveMarkers()
		end
	end
end

if(CLIENT) then
	function ENT:Draw()
		local client = LocalPlayer()
		
		local inNoclip = client:GetMoveType() == MOVETYPE_NOCLIP 
		and !client:InVehicle()
		
		if(inNoclip) then
			self:DrawModel()
		end
	end
end