ITEM.name = "Shard"
ITEM.uniqueID = "shard"
ITEM.desc = "A peculiar crystalline shard, it emits a dim white light."
ITEM.model = "models/gibs/glass_shard04.mdl"
ITEM.material = "models/props/de_inferno/offwndwb_break"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "1"
ITEM.category = "Shard"
ITEM.color = Color(255, 255, 255)

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 7,
}

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:SetModelScale(.7)
		entity:DrawShadow(false)
		
		local pos = entity:GetPos()
		local dlight = DynamicLight(entity:EntIndex())
		local perc = ( ( 9000000 - CurTime() )/ 9000000 )
		dlight.Pos = pos
		dlight.r = 255
		dlight.g = 255
		dlight.b = 255
		dlight.Brightness = 3
		dlight.Size = 32
		dlight.Decay = 128
		dlight.style = 5
		dlight.DieTime = CurTime() + .1	
	end
end

ITEM.functions.Merge = {
	tip = "Merge shards in inventory.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local shardcount = item:getData("Amount", 1)	
		local items = inventory:getItems()
		for k, v in pairs(items) do
			if(v.uniqueID == "shard" and v != item) then
				shardcount = shardcount + v:getData("Amount", 1)
				v:remove()
			end
		end
		
		if(client:getChar():getFaction() == FACTION_DRIFTER) then
			if (shardcount >= 10) then
				if(!inventory:getFirstItemOfType("respite_orb")) then
					shardcount = shardcount - 10
					inventory:add("respite_orb", 1, { char = client:getChar():getID() })
				end
			end
		end
		
		while (shardcount > 9) do
			inventory:add("shard", 1, { Amount = 9 })
			shardcount = shardcount - 9
		end
		
		if(shardcount > 0) then
			inventory:add("shard", 1, { Amount = shardcount })
		end
		
		item.player:EmitSound("physics/glass/glass_bottle_impact_hard3.wav")
		return true
	end,
	onCanRun = function(item)
		if (IsValid(item.entity)) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)		
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		
		inventory:addSmart("shard_dust", 1, position, { Amount = item:getData("Amount", 1)*5 })
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("kit_salvager")
  end
}

function ITEM:getDesc()
	local str
	if (!self.entity or !IsValid(self.entity)) then
		str = "A peculiar crystalline shard, it emits a dim white light.\nShard Count: %s"
	else
		str = "A peculiar crystalline shard, it emits a dim white light."
	end
	return Format(str, (self:getData("Amount", 1)))
end