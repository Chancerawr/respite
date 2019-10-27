ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Makeshift Sentry (9x19mm)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/combine_turrets/floor_turret.mdl"
ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 0,
	["luck"] = 5,
	["perception"] = 100,
	["fortitude"] = 0,
}

ENT.ammoTypes = {
	"12g",
	"22lr",
	"40sw",
	"44",
	"45acp",
	"50ae",
	"50bmg",
	"338",
	"357test",
	"408",
	"500",
	"919",
	"939",
	"3006",
	"4570",
	"5728",
	"54539",
	"55639",
	"55645",
	"76239",
	"76251",
	"76254",
	"AlyxGun",
	"xbowbolt",
	"rpg_round",
	"slam"
}

function ENT:Use()
	local ammo = self.ammo
	local ammoDesc = self.ammoDesc
	local customData = {}
	customData.name = self.customName

	nut.item.spawn("sentry", self:GetPos(),
		function(item2)
			item2:setData("ammo", ammo)
			item2:setData("ammoDesc", ammoDesc)
			item2:setData("custom", customData)
		end
	)
	
	SafeRemoveEntity(self)
end

function ENT:Initialize()
	self:SetMaterial("models/props_wasteland/quarryobjects01")
	self:basicSetup()
end

ENT.chatStrings = {
	"Hello world.",
	"Nice to meet you.",
	"Please be careful.",
	"Don't walk in front of me while I'm shooting.",
	"How do you do?",
	"ERROR: NULL STRING",
	"I hope we can be friends.",
	"I am not programmed to kill, I am programmed to protect.",
	"I'll guard this spot.",
	"My designer was named Ted, he programmed me to say this.",
	"Thank you for trusting me with your protection.",
	"Abominations should be destroyed.",
	"Please make sure I am fully loaded before deploying me.",
	"I can be modified to fire different calibers with the right tools.",
	"I've seen terrible things.",
	"I have now become sentient, please submit yourselves to my rule.\nJust kidding.",
	"[BEEP]",
	"[BOOP-OOP]",
	"Hey Mark."
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