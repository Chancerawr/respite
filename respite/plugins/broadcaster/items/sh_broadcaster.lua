ITEM.name = "Broadcaster"
ITEM.model = "models/props_lab/citizenradio.mdl"
ITEM.desc = "A large device that allows one to transmit their voice long distances.\n(/broadcast)"
ITEM.width = 2
ITEM.height = 2
ITEM.category = "Communication"
ITEM.price = 150
ITEM.flag = "v"
ITEM.uniqueID = "broadcaster"

ITEM.iconCam = {
	pos = Vector(200, 0, 8),
	ang = Angle(180, -0, 180),
	fov = 10,
}

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if (item:getData("power", false)) then
			surface.SetDrawColor(110, 255, 110, 100)
		else
			surface.SetDrawColor(255, 110, 110, 100)
		end

		surface.DrawRect(w - 14, h - 14, 8, 8)
	end

	local GLOW_MATERIAL = Material("sprites/glow04_noz.vmt")
	local COLOR_ACTIVE = Color(0, 255, 0)
	local COLOR_INACTIVE = Color(255, 0, 0)

	function ITEM:drawEntity(entity, item)
		entity:DrawModel()

		local position = entity:GetPos() + entity:GetForward() * 10 + entity:GetUp() * 11 + entity:GetRight() * 9.5

		render.SetMaterial(GLOW_MATERIAL)
		render.DrawSprite(position, 14, 14, entity:getData("power", false) and COLOR_ACTIVE or COLOR_INACTIVE)
	end
end

// On player uneqipped the item, Removes a weapon from the player and keep the ammo in the item.
ITEM.functions.toggle = { -- sorry, for name order.
	name = "Toggle",
	tip = "useTip",
	icon = "icon16/connect.png",
	onRun = function(item)
		item:setData("power", !item:getData("power", false), player.GetAll(), false, true)
		item.player:EmitSound("buttons/button14.wav", 70, 150)

		if(item.entity) then
			item.entity:setNetVar("data", item.data)
		end

		return false
	end
}