ITEM.name = "Reminiscence"
ITEM.uniqueID = "reminiscence"
ITEM.model = "models/props_lab/frame002a.mdl"
ITEM.material = "models/props_lab/security_screens"
ITEM.desc = "A strange picture frame. By looking through it you can see your own past.\nRequires 1 CURE, 2 Organic Material."
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "v"
ITEM.price = 500
ITEM.category = "Machines"
ITEM.color = Color(100, 100, 100)

--1 cure, 2 organic material.
ITEM.functions.Remember = {
	icon = "icon16/box.png",
	sound = "ambient/levels/canals/toxic_slime_sizzle2.wav",
	onRun = function(item)
		local client = item.player
		local position = client:getItemDropPos()
		local inventory = client:getChar():getInv()
		local cure = inventory:hasItem("cure")
		local organic = inventory:hasItem("j_scrap_organic")

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
		
		cure:remove()
		local amount = organic:getData("Amount")
		if(amount <= 2) then
			organic:remove()
		else
			organic:setData("Amount", amount - 2)
		end
		local emotion = emotions[math.random(0,8)]
		inventory:add("j_scrap_memory", 1, { Amount = 1, feeling = emotion})
		
		nut.chat.send(client, "itclose", "You remember something that makes you feel "..emotion..".")	
		
		return false
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		local cure = player:getChar():getInv():hasItem("cure")
		local organic = player:getChar():getInv():hasItem("j_scrap_organic")
		if(!cure or !organic) then
			return false
		else
			if(organic:getData("Amount") < 2) then
				return false
			end
		end
	end
}
