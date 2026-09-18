local PLUGIN = PLUGIN
local INJURY

--simple bandage, fixes things that bandages fix
INJURY = {}
INJURY.id = "bandage"
INJURY.name = "Bandaged"
INJURY.tags = {
	["External"] = true,
}
INJURY.treats = "Bandage"
INJURY.treatAmt = {0,2}
PLUGIN:RegisterInjury(INJURY)

--heavier bandage, fixes things that bandages fix
INJURY = {}
INJURY.id = "gauze"
INJURY.name = "Wrapped"
INJURY.tags = {
	["External"] = true,
}
INJURY.treats = "Bandage"
INJURY.treatAmt = {1,3}
PLUGIN:RegisterInjury(INJURY)

--antibiotics for infections and rot
INJURY = {}
INJURY.id = "antibiotics"
INJURY.name = "Antibiotics"
INJURY.tags = {
	["External"] = true,
}
INJURY.treats = "Antibiotics"
INJURY.treatAmt = {5,10}
PLUGIN:RegisterInjury(INJURY)