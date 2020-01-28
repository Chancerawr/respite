ITEM.name = "Voltaic Liquid"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.desc = "A strange liquid with electrical properties. The bottle is vibrating slightly.\nThose who drink this gain inhuman speed for a short time, they are also somewhat twitchy.\nAfter the effect wears off, users will lose consciousness for an entire day."
ITEM.duration = 6000
ITEM.uniqueID = "voltaic"
ITEM.price = 200
ITEM.material = "models/alyx/emptool_glow"
ITEM.color = Color(50, 255, 50)

ITEM.attribBoosts = {
	["stm"] = 30,
	["perception"] = -5,
	["end"] = -5
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

ITEM:hook("_use", function(item)
	item.player:EmitSound("ambient/levels/labs/electric_explosion1.wav")
	item.player:ScreenFade(1, Color(0, 128, 128, 255), 10, 0)
end)

ITEM.functions.Load = { -- sorry, for name order.
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(1, "RPG_Round")
		item.player:EmitSound("items/ammo_pickup.wav", 110)
		
		return true
		end,
	onCanRun = function(item)
		local client = item.player
		if (!client:getChar():getInv():getFirstItemOfType("tfa_voltaic")) then
			return false
		end
		
		return true		
	end
}