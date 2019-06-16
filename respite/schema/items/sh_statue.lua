ITEM.name = "Peculiar Statue"
ITEM.uniqueID = "statue"
ITEM.model = "models/props_combine/breenbust.mdl"
ITEM.material = "models/props_pipes/destroyedpipes01a"
ITEM.desc = "It appears to be some kind of bust, but something about it makes you uncomfortable."
ITEM.width = 2
ITEM.height = 3
ITEM.flag = "v"
ITEM.price = 500
ITEM.color = Color(0, 0, 0)
ITEM.data = {hatred = 0}

ITEM.category = "Machines"

ITEM.iconCam = {
	ang = Angle(0, 270, 0),
	fov	= 8,
	pos	= Vector(0, 200, 0)
}

ITEM.functions.Blight = {
	icon = "icon16/eye.png",
	sound = "ambient/creatures/rats4.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local blight = inventory:getFirstItemOfType("blight")	
			
		if (blight) then
			blight:remove()
			nut.item.spawn("food_blood", position)
			nut.chat.send(client, "itclose", "The statue begins crying blood.")	
			client:TakeDamage(25, client, client)
			
			local hatred = item:getData("hatred", 0)
			if(hatred > 9) then
				client:notify("A feeling of dread comes over you.")
			
				local posSummons = {
					"resp_teleporter",
					"shade_crawlsmoke"
				}
			
				local ent = ents.Create(table.Random(posSummons))
				
				if (ent:IsValid()) then
					ent:SetPos(client:GetPos())
					local pos = ent:FindSpot( "random", { type = 'hiding', radius = 5000 } )
					if(pos) then
						ent:SetPos(pos)
						ent:Spawn()
						ent:SetOwner( self )
						
						timer.Simple(0.5, function()
							ent:SetEnemy(client)
						end)
					else
						ent:Remove()
					end
				end
			end
			
			item:setData("hatred", hatred + 1)
		else
			client:notify("You need blight.")
		end
			
		return false
	end
}

ITEM.functions.Battery = {
	name = "Charged Battery",
	icon = "icon16/asterisk_orange.png",
	sound = "ambient/energy/zap9.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local required = inventory:getFirstItemOfType("ammo_battery")
			
		required:remove()
		nut.item.spawn("haze_bottled_blood", position)

		inventory:add("j_battery_dead")
		
		nut.chat.send(client, "itclose", "The device is charged momentarily, and produces a bottle filled with some kind of blood red gas.")

		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("ammo_battery") then 
			return false
		end
		
		return true
	end
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("hatred")) then
		desc = desc .. "\nHatred: " .. self:getData("hatred") .. "."
	end
	
	return Format(desc)
end
