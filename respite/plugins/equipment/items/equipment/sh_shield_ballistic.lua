ITEM.name = "Ballistic Shield"
ITEM.desc = "A protection device deployed by police, paramilitaries, and armed forces that are designed to stop or deflect bullets and other projectiles fired at their carrier. Ballistic shields also protect from less serious threats such as thrown items. Ballistic shields are similar to riot shields, but offer greater protection and are typically used by special units or in situations where riot shields would not offer adequate protection."
ITEM.uniqueID = "shield_ballistic"
ITEM.model = "models/cloud/ballisticshield_mod.mdl"
ITEM.width = 2
ITEM.height = 3
ITEM.slot = "Shield"

ITEM.armor = 100

ITEM.rarity = 0.1
ITEM.lootTags = {
	["armor"] = true,
	["shield"] = true,
}

ITEM.dmg = {
	["Blunt"] = 5,
}

ITEM.scaling = {
	["end"] = 0.25,
}

ITEM.attrib = {
	["end"] = 8,
	["stm"] = -10,
}

ITEM.res = {
	["Slash"] = 15,
	["Blunt"] = 15,
	["Pierce"] = 15,
	
	["Pistol"] = 20,
	["Magnum"] = 20,
	["Rifle"] = 15,
	["Shotgun"] = 10,
	["Sniper"] = 5,
	
	["Fire"] = 10,
	["Cold"] = 10,
	["Explosion"] = 10,
	
	["Electric"] = -10,
}

ITEM.upgradeSlots = { 
	["Dream"] = 2,
}

ITEM.actions = {
	"shield_hunker",
}

ITEM.salvage = {
	["j_scrap_plastics"] = 8
}

ITEM.iconCam = {
	pos = Vector(-200, 3.5, 22),
	ang = Angle(0, -0, 0),
	fov = 10,
}