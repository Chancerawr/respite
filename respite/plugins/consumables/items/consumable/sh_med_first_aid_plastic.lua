ITEM.name = "Plastic Aid Kit"
ITEM.desc = "A medical kit the contains a large amount of plastic dust, clean water, bandages, and gauze."
ITEM.uniqueID = "first_aid_plastic"
ITEM.model = "models/items/healthkit.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.category = "Medical"
ITEM.width = 2
ITEM.height = 2
ITEM.hp = 50
ITEM.hpTime = 10
ITEM.price = 0
ITEM.container = "j_used_first_aid_kit"
ITEM.color = Color(130, 130, 130)
ITEM.quantity2 = 6

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 110

ITEM.stomach = false

ITEM.faction = {
	[FACTION_PLASTIC or -1] = true,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(100, 100, 100, 200), 1, 0)
end

ITEM.loot = {
	["Medical"] = 1,
	["Plastic"] = 1,
}

ITEM.craft = {
	hp = 50,
	
	buffTbl = {
		res = {
			["Electric"] = 15,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(5, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5.8,
}