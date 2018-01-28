local function facingWall(client)
	local data = {}
	data.start = client:GetPos()
	data.endpos = data.start + client:GetAimVector()*54
	data.filter = client

	if (!util.TraceLine(data).HitWorld) then
		return "@faceWall"
	end
end

local function facingWallBack(client)
	local data = {}
	data.start = client:GetPos()
	data.endpos = data.start - client:GetAimVector()*54
	data.filter = client

	if (!util.TraceLine(data).HitWorld) then
		return "@faceWallBack"
	end
end

ACT_ENDSEQ = 0
ACT_STARTSEQ = 1

PLUGIN.acts["sit"] = {
	["citizen_male"] = {sequence = "sit_ground", untimed = true, transition = { [ACT_STARTSEQ] = "Idle_to_Sit_Ground", [ACT_ENDSEQ] = "Sit_Ground_to_Idle" }},
	["citizen_female"] = {sequence = "sit_ground", untimed = true},
	["player"] =  {sequence = {"pose_ducking_01", "pose_ducking_02", "sit_zen", "sit"}, untimed = true}
}
PLUGIN.acts["sitdown"] = {
	["citizen_male"] = {sequence = {"canals_matt_sitonedge", "d1_t01_breakroom_sit02", "d1_t01_breakroom_sit01_idle", "sitcouchknees1", "sitcouchfeet1"}, untimed = true}
}
PLUGIN.acts["dance"] = {
	["player"] = {sequence = "taunt_dance", untimed = false}
}
PLUGIN.acts["salute"] = {
	["player"] = {sequence = "gesture_salute_original", untimed = false}
}
PLUGIN.acts["lookout"] = {
	["citizen_male"] = {sequence = "lookoutidle", untimed = true}
}
PLUGIN.acts["injured"] = {
	["citizen_male"] = {sequence = {"d1_town05_wounded_idle_1", "d1_town05_wounded_idle_2", "d1_town05_winston_down"}, untimed = true},
	["citizen_female"] = {sequence = "d1_town05_wounded_idle_1", untimed = true}
}
PLUGIN.acts["arrest"] = {
	["citizen_male"] = {sequence = "apcarrestidle", untimed = true}
}
PLUGIN.acts["cheer"] = {
	["citizen_male"] = {sequence = {"cheer1", "cheer2", "wave_smg1"}},
	["citizen_female"] = {sequence = {"cheer1", "wave_smg1"}}
}
PLUGIN.acts["here"] = {
	["citizen_male"] = {sequence = {"wave_close", "wave"}},
	["citizen_female"] = {sequence = {"wave_close", "wave"}}
}
PLUGIN.acts["liedown"] = {
	["citizen_male"] = {sequence = {"lying_down"}, untimed = true}
}
PLUGIN.acts["sitwall"] = {
	["citizen_male"] = {sequence = {"plazaidle4", "injured1"}, untimed = true},
	["citizen_female"] = {sequence = {"plazaidle4", "injured1", "injured2"}, untimed = true}
}
PLUGIN.acts["stand"] = {
	["citizen_male"] = {sequence = {"lineidle01", "lineidle02", "lineidle03", "lineidle04"}, untimed = true},
	["citizen_female"] = {sequence = {"lineidle01", "lineidle02", "lineidle03"}, untimed = true},
	["player"] = {sequence = {"pose_standing_01", "pose_standing_02"}, untimed = true},
	["metrocop"] = {sequence = "plazathreat2", untimed = true}
}