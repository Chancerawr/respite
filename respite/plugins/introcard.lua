local PLUGIN = PLUGIN
PLUGIN.name = "Intro/Outro Cards"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Yes"

nut.command.add("introcard", {
	adminOnly = true,
	syntax = "<string location> <string location2>",
	onRun = function(client, arguments)
		local location = arguments[1]
		local location2 = arguments[2]
	
		if!(location and location2) then
			client:notify("Missing information.")
			return false
		end
		
		PLUGIN:introCard(location, location2)
	end
})

nut.command.add("outrocard", {
	adminOnly = true,
	syntax = "<string message>",
	onRun = function(client, arguments)
		local message = arguments[1]
		
		PLUGIN:outroCard(message)
	end
})

nut.command.add("outrocardend", {
	adminOnly = true,
	syntax = "<string message>",
	onRun = function(client, arguments)
		PLUGIN:outroCardEnd()
	end
})

if (SERVER) then
	function PLUGIN:introCard(location, location2)
		for _, client in pairs(player.GetAll()) do
			netstream.Start(client, "nut_introCard", location, location2)
		end
	end
	
	function PLUGIN:outroCard(message)
		for _, client in pairs(player.GetAll()) do
			netstream.Start(client, "nut_outroCard", message)
		end
	end
	
	function PLUGIN:outroCardEnd()
		for _, client in pairs(player.GetAll()) do
			netstream.Start(client, "nut_outroCardEnd")
		end
	end
else
	netstream.Hook("nut_introCard", function(location, location2)
		LocalPlayer().introCard = {
			location = location,
			location2 = location2,
			startTime = CurTime(),
			duration = 20,
		}
	end)
	
	netstream.Hook("nut_outroCard", function(message)
		LocalPlayer().outroCard = {
			message = message,
			startTime = CurTime(),
			duration = 30,
		}
	end)
	
	netstream.Hook("nut_outroCardEnd", function()
		LocalPlayer().outroCard = nil
	end)

	local client, w, h, ft, clmp
	local tSizeX
	local tSizeY
	local fade
	local fade2
	local fadeout
	w, h = ScrW(), ScrH()
	
	function PLUGIN:HUDPaint()
		client = LocalPlayer()
		ft = FrameTime()
		curTime = CurTime()

		if(client.introCard) then
			if(!fade) then
				fade = 255
			end
		
			if(fade2 != 255 and !fadeout) then
				local fraction = (curTime - client.introCard.startTime) / (client.introCard.duration * 0.5)
				fraction = math.Clamp(fraction, 0, 1)
				fade2 = Lerp(fraction, -100, 255)
			else
				fadeout = true
				
				local fraction2 = (curTime - (client.introCard.startTime + client.introCard.duration*0.5)) / (client.introCard.duration * 0.5)
				fraction2 = math.Clamp(fraction2, 0, 1)
				fade = Lerp(fraction2, 255, 0)
				fade2 = Lerp(fraction2, 400, 0)
			end

			--black background
			surface.SetDrawColor(0, 0, 0, fade)
			surface.DrawRect(-1, -1, w+2, h+2)
			
			--location
			surface.SetFont("nutTitleFont")
			surface.SetTextColor(64, 100, 100, fade2)
			
			tSizeX, tSizeY = surface.GetTextSize(client.introCard.location)
			surface.SetTextPos(w*0.5 - tSizeX*0.5, h*0.3 + tSizeY*0.5)
			surface.DrawText(client.introCard.location)
			
			--location2
			surface.SetFont("nutMenuButtonLightFont")
			surface.SetTextColor(200, 200, 200, fade2)
			
			tSizeX, tSizeY = surface.GetTextSize(client.introCard.location2)
			surface.SetTextPos(w*0.5 - tSizeX*0.5, h*0.4 + tSizeY*0.5)
			surface.DrawText(client.introCard.location2)
			
			--timer
			if(curTime > client.introCard.startTime + client.introCard.duration) then
				client.introCard = nil
				fade = nil
				fade2 = nil
				fadeout = nil
			end
		end
		
		if(client.outroCard) then
			if(fade != 255) then
				local fraction = (curTime - client.outroCard.startTime) / (client.outroCard.duration * 0.25)
				fraction = math.Clamp(fraction, 0, 1)
				fade = Lerp(fraction, 0, 255)
			end
		
			--black background
			surface.SetDrawColor(0, 0, 0, fade)
			surface.DrawRect(-1, -1, w+2, h+2)
			
			--outro message
			surface.SetTextColor(255, 255, 255, fade)
			surface.SetFont("nutDynFontMedium")
	
			tSizeX, tSizeY = surface.GetTextSize(client.outroCard.message)
			surface.SetTextPos(w*0.5 - tSizeX*0.5, h*0.5 - tSizeY*0.5)
			surface.DrawText(client.outroCard.message)
			
			--timer
			--[[
			if(curTime > client.outroCard.startTime + client.outroCard.duration) then
				client.outroCard = nil
				fade = nil
			end
			--]]
		end
	end
end
