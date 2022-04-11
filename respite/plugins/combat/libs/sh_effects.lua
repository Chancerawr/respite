local PLUGIN = PLUGIN

EFFS = {}
EFFS.effects = {}
function EFFS:Register(tbl)
	self.effects[tbl.uid] = tbl
end

local EFF = {}
EFF.uid = "blind"
EFF.name = "Blind"
EFF.desc = "Prevents affected target from seeing."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "stun"
EFF.name = "Stun"
EFF.desc = "Prevents affected target from acting."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "fear"
EFF.name = "Fear"
EFF.desc = "Affected target tries to get away from afflictor."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "mind"
EFF.name = "Mind Manipulation"
EFF.desc = "Affected target has their mind manipulated in some way."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "move"
EFF.name = "Forced Move"
EFF.desc = "Affected target is moved somehow."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "weak"
EFF.name = "Weak"
EFF.desc = "Affected target is weakened somehow."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "sleep"
EFF.name = "Sleep"
EFF.desc = "Affected target is put to sleep, any damage will wake them up."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "root"
EFF.name = "Root"
EFF.desc = "Affected target cannot move, but can still act."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "taunt"
EFF.name = "Taunt"
EFF.desc = "Affected target is forced to, or is forced not to attack a specific target."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "disarm"
EFF.name = "Disarm"
EFF.desc = "Affected target cannot use attacks that use a weapon."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "silence"
EFF.name = "Silence"
EFF.desc = "Affected target cannot use Mind related abilities."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "break"
EFF.name = "Break"
EFF.desc = "Affected target cannot use Body related abilities."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "purge"
EFF.name = "Purge"
EFF.desc = "Affected target's buffs are removed."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "knockdown"
EFF.name = "Knockdown"
EFF.desc = "Affected target is knocked to the ground, must get up to move."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "slow"
EFF.name = "Slow"
EFF.desc = "Affected target is slowed, and cannot move as far."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "fire"
EFF.name = "Fire"
EFF.desc = "Affected target is on fire."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "poison"
EFF.name = "Poison"
EFF.desc = "Affected target is poisoned."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "bleed"
EFF.name = "Bleed"
EFF.desc = "Affected target is bleeding."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "acid"
EFF.name = "Acid"
EFF.desc = "Affected target has acid on them."
EFF.category = "debuff"
EFFS:Register(EFF)

local EFF = {}
EFF.uid = "time"
EFF.name = "Time"
EFF.desc = "Affected target has some kind of time nonsense going on."
EFF.category = "debuff"
EFFS:Register(EFF)