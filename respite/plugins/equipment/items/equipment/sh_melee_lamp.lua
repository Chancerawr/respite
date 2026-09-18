ITEM.name = "Lamp"
ITEM.desc = "A lamp used for illumination."
ITEM.model = "models/props_interiors/Furniture_Lamp01a.mdl"
ITEM.class = "respite_lamp"
ITEM.uniqueID = "hl2_m_lamp"
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
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 8,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2,
	["j_scrap_cloth"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
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
	fov = 20.5,
}