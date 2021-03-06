ITEM.name = "Nightmare"
ITEM.desc = "A small bottle filled with a purple substance. Upon consumption, a person will fall asleep, and immediately have a very vivid nightmare that will last for at least five hours.\nThis substance is effective against all sentient creatures."
ITEM.uniqueID = "drug_nightmare"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "phoenix_storms/bluemetal"
ITEM.duration = 7200
ITEM.price = 30
ITEM.color = Color(148, 0, 210)

ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.notify = "You begin to feel very sleepy."

ITEM.disease = "dis_eyes"
ITEM.disChance = 20

ITEM.stomach = false

ITEM.attrib = {
	["end"] = -10,
	["stm"] = -5,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(148, 0, 210, 255), 5, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
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
		dlight.r = 140
		dlight.g = 0
		dlight.b = 210
		dlight.Brightness = 3
		dlight.Size = 32
		dlight.Decay = 128
		dlight.style = 5
		dlight.DieTime = CurTime() + .1	
	end
end