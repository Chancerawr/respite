ITEM.name = "Lamp"
ITEM.desc = "A lamp used for illuminating PAIN."
ITEM.model = "models/props_interiors/Furniture_Lamp01a.mdl"
ITEM.class = "respite_lamp"
ITEM.uniqueID = "hl2_m_lamp"
ITEM.slot = "melee"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 8,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2,
	["j_scrap_cloth"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

function ITEM:onEntityCreated(entity)
	entity:SetPos(entity:GetPos()+entity:GetUp()*24)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 20.5,
}