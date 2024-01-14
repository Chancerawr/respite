ITEM.name = "Living Doll"
ITEM.desc = "it screams when you shake it around."
ITEM.uniqueID = "s_scream"
ITEM.model = "models/props_c17/doll01.mdl"
ITEM.material = "models/gibs/woodgibs/woodgibs03"
ITEM.flag = "v"
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(128, 128, 128)

ITEM.cd = 2
ITEM.pitch = {30,50}
ITEM.sound = "ambient/voices/m_scream1.wav"

-- when item is picked up
ITEM:hook("take", function(item)
	local scream = item.sound
	
	if(IsValid(item.entity)) then
		item.entity:EmitSound(scream)
	else
		item.player:EmitSound(scream)
	end
end)

-- when item is dropped
ITEM:hook("drop", function(item)
	local scream = item.sound
	
	if(IsValid(item.entity)) then
		item.entity:EmitSound(scream)
	else
		item.player:EmitSound(scream)
	end
end)


ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 4.5,
}