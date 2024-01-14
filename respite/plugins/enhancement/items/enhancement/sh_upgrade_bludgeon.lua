ITEM.name = "Bludgeon Weight"
ITEM.desc = "Increases a blunt weapon's damage, but decreases its attack rate."
ITEM.uniqueID = "upgrade_bludgeon"
ITEM.model = "models/props_junk/cardboard_box004a.mdl"
ITEM.flag = "V"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 1
ITEM.combiner = true

ITEM.weaponOnly = true

ITEM.slot = "Bludgeon"

ITEM.dmg = {
	["Blunt"] = 8,
}

ITEM.customW = {
	["wepDmgMin"] = 15,
	["wepDmgMax"] = 30,
	["wepDelay"] = 0.05,
}