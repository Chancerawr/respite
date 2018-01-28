ITEM.name = "Father Gnome"
ITEM.uniqueID = "gnome_father"
ITEM.model = "models/props_junk/gnome.mdl"
--ITEM.material = "models/props_combine/stasisfield_beam"
ITEM.desc = "This gnome looks like some kind of priest. He has a happy, smiling face."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Gnomes"
ITEM.color = Color(255, 140, 20)
ITEM.data = { producing2 = 0 }

ITEM.iconCam = {
	pos = Vector(280.39529418945, 236.86444091797, 184.78364562988),
	ang = Angle(25, 220, 0),
	fov = 5.0807393438119,
}

ITEM.functions.Gnome = {
	icon = "icon16/box.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:hasItem("j_gnome")
			
			
		local gnomeUpgrades = { --drops pretty much any gnome item
			"gnome_crafty",
			"gnome_jack",
			"gnome_lucky",
			"gnome_perceptive",
			"gnome_sniper",
			"gnome_strong",
			"gnome_sturdy",
			"gnome_swift",
			"gnome_warrior",
			"gnome_father",
			"alchemist"
		}
			
		--inventory:add(table.Random(gnomeUpgrades), 1, { customName = object:getName(), customCol = object:getData("customCol", nut.config.get("color") )})
		
		local oName = object:getData("customName", object:getName())
		local oCol = object:getData("customCol", nut.config.get("color"))
		
		nut.item.spawn(table.Random(gnomeUpgrades), position,
			function(item2)
				item2:setData("customName", oName)
				item2:setData("customCol", oCol)
			end
		)
		
		object:remove()
		
		nut.chat.send(client, "itclose", "The gnome in front of " .. item:getName() .. " is changed somehow.")	
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if !player:getChar():getInv():hasItem("j_gnome") then --if item of importance isn't in the inventory.
			return false
		end
	end
}


