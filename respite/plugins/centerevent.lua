local PLUGIN = PLUGIN
PLUGIN.name = "Screen Centered Events"
PLUGIN.author = ""
PLUGIN.desc = "Prints an event in the top center of the screen."
--
if(CLIENT) then
	function PLUGIN:eventCenter(text)
		LocalPlayer().eventCenter = {
			text = text,
			startTime = CurTime(),
			duration = 12,
		}
	end

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

		if(client.eventCenter) then
			if(!fade) then
				fade = 255
			end
		
			if(fade2 != 255 and !fadeout) then
				local fraction = (curTime - client.eventCenter.startTime) / (client.eventCenter.duration * 0.25)
				fraction = math.Clamp(fraction, 0, 1)
				fade2 = Lerp(fraction, -100, 255)
			else
				fadeout = true
				
				local fraction2 = (curTime - (client.eventCenter.startTime + client.eventCenter.duration*0.5)) / (client.eventCenter.duration * 0.5)
				fraction2 = math.Clamp(fraction2, 0, 1)
				fade = Lerp(fraction2, 255, 0)
				fade2 = Lerp(fraction2, 400, 0)
			end
			
			local textLines = nut.util.wrapText(client.eventCenter.text, ScrW()*0.8, "nutTitleFont")
			
			--display text at center
			surface.SetFont("nutTitleFont")
			surface.SetTextColor(255, 255, 255, fade2)
			
			for lineNum, text in pairs(textLines) do
				tSizeX, tSizeY = surface.GetTextSize(text)
				surface.SetTextPos(w*0.5 - tSizeX*0.5, h*0.3 - tSizeY*0.5 + tSizeY*(lineNum-1))
				surface.DrawText(text)
			end

			--timer
			if(curTime > client.eventCenter.startTime + client.eventCenter.duration) then
				client.eventCenter = nil
				fade = nil
				fade2 = nil
				fadeout = nil
			end
		end
	end
end

-- Global events.
nut.chat.register("eventcenter", {
	onCanSay =  function(speaker, text)
		return speaker:IsAdmin()
	end,
	onCanHear = 1000000,
	onChatAdd = function(speaker, text)
		chat.AddText(nut.chat.timestamp(false), Color(255, 150, 0), text)

		PLUGIN:eventCenter(text)
	end,
	prefix = {"/eventcenter"}
})