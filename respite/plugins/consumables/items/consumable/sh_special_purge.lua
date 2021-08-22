ITEM.name = "All Purge"
ITEM.desc = "A strange consumable medicine that purges all illnesses from a person. Rare and very valuable."
ITEM.uniqueID = "medical_purge"
ITEM.model = "models/items/healthvial2.mdl"
ITEM.material = "models/props_lab/cornerunit_cloud"
ITEM.hp = 15
ITEM.hpTime = 1
ITEM.price = 0
ITEM.container = "j_empty_vial"
ITEM.color = Color(232, 0, 0)

ITEM.stomach = false
ITEM.noEnhance = true

ITEM.extraFunc = function(item, client)
	for k, v in pairs(DISEASES.diseases) do --removes all of them for now
		if(client:hasDisease(v.uid)) then
			if(!v.unpurgeable) then
				client:removeDisease(v.uid)
			end
		end
	end
end

ITEM.confirm = {
	name = "Purge",
	query = "Are you sure you want to consume this item?",
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(0, 0, 0, 200), 5, 2)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}