ITEM.name = "Canned Sadness"
ITEM.desc = "A can filled with.. Something sad, if I had to guess."
ITEM.uniqueID = "food_sadness"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.material = "models/props_wasteland/tugboat01"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.color = Color(148, 0, 210)
ITEM.sound = "ambient/creatures/town_muffled_cry1.wav"
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["fortitude"] = 2,
	["end"] = 1
}
 
ITEM.notify = "You feel sad."
 
ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}