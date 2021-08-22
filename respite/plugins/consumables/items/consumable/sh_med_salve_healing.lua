ITEM.name = "Recovery Salve"
ITEM.desc = "A strange vial that is filled with some bright green liquid.\nUpon topical application, this liquid enhances normal human regeneration, and allows for a speedier recovery from wounds. However, it is not good enough to replace necessary medical treatment."
ITEM.uniqueID = "salve_healing"
ITEM.model = "models/healthvial.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.hp = 100
ITEM.hpTime = 60
ITEM.price = 75
ITEM.color = Color(232, 0, 0)
ITEM.container = "j_empty_vial"
ITEM.color = Color(50, 255, 50)

ITEM.sound = "items/medshot4.wav"
ITEM.soundPitch = 110

ITEM.stomach = false

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(30, 160, 30, 255), 1, 1)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}