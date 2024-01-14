ITEM.name = "Cursed Apple"
ITEM.desc = "A spherical green fruit, this one glows in the dark."
ITEM.uniqueID = "food_apple_cursed"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.material = "models/props_lab/xencrystal_sheet"
ITEM.quantity2 = 1
ITEM.price = 50
ITEM.color = Color(20, 100, 20)

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 0.1,
	["Fruit"] = 0.1,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["stm"] = 3,
			["str"] = 3,
			["end"] = 3,
			["perception"] = 3,
			["accuracy"] = 3,
			["fortitude"] = 3,
			["luck"] = 3,
			["medical"] = 3,
		},
	},
}

ITEM.extraFunc = function(item, client)
	local char = client:getChar()
	
	local luck = client:getChar():getAttrib("luck")
	local luckR = math.random(0, luck)
	local roll = math.random(luckR, 100)
	
	local ranAttrib = table.Random(nut.attribs.list)
	
	if(roll > 40) then --60% chance (without luck factor)
		client:notify("The apple is delicious, you feel like you've become something more.")
		char:updateAttrib(ranAttrib, 1)
		
		client:ScreenFade(1, Color(180, 255, 180, 255), 3, 0)
	else
		client:notify("The apple is rotten to the core, you feel like you lost something.")
		char:updateAttrib(ranAttrib, -0.9)
		
		client:ScreenFade(1, Color(255, 108, 180, 255), 3, 0)
	end
end

ITEM.iconCam = {
	pos = Vector(65.48, 54.94, 39.86),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}