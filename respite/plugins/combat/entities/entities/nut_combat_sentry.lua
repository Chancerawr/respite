ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Makeshift Sentry"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/combine_turrets/floor_turret.mdl"
ENT.material = "models/props_wasteland/quarryobjects01"

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 25,
	["end"] = 3,
	["luck"] = 0,
	["perception"] = 25,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Pistol"] = 20,
}

ENT.hp = 60
ENT.armor = 30

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 20,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = 100,
	["Shard"] = 100,
	["Distort"] = 0,
	["Time"] = 0,
	
	["Fire"] = -50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 100,
	["Electric"] = -50,
}

function ENT:Initialize()
	self:basicSetup()
	
	local physObj = self:GetPhysicsObject()
	if(IsValid(physObj)) then
		physObj:SetMass(50)
	end
end

--[[
function ENT:Use(client)
	local char = client:getChar()
	local inventory = client:getInv()

	if(self.itemID) then
		local item = nut.item.instances[self.itemID]
	
		local x, y = inventory:findFreePosition(item)
		if(x and y) then
			item:setData("x", x)
			item:setData("y", y)
			
			inventory:addItem(item)
		else
			item:spawn(self:GetPos())
		end
	end

	SafeRemoveEntity(self)
end
--]]

ENT.chatStrings = {
	"[SCANNING]",
}

function ENT:Think()
	if(SERVER) then	
		if((self.nextSay or 0) < CurTime()) then
			self:EmitSound("hl1/fvox/blip.wav", 75, 150)
			nut.chat.send(self, "say_npc", self:getNetVar("name", self.PrintName).. " says, \"<:: " ..table.Random(self.chatStrings).." ::>\"")

			self.nextSay = CurTime() + math.random(300, 600)
		end
	end
end