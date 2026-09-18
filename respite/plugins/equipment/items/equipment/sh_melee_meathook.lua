ITEM.name = "Meat Hook"
ITEM.desc = "A metal instrument usually used to hang meat."
ITEM.model = "models/props_junk/meathook001a.mdl"
ITEM.class = "respite_hook"
ITEM.uniqueID = "hl2_m_meathook"
ITEM.slot = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.IdleAnim = "idle_melee2"
ITEM.WalkAnim = "walk_melee2"
ITEM.RunAnim = "run_melee2"
ITEM.AttackAnim = "seq_meleeattack01"

--for turn based combat
ITEM.attackRange = 80

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 12,
	["Pierce"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Handle"] = 1
}

function ITEM:onEntityCreated(entity)
	--checks if it was spawned by the saveitems plugin (required an edit in saveitems)
	if(!self.saveItemPlug) then 
		--offsets the spawn so it isnt in the floor
		entity:SetAngles(Angle(-90,0,0))
	end
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 14,
}