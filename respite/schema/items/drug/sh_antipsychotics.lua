ITEM.name = "Antipsychotics"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.material = "models/props_c17/furnituremetal001a"
ITEM.desc = "A bottle filled with numerous pills."
ITEM.uniqueID = "drug_antipsychotics"
ITEM.duration = 6000
ITEM.price = 30

ITEM.attribBoosts = {
	["fortitude"] = 10,
}

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	item.player:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
	
	local cures = {
		"fort_pani",
		"fort_nost",
		"fort_conf",
		"fort_hall",
		"fort_noia",
		"fort_insa",
		"fort_enrage"
	}
	
	for k, v in pairs(cures) do
		if(hasDisease(item.player, v)) then
			cureDisease(item.player, v)
		end
	end
end)
