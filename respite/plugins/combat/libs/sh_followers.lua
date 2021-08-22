local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

--creature tags, WIP
function playerMeta:getFollowers()
	local followers = self:getChar():getData("followers", {})
	
	--[[
	followers = {
		{
			name = "Bob",
			desc = "He's really cool.",
			model = "models/Humans/Group02/male_02.mdl",
			material = "",
			color = Color(255,100,100),
			class = "nut_combat_custom",
			attribs = {
				["stm"] = 12,
				["str"] = 12,
				["accuracy"] = 12,
				["end"] = 15,
				["luck"] = 5,
				["perception"] = 10,
				["fortitude"] = 5,
			},
			bodygroups = {
			
			},
		},
	}
	--]]
	
	return followers
end

if(SERVER) then
	netstream.Hook("nut_followerSpawn", function(client, followerID)
		local followers = client:getFollowers()
		local follower = followers[followerID]
		
		local ent = ents.Create(follower.class or "nut_combat_custom")
		
		ent:SetPos(client:GetPos())
		
		ent:setNetVar("name", follower.name or "Unnamed")
		ent:setNetVar("desc", follower.desc or "")

		if(follower.model) then
			ent:SetModel(follower.model)
		end
		
		if(follower.material) then
			ent:SetMaterial(follower.material)
		end

		if(follower.color) then
			ent:SetColor(follower.color)
		end

		if(follower.attribs) then
			ent.attribs = follower.attribs
		end

		if(follower.bodygroups) then
			ent.attribs = follower.attribs
		end

		ent:Spawn()
	end)
end