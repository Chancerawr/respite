ITEM.name = "Throwable Objects 2"
ITEM.model = "models/Items/grenadeAmmo.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.class = "nut_beac"
ITEM.desc = "A throwable object."

ITEM.functions.Equip = {
	name = "Equip",
	tip = "equipTip",
	icon = "icon16/tick.png",
	onRun = function(item)
		local client = item.player
		
		if (client:HasWeapon(item.class)) then
			client:notify("You're already holding this grenade!") return false
		end

		local weapon = client:Give(item.class)

		if (IsValid(weapon)) then
			client:SelectWeapon(weapon:GetClass())
			client:EmitSound("items/ammo_pickup.wav", 80)
			weapon:SetClip1(1)
		else
			print(Format("[Nutscript] Weapon %s does not exist!", item.class))
		end
		
		return true
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

ITEM.functions.Paint = {
	name = "Paint",
	icon = "icon16/color_swatch.png",
	onRun = function(item)
		local client = item.player
		local paint = client:getChar():getInv():getFirstItemOfType("j_paint_can")
		local paintCol = paint:getData("paint", "white")
		client:requestString("Paint", "Are you sure you want to paint this grenade " ..paintCol.."?",
			function(text)
				paint:remove()
				item:setData("customDesc", item:getDesc() .. "\nThis weapon is painted "..paintCol..".")
				nut.item.spawn("j_empty_paint_can", client:getItemDropPos())
			end
		)
		return false
	end,
	onCanRun = function(item)
		local client = item.player
		return (client:getChar():getInv():getFirstItemOfType("j_paint_can"))
	end
}

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	onRun = function(item)		
		nut.plugin.list["customization"]:startCustom(item.player, item)
		
		return false
	end,
	
	onCanRun = function(item)
		local client = item.player
		return client:getChar():hasFlags("1")
	end
}

function ITEM:getName()
	local name = self.name
	
	local customData = self:getData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("customDesc") != nil) then
		desc = self:getData("customDesc")
	end	
	
	return desc
end