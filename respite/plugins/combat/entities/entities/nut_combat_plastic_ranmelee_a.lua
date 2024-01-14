ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Armored Plastic (Random Melee)"
ENT.Category = "NutScript - Combat (Plastic)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"

ENT.model = "models/player/group01/male_04.mdl"
ENT.material = "phoenix_storms/mrref2"

ENT.models = {
	"models/player/group03/female_01.mdl",
	"models/player/group03/female_02.mdl",
	"models/player/group03/female_03.mdl",
	"models/player/group03/female_04.mdl",
	"models/player/group03/female_05.mdl",
	"models/player/group03/female_06.mdl",
	"models/player/group03/male_01.mdl",
	"models/player/group03/male_02.mdl",
	"models/player/group03/male_03.mdl",
	"models/player/group03/male_04.mdl",
	"models/player/group03/male_05.mdl",
	"models/player/group03/male_06.mdl",
	"models/player/group03/male_07.mdl",
	"models/player/group03/male_08.mdl",
	"models/player/group03/male_09.mdl",
}

ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all_01"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 10,
	["perception"] = 10,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Pistol"] = 15,
}

ENT.hp = 150
ENT.armor = 50

ENT.res = {
	["Pierce"] = 5,
	["Slash"] = 5,
	["Blunt"] = 5,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 0,
}

local weapons = {
	"hl2_m_woodensign",
	"hl2_m_woodenshiv",
	"hl2_m_woodenpole",
	"hl2_m_weirdvase",
	"j_wall_light",
	"hl2_m_valve",
	"melee_trenchaxe",
	"hl2_m_trapscrap",
	"hl2_m_tracksign",
	"hl2_m_suitcase",
	"hl2_m_streetsign",
	"hl2_m_stick",
	"hl2_m_steeringwheel",
	"respite_sledgehammer",
	"hl2_m_sledgehammer",
	"melee_sickle",
	"hl2_m_shovel_alt",
	"hl2_m_shovel",
	"hl2_m_shiv_metal",
	"hl2_m_glassshiv",
	"melee_sabre",
	"hl2_m_rock",
	"hl2_m_reloadingpress",
	"hl2_m_rebar",
	"melee_pushbroom",
	"hl2_m_pot",
	"melee_poolcue",
	"hl2_m_pole",
	"hl2_m_plastic_arm",
	"hl2_m_plank",
	"melee_pitchfork",
	"hl2_m_pipe",
	"hl2_m_pickaxe_alt",
	"hl2_m_pickaxe",
	"melee_pan",
	"melee_paddle",
	"j_car_muffler",
	"hl2_m_monstertalon",
	"j_monster_claw",
	"hl2_m_meathook",
	"hl2_m_makeshift_sword",
	"hl2_m_makeshift_spear",
	"hl2_m_makeshift_glaive",
	"hl2_m_machate",
	"hl2_m_lumberaxe_2",
	"hl2_m_lumberaxe",
	"hl2_m_lamp_strange",
	"hl2_m_lamp",
	"melee_knifeb",
	"melee_knife_kabar",
	"melee_knife_bowie",
	"hl2_m_knife",
	"hl2_m_keyboard",
	"hl2_m_katana",
	"j_industrial_fan",
	"melee_iceaxe",
	"hl2_m_hhradio",
	"hl2_m_axe",
	"hl2_m_harpoon",
	"hl2_m_handle",
	"hl2_m_hammer",
	"j_guitar",
	"melee_golf_club",
	"hl2_m_gearmace",
	"hl2_m_frying_pan_alt",
	"melee_flashlight",
	"melee_fireaxe",
	"hl2_m_fencepost",
	"hl2_m_crowbar_alt",
	"hl2_m_crowbar",
	"melee_cleaver",
	"hl2_m_claypot",
	"melee_cinderblock",
	"hl2_m_brokenbottle",
	"hl2_m_branch",
	"hl2_m_boneshiv",
	"hl2_m_bonerattle",
	"hl2_m_bonecudgel",
	"melee_baton",
	"melee_bat_nail",
	"hl2_m_bat_metal",
	"hl2_m_homerunaway",
	"melee_bat_cricket",
	"hl2_m_bat",
	"hl2_m_wrench",
}

function ENT:Initialize()
	if(!self.saveKey) then
		self.attribs.stm = math.random(5,25)
		self.attribs.str = math.random(5,25)
		self.attribs.accuracy = math.random(5,25)
		self.attribs["end"] = math.random(5,25)
		self.attribs.luck = math.random(5,25)
		self.attribs.perception = math.random(5,25)
		self.attribs.fortitude = math.random(5,25)
		
		if(SERVER) then
			timer.Simple(1, function()
				if(IsValid(self)) then
					local randomWeapon = table.Random(weapons)
					local item = nut.item.list[randomWeapon]
					if(item) then
						self:EquipWeapon(item.model, item.material)
						
						if(item.dmg) then
							self.dmg = item.dmg
						end

						self:setNetVar("name", self.name.. " (" ..item.name.. ")")
					else
						print("No item found", randomWeapon)
					end
				end
			end)
		end
	end
	
	self:basicSetup()
end