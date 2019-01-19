ITEM.name = "Makeshift Sentry"
ITEM.uniqueID = "sentry"
ITEM.model = "models/combine_turrets/floor_turret.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.desc = "An automated turret that fires based on movement."
ITEM.width = 1
ITEM.height = 4
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(128, 128, 128)

ITEM.iconCam = {
	pos = Vector(-200, 0, 29),
	ang = Angle(0, -0, 0),
	fov = 7,
}

local ammoTypes = {
	{name = "12 Gauge", data = "12g"},
	{name = ".22 LR", data = "22lr"},
	{name = ".40 S&W", data = "40sw"},
	{name = ".44", data = "44"},
	{name = ".45 ACP", data = "45acp"},
	{name = ".50 AE", data = "50ae"},
	{name = ".50 BMG", data = "50bmg"},
	{name = ".338 LM", data = "338"},
	{name = ".357", data = "357test"},
	{name = ".408 Cheytac", data = "408"},
	{name = ".500", data = "500"},
	{name = "9x19mm", data = "919"},
	{name = "9x39mm", data = "939"},
	{name = ".30-06", data = "3006"},
	{name = ".45-70", data = "4570"},
	{name = "5.7x28mm", data = "5728"},
	{name = "5.45x39mm", data = "54539"},
	{name = "5.56x39mm", data = "55639"},
	{name = "5.56x45mm", data = "55645"},
	{name = "7.62x39mm", data = "76239"},
	{name = "7.62x51mm", data = "76251"},
	{name = "7.62x54mm", data = "76254"},
	{name = "Concrete Slugs", data = "AlyxGun"},
	{name = "Crossbow Bolts", data = "xbowbolt"},
	{name = "Rockets", data = "rpg_round"},
	{name = "Sawblades", data = "slam"}
}

ITEM.functions.Place = {
	name = "Deploy",
	tip = "useTip",
	icon = "icon16/arrow_up.png",
	onRun = function(item)
		local client = item.player
		
		local sentry = ents.Create("nut_combat_sentry")
		sentry:SetPos(client:getItemDropPos())
		sentry:SetAngles(client:GetAngles())
		sentry.ammo = item:getData("ammo", "919")
		sentry.ammoDesc = item:getData("ammoDesc", "9x19mm")
		sentry.customName = item:getData("customName", nil)
		sentry:Spawn()
		
		sentry:SetCreator(client)
		
		sentry:setNetVar("name", item:getData("customName", "Makeshift Sentry").. " (" ..item:getData("ammoDesc", "9x19mm").. ")")
	end,
}

ITEM.functions.Name = {
	tip = "Name this item",
	icon = "icon16/add.png",
	onRun = function(item)
		local client = item.player
		client:requestString("Change Name", "What do you want to name your sentry? (This is final)", function(text)
			item:setData("customName", text)
		end, item.name)
		
		return false
	end,
	onCanRun = function(item)
		if (item:getData("customName") != nil) then
			return false
		else
			return true
		end
	end
}

ITEM.functions.Modify = {
    name = "Modify",
    tip = "Modify your sentry turret",
    icon = "icon16/star.png",
	sound = "ambient/machines/thumper_amb.wav",
    isMulti = true,
    multiOptions = function(item, client)
        return ammoTypes
    end,
    onRun = function(item, data)
        local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		
		local object = inventory:hasItem("j_scrap_idea")
		
		if(data) then
			item:setData("ammo", data)
			
			local realName = "9x19mm"
			for k, v in pairs(ammoTypes) do
				if(data == v.data) then
					realName = v.name
					break
				end
			end
			
			item:setData("ammoDesc", realName)
			
			object:remove()
		end
	 
        return false
    end,
	onCanRun = function(item)      
		if(IsValid(item.entity)) then
			return false
		end
		
		local player = item.player or item:getOwner()
		local inv = player:getChar():getInv()
		
		if(!inv:hasItem("kit_sentry")) then
			return false
		end
		
		if(!inv:hasItem("j_scrap_idea")) then
			return false
		end
    end
}

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end

	return Format(name)
end

function ITEM:getDesc()
	local desc = self.desc
	
	desc = desc .. "\nThis makeshift sentry fires " ..self:getData("ammoDesc", "9x19mm").. "."
	
	return Format(desc)
end