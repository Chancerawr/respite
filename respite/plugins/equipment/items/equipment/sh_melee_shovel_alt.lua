ITEM.name = "Spade"
ITEM.desc = "A long common garden spade."
ITEM.model = "models/props_junk/shovel01a.mdl"
ITEM.class = "respite_shovel2"
ITEM.uniqueID = "hl2_m_shovel_alt"
ITEM.slot = "melee"
ITEM.width = 4
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
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 4,
	["Slash"] = 10,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2,
	["j_scrap_wood"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}

function ITEM:onEntityCreated(entity)
	--checks if it was spawned by the saveitems plugin (required an edit in saveitems)
	if(!self.saveItemPlug) then 
		--offsets the spawn so it isnt in the floor
		entity:SetPos(entity:GetPos()+entity:GetUp()*24)
	end
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 19.5,
}