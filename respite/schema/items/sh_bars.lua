ITEM.name = "Blackened Bars"
ITEM.desc = "What have you done?"
ITEM.uniqueID = "bars"
ITEM.model = "models/props_trainstation/handrail_64decoration001a.mdl"
ITEM.material = "models/effects/portalrift_sheet"
ITEM.width = 2
ITEM.height = 2
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "???"
ITEM.color = Color(0, 0, 0)

local function blindTeleport(client)
	client:ConCommand("hellend")
	timer.Simple(3, function()
		local newPos = client:GetPos()
		
		for k, v in pairs(ents.GetAll()) do
			if(v.respite) then
				newPos = v:GetPos()
				v:SetPos(client:GetPos())
				break
			end
		end
		
		client:SetPos(newPos)
	end)
end

ITEM.functions.Stare = {
	name = "Stare Into",
	icon = "icon16/eye.png",
	--sound = "ambient/gas/steam2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
	
		nut.chat.send(client, "itclose", "You feel like something is staring back at you.")	
	
		local posSummons = {
			"nz_undead_shade",
			"shade_crawlsmoke",
			"resp_stranger",
		}

		--60% chance of enemy spawn
		if(math.random(1,10) > 4) then
			local ent = ents.Create(table.Random(posSummons))
			if (IsValid(ent)) then
				local pos = ent:FindSpot("random", {type = 'hiding', radius = 5000})
				if(pos) then
					ent:SetPos(pos)
					ent:Spawn()
					ent:SetOwner(self)
					
					timer.Simple(0.5, function()
						ent:SetEnemy(client)
					end)
				else
					ent:Remove()
				end
			end
		end
		
		--20% chance of visual distortion
		if(math.random(1,10) > 8) then
			client:ConCommand("mat_corrupt")	  	
			timer.Simple(2, function() 
				client:ConCommand("mat_repair")
			end)
		end
		
		--10% chance of item
		if(math.random(1,10) > 9) then
			local position = client:getItemDropPos()
			nut.item.spawn("blight", position)
		end
		
		if(nut.plugin.list["envmanager"]) then
			--10% chance of a weird spooky thing happening
			if(math.random(1,10) > 9) then
				table.Random(nut.plugin.list["envmanager"].minorSpooks)(client)
			end
		end

		--5% chance of a swap teleport
		if(math.random(1,100) > 94) then
			blindTeleport(client)
		end

		item:setData("producing", CurTime())
		timer.Simple(600 * nut.config.get("devTimeMult", 1), function()
			item:setData("producing", nil)
		end)

		return false
	end,
	onCanRun = function(item)
		local prodTime = 600 * nut.config.get("devTimeMult", 1)
		if(item:getData("producing")) then
			if(item:getData("producing") < CurTime() and item:getData("producing") + prodTime >= CurTime()) then
				return false
			end
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("producing", false)) then
		desc = desc .. "\nThere is nothing within the darkness."
	end
	
	return Format(desc)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 20
}