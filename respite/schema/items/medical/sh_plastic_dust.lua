ITEM.name = "Plastic Dust"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.healAmount = 15
ITEM.healSeconds = 1
ITEM.price = 0
ITEM.desc = "A small box filled with some sort of plasic dust. (Does not work on non-Plastic characters.)"
ITEM.uniqueID = "medical_plastic"
ITEM.flag = "v"

ITEM.functions.usef = { -- sorry, for name order.
	name = "Use Forward",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		local trace = client:GetEyeTraceNoCursor() -- We don't need cursors.
		local target = trace.Entity

		if (target and target:IsValid() and target:IsPlayer() and target:Alive() and target:getChar():getFaction() == FACTION_PLASTIC) then
			healPlayer(item.player, target, item.healAmount, item.healSeconds)

			return true
		end

		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}