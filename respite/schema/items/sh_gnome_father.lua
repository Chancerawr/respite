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

ITEM.gnome = true

ITEM.iconCam = {
	pos = Vector(280.395, 236.86, 184.78),
	ang = Angle(25, 220, 0),
	fov = 5.08,
}

ITEM.functions.Gnome = {
	icon = "icon16/status_online.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local object = inventory:getFirstItemOfType("j_gnome")
			
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
		
		local customData = object:getData("custom", {})
		
		object:remove()
		
		local gnome = table.Random(gnomeUpgrades)
		
		inventory:addSmart(gnome, 1, position, {custom = customData})
		
		nut.chat.send(client, "itclose", "The gnome in front of " .. item:getName() .. " is changed somehow.")	
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player
		
		if !player:getChar():getInv():getFirstItemOfType("j_gnome") then --if item of importance isn't in the inventory.
			return false
		end
		
		return true
	end
}