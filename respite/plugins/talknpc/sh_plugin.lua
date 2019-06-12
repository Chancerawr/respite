local PLUGIN = PLUGIN
PLUGIN.name = "Talking NPCs (Enhanced)"
PLUGIN.author = "Black Tea (NS 1.0), Neon (NS 1.1). Edited by Chancer."
PLUGIN.desc = "Adding talking NPCs."
PLUGIN.chatDelay = { min = .5, max = 1 }
PLUGIN.defaultDialogue = {
	npc = {
		["_start"] = "Hello.",
		["how"] = "Same old, same old.",
		["!quest"] = "Take a look.",
		["!vendor"] = "Take a look."
	},
	player = {
		["_quit"] = "Goodbye.",
		["how"] = "How is your day?",
		["!quest"] = "Quests",
		["!vendor"] = "Trade?"
	},
}
PLUGIN.defaultQuest = {
	npc = {
		["_start"] = ""
	},
	player = {
		["_quit"] = "Goodbye."
	},
}

if (SERVER) then	
	local function applyGroups(entity, groups)
		for k, v in pairs(groups) do
			entity:SetBodygroup( 1, groups[1] or 0)
			entity:SetBodygroup( 2, groups[2] or 0)
			entity:SetBodygroup( 3, groups[3] or 0)
			entity:SetBodygroup( 4, groups[4] or 0)
			entity:SetBodygroup( 5, groups[5] or 0)
			entity:SetBodygroup( 6, groups[6] or 0)
		end
	end

	function PLUGIN:SaveData()
		local data = {}
		
		for k, v in ipairs(ents.FindByClass("nut_talker")) do
			local bodyGroups = {}
			bodyGroups[1] = v:GetBodygroup(1)
			bodyGroups[2] = v:GetBodygroup(2)
			bodyGroups[3] = v:GetBodygroup(3)
			bodyGroups[4] = v:GetBodygroup(4)
			bodyGroups[5] = v:GetBodygroup(5)
			bodyGroups[6] = v:GetBodygroup(6)
		
			data[#data + 1] = {
				name = v:getNetVar("name"),
				desc = v:getNetVar("desc"),
				pos = v:GetPos(),
				angles = v:GetAngles(),
				model = v:GetModel(),
				material = v:GetMaterial(),
				skin = v:GetSkin(),
				groups = bodyGroups,
				factions = v:getNetVar("factiondata", {}),
				dialogue = v:getNetVar("dialogue", self.defaultDialogue),
				quests = v:getNetVar("quests", {}),
				classes = v:getNetVar("classdata", {}),
				anim = v:getNetVar("anim"),
				
				items = v.items,
				money = v.money,
				scale = v:getNetVar("scale"),
				flag = v:getNetVar("flag"),
			}
		end
			
		self:setData(data)
	end

	function PLUGIN:LoadData()
		for k, v in ipairs(ents.FindByClass("nut_talker")) do
			v.nutIsSafe = true
			v:Remove()
		end
	
		for k, v in ipairs(self:getData() or {}) do
			local entity = ents.Create("nut_talker")
			entity:SetPos(v.pos)
			entity:SetAngles(v.angles)
			entity:Spawn()
			entity:SetModel(v.model)
			entity:SetMaterial(v.material)
			entity:SetSkin(v.skin or 0)
			entity:setNetVar("dialogue", v.dialogue)
			entity:setNetVar("quests", v.quests)
			entity:setNetVar("factiondata", v.factions)
			entity:setNetVar("classdata", v.classes)
			entity:setNetVar("name", v.name)
			entity:setNetVar("desc", v.desc)
			entity:setNetVar("anim", v.anim)
			
			entity.items = v.items or {}
			entity.money = v.money
			entity:setNetVar("scale", v.scale or 0.5)
			entity:setNetVar("flag", v.flag)
			
			if(v.groups) then
				applyGroups(entity, v.groups)
			end
		end
	end
end