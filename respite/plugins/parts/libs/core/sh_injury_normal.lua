local PLUGIN = PLUGIN
local INJURY

INJURY = {}
INJURY.id = "bruise"
INJURY.name = "Bruise"
INJURY.tags = {
	["Skin"] = true,
	["Blood"] = true,
}
INJURY.treatment = {
	["Blight"] = true
}
PLUGIN:RegisterInjury(INJURY)

INJURY = {}
INJURY.id = "fracture"
INJURY.name = "Fracture"
INJURY.tags = {
	["Bone"] = true,
}
INJURY.treatment = {
	["Blight"] = true
}
PLUGIN:RegisterInjury(INJURY)

INJURY = {}
INJURY.id = "burn"
INJURY.name = "Burn"
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Blight"] = true
}
PLUGIN:RegisterInjury(INJURY)

INJURY = {}
INJURY.id = "burn_acid"
INJURY.name = "Acid Burn"
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Blight"] = true
}
PLUGIN:RegisterInjury(INJURY)

INJURY = {}
INJURY.id = "laceration"
INJURY.name = "Laceration"
INJURY.bleeds = true
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Blight"] = true
}
PLUGIN:RegisterInjury(INJURY)

INJURY = {}
INJURY.id = "puncture"
INJURY.name = "Puncture"
INJURY.bleeds = true
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Blight"] = true
}
PLUGIN:RegisterInjury(INJURY)

INJURY = {}
INJURY.id = "abrasion"
INJURY.name = "Abrasion"
INJURY.bleeds = true
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Blight"] = true
}
PLUGIN:RegisterInjury(INJURY)

INJURY = {}
INJURY.id = "bullet"
INJURY.name = "Bullet Wound"
INJURY.bleeds = true
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Blight"] = true
}
PLUGIN:RegisterInjury(INJURY)

INJURY = {}
INJURY.id = "concussion"
INJURY.name = "Concussion"
INJURY.tags = {
	["Head"] = true,
}
INJURY.treatment = {
	["Blight"] = true
}
PLUGIN:RegisterInjury(INJURY)

--better as a disease
--[[
INJURY = {}
INJURY.id = "poison"
INJURY.name = "Poison"
INJURY.tags = {
	["Body"] = true,
}
PLUGIN:RegisterInjury(INJURY)
--]]