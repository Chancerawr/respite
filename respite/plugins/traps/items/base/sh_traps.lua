ITEM.name = "Trap Base"
ITEM.desc = ""
ITEM.model = "models/props_junk/gnome.mdl"
ITEM.category = "Traps"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "V"

ITEM.worldModel = "models/props_lab/box01a.mdl"

ITEM.functions.Deploy = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_out.png",
	onRun = function(item)
		local client = item.player

		local weapon = client:Give("nut_trapspawner")
		client:SelectWeapon("nut_trapspawner")
		
		weapon.item = item
		weapon:SetNW2String("trapModel", item.model)

		return false
	end,
	onCanRun = function(item)
		if(IsValid(item.entity)) then
			return false
		end
		
		--[[
		local deployed = item:getData("deployed")
		if(IsValid(deployed)) then
			return false
		end
		--]]
	
		return true
	end
}