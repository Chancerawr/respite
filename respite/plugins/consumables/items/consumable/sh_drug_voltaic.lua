ITEM.name = "Voltaic Liquid"
ITEM.desc = "A strange liquid with electrical properties. The bottle is vibrating slightly.\nThose who drink this gain inhuman speed for a short time, they are also somewhat twitchy.\nAfter the effect wears off, users will lose consciousness for an entire day."
ITEM.uniqueID = "voltaic"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/alyx/emptool_glow"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 200
ITEM.color = Color(50, 255, 50)
ITEM.sound = "ambient/levels/labs/electric_explosion1.wav"

ITEM.stomach = false

ITEM.attrib = {
	["stm"] = 40,
	["perception"] = -10,
	["end"] = -10,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(0, 128, 128, 255), 10, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

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