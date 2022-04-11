local PLUGIN = PLUGIN

--name adjective, desc
PLUGIN.lootAdj = {
	{ 
		name = "Ceremonial", 
		desc = "It is ornate and decorative, it has an aura of historic value.",
		
		rarity = 5,
		level = 15,
		
		dmgMult = 0.95,
		
		attrib = {
			["str"] = {-2, 2},
			["end"] = {1, 2},
		},
		
		restrict = {
			"melee",
			"sharp",
		}
	},
	{
		name = "Exquisite",
		desc = "This piece of equipment is an artwork in its own form. Its beauty is unmatched.",

		rarity = 5,
		level = 15,

		dmgMult = 1.1,
		armMult = 1.1,
	},	
	{
		name = "Heirloom",
		desc = "Its craftsmanship and valuable decorations alongside some inscriptions indicate that this is some kind of heirloom.",

		rarity = 8,
		level = 1,

		armMult = 1.2,
		dmgMult = 1.2,
		
		restrict = {
			"factory",
			"melee",
			"sharp",
		}
	},
	{ 
		name = "Sacrificial", 
		desc = "It is ornate and decorative, but has a sinister air about it.",
		
		rarity = 15,
		level = 5,
		
		attrib = {
			["stm"] = {-1, 4},
			["str"] = {-1, 4},
			["end"] = {-2, 0},
		},
		
		restrict = {
			"melee",
			"sharp",
		}
	},	
	{ 
		name = "Gaudy", 
		desc = "It's extravagantly bright and showy, tasteless even.",
		
		rarity = 5,
		level = 1,
	},	
	{ 
		name = "Ordinary", 
		desc = "It's so incredibly ordinary that it somehow stands out.",
		
		rarity = 35,
		level = 1,
	},
	{
		name = "Reliable",
		desc = "Its craftsmanship renders it this piece of equipment to be of consistent quality and enough to be depended on.",

		rarity = 25,
		level = 1,

		armMult = 1.1,
		dmgMult = 1.1,
	},
	{
		name = "Trusty",
		desc = "Judging by the condition of this equipment, its consistent quality seems to have lasted its previous user quite well.",

		rarity = 25,
		level = 1,

		armMult = 1.1,
		dmgMult = 1.1,
	},
	{
		name = "Wieldy",
		desc = "The craftsmanship of this weapon lets it be able to be handled and utilized rather easily.",

		rarity = 25,
		level = 1,

		dmgMult = 1.05,

		restrict = {
			"melee",
		}
	},	
	{
		name = "Sluggish",
		desc = "The craftsmanship of this piece of equipment was subpar, and has resulted in more unnecessary weight in unhelpful places, making it heavier than it should be.",

		rarity = 35,
		level = 1,

		armorMult = 1.05,
		dmgMult = 1.05,
	},	
	{ 
		name = "Frail",
		desc = "This was made from sub-optimal material, so it doesn't seem to be able to withstand much force.",

		rarity = 35,
		level = 1,

		armMult = 0.9,
		dmgMult = 0.8,
	},	
	{ 
		name = "Flimsy",
		desc = "This has either suffered extensive damage, or its original creator simply wasn't very good at what they were doing.",

		rarity = 35,
		level = 1,

		armMult = 0.9,
		dmgMult = 0.8,
	},
	{ 
		name = "Cursed", 
		desc = "Holding this object fills you with a sense of dread.",
		
		rarity = 5,
		level = 5,
		
		dmgMult = 1.1,
		
		attrib = {
			["fortitude"] = {-5, -1},
		},
	},
	{ 
		name = "Bloody", 
		desc = "It is stained with blood.",
		
		rarity = 20,
		level = 5,
		
		attrib = {
			["stm"] = {1, 4},
			["end"] = {-2, 0},
		},
	},
	{ 
		name = "Unsettling", 
		desc = "It is decorated with strange shapes and unworldly creatures.",
		
		rarity = 10,
		level = 5,
		
		attrib = {
			["medical"] = {-2, 4},
			["fortitude"] = {-1, 4},
		},
	},
	{ 
		name = "Light", 
		desc = "Its craftsmanship renders it lighter than it normally would be.",
		
		rarity = 30,
		level = 1,
		
		armMult = 0.95,
		dmgMult = 0.95,
	},
	{ 
		name = "Heavy", 
		desc = "Its craftsmanship renders it heavier than it normally would be.",
		
		rarity = 30,
		level = 1,
		
		armMult = 1.05,
		dmgMult = 1.05,
		weightMult = 1.1,
	},	
	{
		name = "Bulky",
		desc = "Its craftsmanship or material renders it much bulkier than it normally would be.",

		rarity = 30,
		level = 1,

		armMult = 1.15,
		dmgMult = 1.15,
	},
	{ 
		name = "Hardened", 
		desc = "The material comprising this armor is strangely harder than normal.",
		
		rarity = 10,
		level = 1,
		
		armMult = 1.1,
		
		restrict = {
			"armor",
		}
	},
	{ 
		name = "Old", 
		desc = "This equipment is clearly old and has seen a fair share of use.",
		
		rarity = 25,
		level = 1,
		
		armMult = 0.9,
		dmgMult = 0.9,
		
		attrib = {
			["luck"] = {1, 3},
		},		
	},	
	{ 
		name = "Shoddy", 
		desc = "This equipment is not properly crafted or designed.",
		
		rarity = 25,
		level = 1,
		
		armMult = 0.8,
		dmgMult = 0.8,
		
		attrib = {
			["stm"] = {-2, 1},
			["fortitude"] = {-2, 0},
		},
	},
	{ 
		name = "Damaged", 
		desc = "This equipment is damaged and has seen better days.",
		
		rarity = 30,
		level = 1,
		
		armMult = 0.5,
		dmgMult = 0.5,
		
		attrib = {
			["end"] = {-3, 1},
			["fortitude"] = {-3, 1},
		},
	},	
	{
		name = "Rusty",
		desc = "This piece of equipment appears to have been in long disrepair, and is covered in rust.",

		rarity = 30,
		level = 1,

		armMult = 0.6,
		dmgMult = 0.6,
	},
	{
		name = "Bent",
		desc = "This weapon seems to have received some damage and was bent as a result.",

		rarity = 20,
		level = 5,

		dmgMult = 0.6,

		restrict = {
			"melee",
		}
	},	
	{ 
		name = "Repaired", 
		desc = "This equipment has obvious signs of maintenance and care, which gives it its own kind of charm.",
		
		rarity = 20,
		level = 1,
		
		armMult = 1.025,
		dmgMult = 1.025,
		
		attrib = {
			["stm"] = {-1, 1},
			["luck"] = {-1, 3},
		},
	},
	{ 
		name = "Lucky", 
		desc = "This equipment has a certain charm to it, it feels lucky to you.",
		
		rarity = 15,
		level = 1,
		
		attrib = {
			["luck"] = {-3, 3},
		},		
	},
	{
		name = "Razor-edged", 
		desc = "Its craftsmanship renders it sharper than it normally would be.",
		
		rarity = 20,
		level = 5,
		
		dmgMult = 1.05,
		
		restrict = {
			"melee",
			"sharp",
		}
	},
	{
		name = "Blunted", 
		desc = "Through excessive use the blade has become blunt.",
		
		rarity = 20,
		level = 5,
		
		dmgMult = 0.9,
		dmgT = "Blunt",
		
		restrict = {
			"melee",
			"sharp",
		}
	},
	{
		name = "Infernal", 
		desc = "This weapon has properties of fire, it is very hot to the touch.",
		
		rarity = 1,
		level = 10,
		
		dmgMult = 0.8,
		dmgT = "Fire",
		
		attrib = {
			["str"] = {1, 3},
			["stm"] = {1, 3},
		},
		
		restrict = {
			"weapon",
		}
	},	
	{
		name = "Chilling", 
		desc = "This weapon is ice cold to the touch.",
		
		rarity = 1,
		level = 10,
		
		dmgMult = 0.8,
		dmgT = "Cold",
		
		attrib = {
			["str"] = {1, 3},
			["end"] = {1, 3},
			["stm"] = {-3, 2},
		},
		
		restrict = {
			"weapon",
		}
	},
	{
		name = "Sacred", 
		desc = "This weapon glows lightly.",
		
		rarity = 1,
		level = 10,
		
		dmgMult = 0.8,
		dmgT = "Shard",
		
		attrib = {
			["str"] = {1, 3},
			["end"] = {1, 3},
		},
		
		restrict = {
			"weapon",
		}
	},
	{
		name = "Dark", 
		desc = "It is coated in a pitch black material, touching it makes you feel nostalgic somehow.",
		
		rarity = 2,
		level = 10,
		
		dmgMult = 0.8,
		dmgT = "Blight",
		
		attrib = {
			["fortitude"] = {-3, 3},
			["str"] = {-3, 3},
		},
		
		restrict = {
			"weapon",
		}
	},
	{
		name = "Distorted", 
		desc = "Its appearance distorts randomly and sometimes becomes translucent.",
		
		rarity = 0.1,
		level = 30,
		
		dmgMult = 0.8,
		dmgT = "Distort",
		
		attrib = {
			["luck"] = {-3, 3},
			["medical"] = {-3, 3},
			["str"] = {-3, 3},
			["stm"] = {-3, 3},
			["end"] = {-3, 3},
			["fortitude"] = {-3, 3},
			["perception"] = {-3, 3},
			["accuracy"] = {-3, 3},
		},
		
		restrict = {
			slot = {
				["Weapon"] = true,
			}
		}
	},
	{
		name = "Golden", 
		desc = "This object is made out of gold, and is mostly decorative. May be valuable to a collector or a merchant.",
		
		rarity = 3,
		level = 1,
		
		dmgMult = 0.5,
		
		attrib = {
			["luck"] = {1, 3},
		},
	},
}
