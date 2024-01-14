ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (Random Ranged)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Fiend"

ENT.model = "models/spite/fiend.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 5,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Slash"] = 15,
}

ENT.hp = 100
ENT.armor = 30

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 50,
}

local weapons = {
	"tfa_cp1ch",
	"tfa_cp1cs",
	"tfa_cp1ka",
	"tfa_cp1kh",
	"tfa_cp1kl",
	"tfa_cp1km",
	"tfa_cp1ko",
	"tfa_cp1ks",
	"tfa_cp1kx",
	"tfa_cpr05",
	"tfa_cpr06",
	"tfa_cpr07",
	"tfa_cpr08",
	"tfa_cpr09",
	"tfa_cpunk",
	"tfa_cr0c5",
	"tfa_cr0ck",
	"tfa_cr0f7",
	"tfa_cr1ck",
	"tfa_cr1fa",
	"tfa_cr1fb",
	"tfa_cr1ka",
	"tfa_cr1kb",
	"tfa_cr2fa",
	"tfa_cr2fb",
	"tfa_cr2ka",
	"tfa_cr2kb",
	"tfa_cr3s7",
	"tfa_cr3s750",
	"tfa_cr3s750fe",
	"tfa_cr3st",
	"tfa_cr3t3",
	"tfa_cr4ck",
	"tfa_cr33d",
	"tfa_cr33k",
	"tfa_cr33m",
	"tfa_cr33p",
	"tfa_crass",
	"tfa_criss",
	"tfa_cross",
	"tfa_crud3",
	"tfa_crude",
	"tfa_crunt",
	"tfa_wasteland_bomb_launcher",
	"tfa_wasteland_boltrifle_s",
	"tfa_wasteland_boltrifle",
	"tfa_wasteland_beancan_s",
	"tfa_wasteland_beancan",
	"tfa_wasteland_shotgun",
	"tfa_wasteland_ar",
	"tfa_wasteland_smg",
	"tfa_wasteland_pistol_s",
	"tfa_wasteland_pistol",
	"tfa_wasteland_nailgun",
	"tfa_wasteland_lmg",
	"tfa_wasteland_geiger",
	"tfa_wasteland_gatling",
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