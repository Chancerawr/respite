ITEM.name = "Money"
ITEM.desc = " "
ITEM.uniqueID = "money_custom"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_wasteland/metal_tram001a"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Currency"
ITEM.color = Color(70, 120, 70)

ITEM.functions.Collect = {
	name = "Collect",
	icon = "icon16/coins.png",
	sound = "ambient/materials/cupdrop.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()

		local value = item:getData("value", item.value or 0)
		client:notify("You have received " ..nut.currency.get(value).. ".")
		char:giveMoney(value)
	end
}

function ITEM:getName()
	local value = self:getData("value", self.value or 0)
	local name = nut.currency.get(value)
	
	return name
end

function ITEM:getDesc()
	local value = self:getData("value", self.value or 0)
	local desc = "A stack of " ..nut.currency.get(value).. "."

	return desc
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		local value = item:getData("value", item.value or 0)
		draw.SimpleText(value, "DermaDefault", 4, h - 14, Color(200,200,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
	end
end