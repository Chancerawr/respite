ITEM.name = "Bone"
ITEM.desc = "Small pieces of bone."
ITEM.uniqueID = "j_scrap_bone"
ITEM.model = "models/gibs/antlion_gib_small_1.mdl"
ITEM.material = "models/props/cs_militia/milceil001"
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.maxstack = 30

ITEM.loot = {
	["Consumable"] = 0.01,
	["Junk"] = 0.1,
	["Bone"] = 10,
	["Corpse"] = 5,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["end"] = 0.5,
			["fortitude"] = 0.5,
		},
		
		res = {
			["Blunt"] = -1,
			["Slash"] = 1,
		}
	},
}

ITEM.functions.Scrap = {
	tip = "Scrap this item",
	icon = "icon16/cross.png",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()

		inventory:addSmart("j_scrap_organic", 1, position, {Amount = item:getData("Amount", 1) * 2})

		client:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70, math.random(85,105))
	end,
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("q") or client:getChar():getInv():getFirstItemOfType("converter_meat")
	end
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}