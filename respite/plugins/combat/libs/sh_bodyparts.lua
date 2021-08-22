local PLUGIN = PLUGIN

--potential parts to hit with random shots
local bParts = {
	{ --head/neck
		["Skull"] = 2, 
		["Left Eye"] = 2, 
		["Right Eye"] = 2, 
		["Nose"] = 2,
		["Face"] = 4,
		["Left Ear"] = 2,
		["Right Ear"] = 2,
		["Jaw"] = 3,
		
		["Neck"] = 3, 
		["Neck Flesh"] = 4, 
		["Larynx"] = 2, 
		["Trachea"] = 2,
	},
	
	{ --shoulders
		["Left Shoulder"] = 3, 
		["Left Shoulder Socket"] = 1, 
		["Left Scapula"] = 2,
		["Right Shoulder"] = 3, 
		["Right Shoulder Socket"] = 1,
		["Right Scapula"] = 2,
	}, 
	
	{ --arms
		["Left Upper Arm Bone"] = 3, 
		["Left Upper Arm Flesh"] = 4, 
		["Left Elbow"] = 2,  
		["Left Forearm Bone"] = 2,
		["Left Forearm Flesh"] = 3,
		["Left Hand"] = 2,
		
		["Right Upper Arm Bone"] = 3, 
		["Right Upper Arm Flesh"] = 4, 
		["Right Elbow"] = 2,
		["Right Forearm Bone"] = 2,
		["Right Forearm Flesh"] = 3,
		["Right Hand"] = 2,
		
		["Weapon"] = 4,
	},
	
	{ --torso/chest
		["Heart"] = 1,
		["Left Lung"] = 2,
		["Left Upper Chest Rib"] = 2,
		["Left Lower Chest Rib"] = 2,
		["Right Lung"] = 2,
		["Right Upper Chest Rib"] = 2,
		["Right Lower Chest Rib"] = 2,
		["Liver"] = 2,
		["Left Kidney"] = 2,
		["Right Kidney"] = 2,
		["Stomach"] = 3,
		["Spleen"] = 2,
		["Pancreas"] = 2,
		["Large Intestine"] = 4,
		["Small Intestine"] = 3,
		
		["Upper Chest Spine"] = 1,
		["Lower Chest Spine"] = 1,
		["Abdomen Spine"] = 2,
	},

	{ --hip
		["Left Pelvis"] = 5,
		["Center Pelvis"] = 5,
		["Right Pelvis"] = 5,
		["Left Hip"] = 6,
		["Left Hip Socket"] = 4,
		["Right Hip"] = 6,
		["Right Hip Socket"] = 4,
		["Groin"] = 3,
	},

	{ --legs
		["Left Upper Leg Flesh"] = 6,
		["Left Upper Leg Femur"] = 6,
		["Left Lower Leg Flesh"] = 6,
		["Left Knee"] = 4,
		["Left Shin Flesh"] = 4,
		["Left Tibia"] = 2,
		["Left Ankle"] = 1,
		["Left Foot"] = 2,
		
		["Right Upper Leg Flesh"] = 6,
		["Right Upper Leg Femur"] = 6,
		["Right Lower Leg Flesh"] = 6,
		["Right Knee"] = 4,
		["Right Shin Flesh"] = 4,
		["Right Tibia"] = 2,
		["Right Ankle"] = 1,
		["Right Foot"] = 2,
	}
}

local function GetWeightedRandomKey( tab )
	local sum = 0

	for _, chance in pairs( tab ) do
		sum = sum + chance
	end

	local select = math.random() * sum

	for key, chance in pairs( tab ) do
		select = select - chance
		if select < 0 then return key end
	end
end

function PLUGIN:getRandomBpart()
	local part = GetWeightedRandomKey(table.Random(bParts))
	
	return part
end
