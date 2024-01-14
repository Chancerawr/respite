ITEM.name = "Kawasaki H2R (Violet)"
ITEM.desc = "A violet motorcycle."
ITEM.class = "viobike"
ITEM.model = "models/kawasaki_ninja_h2r.mdl"
ITEM.price = 0
ITEM.skin = 1

function ITEM:spawnFunc(client, vehicle)
	vehicle:SetColor(Color(100, 0, 255, 255))
    util.SpriteTrail(vehicle, 0, Color(180, 0, 255), true, 25, 5, 10, 1 / ( 25 + 5 ) * 0.5, "trails/plasma")
end