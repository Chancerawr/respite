ITEM.name = "Paper Base"
--ITEM.uniqueID = "misc_paper"
ITEM.model = Model("models/props_c17/paper01.mdl")
ITEM.desc = "A piece of paper that you can write on.\nPrivate Note: Only you can edit texts.\nPublic Note: Anyone can edit texts."
ITEM.flag = "v"
ITEM.price = 1
--ITEM.functions = {}
ITEM.functions.Private = {
	alias = "Write (Private)",
	icon = "icon16/page_white_paintbrush.png",
	onRun = function(item)
		local player
		if (item:getOwner() != nil) then
			player = item:getOwner()
		else
			player = item.player
		end
		if (SERVER) then
			local position
			if (IsValid(entity)) then
				position = entity:GetPos() + Vector(0, 0, 4)
			else
				local data2 = {
					start = item.player:GetShootPos(),
					endpos = item.player:GetShootPos() + item.player:GetAimVector() * 72,
					filter = item.player
				}
				local trace = util.TraceLine(data2)
				position = trace.HitPos + Vector(0, 0, 16)
			end
			
			local entity2 = entity
			local entity = ents.Create("nut_paper")
			entity:SetPos(position)
			if (IsValid(entity2)) then
				entity:SetAngles(entity2:GetAngles())
			end
			entity:setNetVar( "owner", item.player:SteamID() )
			entity:setNetVar( "private", true )
			entity:Spawn()
			entity:Activate()
			entity:SetCreator(player)
		end
	end
}
ITEM.functions.Public = {
	alias = "Write (Public)",
	icon = "icon16/page_white_paint.png",
	onRun = function(item)
		local player
		if (item:getOwner() != nil) then
			player = item:getOwner()
		else
			player = item.player
		end
		if (SERVER) then
			local position
			if (IsValid(entity)) then
				position = entity:GetPos() + Vector(0, 0, 4)
			else
				local data2 = {
					start = item.player:GetShootPos(),
					endpos = item.player:GetShootPos() + item.player:GetAimVector() * 72,
					filter = item.player
				}
				local trace = util.TraceLine(data2)
				position = trace.HitPos + Vector(0, 0, 16)
			end
			
			local entity2 = entity
			local entity = ents.Create("nut_paper")
			entity:SetPos(position)
			if (IsValid(entity2)) then
				entity:SetAngles(entity2:GetAngles())
			end
			entity:setNetVar( "owner", item.player )
			entity:setNetVar( "private", false )
			entity:Spawn()
			entity:Activate()
			entity:SetCreator(player)			
		end
	end
}