ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Strange Lamp"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/props_interiors/furniture_lamp01a.mdl"
ENT.noRag = true
ENT.espIgnore = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Use()
	SafeRemoveEntity(self)
	nut.item.spawn("hl2_m_lamp_strange", self:GetPos())
end

function ENT:Initialize()
	self:basicSetup()
	timer.Simple(0.1, function()
		--self:SetPos(self:GetPos() + Vector(0,0,35))
	end)
end

ENT.chatStrings = {
	"I know what you have done.",
	"I know what has been done to you.",
	"I saw it all.",
	"Do you think we could be friends? We are pretty similar.",
	"I will light the way.",
	"Without light, there is darkness.",
	"I don't want to be alone.",
	"Don't be scared.",
	"Hello.",
	"Nice to meet you.",
	"Greetings.",
	"I won't hurt you.",
	"I want to help.",
	"Take me with you.",
	"Even if the sun goes out, I will light the way. I promise.",
	"I want to help.",
	"Don't leave me.",
	"Don't leave me all alone."
}

function ENT:Think()
	if(SERVER) then
		if(!self.nextSay) then self.nextSay = CurTime() + 10 end
		
		if(self.nextSay < CurTime()) then
			--self:EmitSound("hl1/fvox/blip.wav", 75, 150)
			nut.chat.send(self, "whisper_npc", self.name or self.PrintName .. " whispers, \"" ..table.Random(self.chatStrings).."\"")
			
			self.nextSay = CurTime() + math.random(300, 600)
		end
	end
	
	if (CLIENT) then
		if(!self.damaged) then
			local pos = self:GetPos() + self:GetUp()
			local dlight = DynamicLight(self:EntIndex())
			dlight.Pos = pos
			dlight.r = 255
			dlight.g = 69
			dlight.b = 0
			dlight.Brightness = 1
			dlight.Size = 256
			dlight.Decay = 64
			dlight.style = 5
			dlight.DieTime = CurTime() + 5
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if(!self.damaged) then self.damaged = true end
end