ITEM.name = "Memory"
ITEM.uniqueID = "j_scrap_memory"
ITEM.model = "models/props_c17/playgroundtick-tack-toe_block01a.mdl"
ITEM.material = "models/props_lab/security_screens"
ITEM.desc = "A strange nostalgic object, it makes you feel an emotion when you touch it."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.color = Color(0, 128, 128)
ITEM.maxstack = 10

ITEM.data = {
	Amount = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

ITEM.functions.Stack = {
	tip = "Stack items of the same type.",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		local inventory = char:getInv()
		local stack = item:getData("Amount", 1)
		
		local total = stack
		for k, v in pairs(inventory:getItems()) do
			if(v.id == item.id) then
				continue
			end
		
			if(v.uniqueID == item.uniqueID) then
				total = total + v:getData("Amount", 1)
				
				if(v.id != item.id) then
					v:remove()
				end
			end
		end
		
		if(total <= item.maxstack) then
			item:setData("Amount", total)
		else
			local position = client:getItemDropPos()
		
			for i = 1, math.floor(total / item.maxstack) do
				timer.Simple(i/5, function()
					inventory:addSmart(item.uniqueID, 1, position, {Amount = item.maxstack, feeling = item:getData("feeling")})
				end)
			end
			
			local remainder = total - (item.maxstack * math.floor(total / item.maxstack))
			if(remainder > 0) then
				item:setData("Amount", remainder)
			else
				return true
			end
		end
		
		client:EmitSound("ambient/materials/dinnerplates1.wav")
		
		return false
	end,
	onCanRun = function(item)
		if(item.entity) then
			return false
		end
		
		return true
	end
}


ITEM.functions.Unstack = {
	tip = "Take a part out.",
	icon = "icon16/delete.png",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local stack = item:getData("Amount", 1)
		
		if (stack > 1) then
			inventory:addSmart(item.uniqueID, 1, position, { Amount = 1, feeling = item:getData("feeling")})
			item:setData("Amount", item:getData("Amount") - 1)
			item.player:EmitSound("ambient/materials/dinnerplates1.wav")
		end
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end	
}

function ITEM:getDesc()
	local desc = self.desc
	
	if(self:getData("feeling") != nil) then
		desc = desc .. "\nThis memory makes you feel " .. self:getData("feeling") .. "."
	end
	
	if(self:getData("Amount") != nil) then
		desc = desc .. "\nQuantity: " .. self:getData("Amount") .. "."
	end
	
	return Format(desc)
end

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:SetModelScale(.7)
		entity:DrawShadow(false)
	end
end

local emotions = {
	"fear",
	"anger",
	"sadness",
	"joy",
	"disgust",
	"surprise",
	"trust",
	"anticipation",
	"neutral",
}

--makes it so it randomizes the emotion. Couldn't find a good function to hook this onto so it just happens when picked up or dropped.
local function onUse(item)
	if(!item:getData("feeling")) then
		item:setData("feeling", table.Random(emotions))
	end
end

ITEM:hook("drop", onUse)
ITEM:hook("take", onUse)