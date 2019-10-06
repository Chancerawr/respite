ITEM.name = "Blackened Bars"
ITEM.uniqueID = "bars"
ITEM.model = "models/props_trainstation/handrail_64decoration001a.mdl"
ITEM.material = "models/effects/portalrift_sheet"
ITEM.desc = "What have you done?"
ITEM.width = 3
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "???"
ITEM.color = Color(0, 0, 0)

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 20
}

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
			--"resp_teleporter",
			"shade_crawlsmoke"
		}
	
		for i = 1, 3 do
			local ent = ents.Create(table.Random(posSummons))
			
			if (ent:IsValid()) then
				ent:SetPos(client:GetPos())
				local pos = ent:FindSpot( "random", { type = 'hiding', radius = 5000 } )
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
		
		item:setData("producing", CurTime())
		timer.Simple(600, function()
			item:setData("producing", nil)
		end)
		
		return false
	end,
	onCanRun = function(item)
		local prodTime = 600
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