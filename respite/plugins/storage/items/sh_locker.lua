ITEM.name = "Intrinsic Lock"
ITEM.uniqueID = "storage_lock"
ITEM.model = "models/props_wasteland/prison_padlock001a.mdl"
ITEM.material = "models/props_combine/stasisfield_beam"
ITEM.desc = "A strange padlock-like object that glows purple.\nCan be used to lock storage. Only one locked storage allowed at any one time."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Storage"
ITEM.color = Color(140, 20, 140)

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 4
}

ITEM.functions.Lock = {
	name = "Lock Storage",
	icon = "icon16/lock.png",
	--sound = "physics/metal/metal_barrel_impact_soft1.wav",
	onRun = function(item)
		local client = item.player
		local inventory = client:getChar():getInv()
		local position = client:getItemDropPos()
		local trace = client:GetEyeTraceNoCursor() -- We don't need cursors.
		local target = trace.Entity
		
		local charID = client:getChar():getID()
		for k, v in pairs(ents.FindByClass("nut_storage")) do
			if(v:getNetVar("owner") == charID) then
				client:notify("You can only have one locked storage container.")
				return false
			end
		end
		
		if(target:GetClass() != "nut_storage") then
			client:notify("Look at a storage entity.")
			return false
		end
		
		if(target:getNetVar("locked")) then
			client:notify("Already passworded.")
			return false
		end
		
		local def = target:getStorageInfo() or {}
		local name = target:getNetVar("name", def.name) or "Storage"
		client:requestString("Password", "What password do you want to put on this " ..name.. ".", function(text)
			password = text
			
			if (password != "") then
				target:setNetVar("locked", true)
				target:setNetVar("owner", charID)
				target.password = password
				client:notifyLocalized("storPass", password)
				
				nut.plugin.list["storage"]:saveStorage()
			
				item:remove()
			else
				client:notify("You didn't supply a password.")
			end
		end, "")
		
		return false
	end
}