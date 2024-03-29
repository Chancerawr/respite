ITEM.name = "Charged Battery"
ITEM.desc = "A single, seemingly enhanced battery."
ITEM.uniqueID = "ammo_battery"
ITEM.model = "models/items/battery.mdl"
ITEM.material = "phoenix_storms/wire/pcb_blue"
ITEM.ammo = "battery" 
ITEM.ammoAmount = 50 
ITEM.category = "Ammunition"
ITEM.flag = "v"
ITEM.price = 0

ITEM.maxstack = 50
ITEM.color = Color(130, 130, 200)

ITEM.iconCam = {
	pos = Vector(200, 0, 5),
	ang = Angle(180, -0, 180),
	fov = 3.75,
}

local function onUse(item)
	if(!item.player:getChar():getInv():add("j_battery_dead")) then
		nut.item.spawn("j_battery_dead", item.player:getItemDropPos())
	end
end

ITEM:hook("use", onUse)

ITEM.functions.use = {
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(item.ammoAmount, item.ammo)
		item.player:EmitSound("npc/scanner/cbot_discharge1.wav", 75)
		
		return true
	end,
	onCanRun = function(item)
		local player = item.player
		
		if (player:GetAmmoCount(item.ammo) >= item.ammoAmount * 2) then
			return false
		end
		
		return true
	end
}