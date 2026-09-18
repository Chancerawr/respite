local PLUGIN = PLUGIN
local PART

PART = {}
PART.id = "head"
PART.name = "Human Head"
PART.hp = 100
PART.pos = 1 --position in menu, heads should be 1
PART.tags = {
	["External"] = true,
	["Vital"] = true,
	["Blood"] = true,
	["Bone"] = true,
	["Skin"] = true,
	["Head"] = true,
}
PLUGIN:RegisterPart(PART)

PART = {}
PART.id = "torso"
PART.name = "Human Torso"
PART.hp = 200
PART.pos = 0 --position in menu, torsos should be 0
PART.tags = {
	["External"] = true,
	["Vital"] = true,
	["Blood"] = true,
	["Bone"] = true,
	["Skin"] = true,
}
PLUGIN:RegisterPart(PART)

PART = {}
PART.id = "arm_l"
PART.name = "Human Left Arm"
PART.hp = 50
PART.pos = 2 --position in menu, left arm should be 2
PART.tags = {
	["External"] = true,
	["Limb"] = true,
	["Blood"] = true,
	["Bone"] = true,
	["Skin"] = true,
}
PLUGIN:RegisterPart(PART)

PART = {}
PART.id = "arm_r"
PART.name = "Human Right Arm"
PART.hp = 50
PART.pos = 3 --position in menu, right arm should be 3
PART.tags = {
	["External"] = true,
	["Limb"] = true,
	["Blood"] = true,
	["Bone"] = true,
	["Skin"] = true,
}
PLUGIN:RegisterPart(PART)

PART = {}
PART.id = "leg_l"
PART.name = "Human Left Leg"
PART.hp = 75
PART.pos = 4 --position in menu, left leg should be 4
PART.tags = {
	["External"] = true,
	["Limb"] = true,
	["Blood"] = true,
	["Bone"] = true,
	["Skin"] = true,
}
PLUGIN:RegisterPart(PART)

PART = {}
PART.id = "leg_r"
PART.name = "Human Right Leg"
PART.hp = 75
PART.pos = 5 --position in menu, right leg should be 5
PART.tags = {
	["External"] = true,
	["Limb"] = true,
	["Blood"] = true,
	["Bone"] = true,
	["Skin"] = true,
}
PLUGIN:RegisterPart(PART)

PART = {}
PART.id = "eye_l"
PART.name = "Human Left Eye"
PART.hp = 15
PART.pos = 6 --position in menu, left eye should be 6
PART.tags = {
	["External"] = true,
	["Organ"] = true,
}
PLUGIN:RegisterPart(PART)

PART = {}
PART.id = "eye_r"
PART.name = "Human Right Eye"
PART.hp = 15
PART.pos = 7 --position in menu, right eye should be7
PART.tags = {
	["External"] = true,
	["Organ"] = true,
}
PLUGIN:RegisterPart(PART)