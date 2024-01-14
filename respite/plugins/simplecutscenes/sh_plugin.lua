-- This thing is unfinished and pretty unpolished, but you can mess with it if you want to

local PLUGIN = PLUGIN
PLUGIN.name = "Simple Cutscenes"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A system for simple cutscenes."

PLUGIN.fadeDelay = 0.5

PLUGIN.cutscenes = PLUGIN.cutscenes or {}

if(SERVER) then
	--runs a cutscene on a single target
	function PLUGIN:runCutscene(client, cutsceneID)
		netstream.Start(client, "nut_cutscene", cutsceneID)
	end
	
	--runs a cutscene on everyone
	function PLUGIN:runCutsceneAll(cutsceneID)
		for k, client in pairs(player.GetAll()) do
			netstream.Start(client, "nut_cutscene", cutsceneID)
		end
	end
else
	function PLUGIN:runCutscene(cutsceneID)
		local cutscene = PLUGIN.cutscenes[cutsceneID]
		if(!cutscene) then return end
		cutscene = table.Copy(cutscene) --make sure we dont modify the source
		
		local client = LocalPlayer()
		local cutStarted = false
		local fadeDelay = PLUGIN.fadeDelay

		--A panel for fading in and fading out.
		local fade = vgui.Create("DPanel")
		fade:SetSize(ScrW(), ScrH())
		fade:SetSkin("Default")
		fade:SetBackgroundColor(color_black)
		fade:SetAlpha(0)
		fade:SetZPos(999)
	
		--panel that holds the image and subtitles
		local scenePanel = vgui.Create("DPanel")
		scenePanel:SetSize(ScrW(), ScrH())
		scenePanel:SetZPos(999)
		
		--image
		local image = scenePanel:Add("DHTML")
		image:SetSize(ScrW(), ScrH()*0.75)

		local w, h, ft, clmp
		local tSizeX
		local tSizeY
		--local fade
		--local fade2
		--local fadeout
		w, h = ScrW(), ScrH()
		
		--subtitles
		scenePanel.Paint = function()
			client = LocalPlayer()
			ft = FrameTime()
			curTime = CurTime()
		
			--black background
			if(cutStarted) then
				surface.SetDrawColor(0, 0, 0, 255)
				surface.DrawRect(-1, -1, w+2, h+2)
			end

			--subtitle drawing
			if(client.scene) then
				local scene = client.scene
				
				if(scene.subtitle) then
					--subtitle text
					surface.SetFont(scene.font)
					
					local textColor = scene.color
					local red = textColor and textColor.r or 64
					local green = textColor and textColor.g or 100
					local blue = textColor and textColor.b or 100
					surface.SetTextColor(red, green, blue, 255)
					
					local lines = nut.util.wrapText(scene.subtitle, w*0.5, scene.font)
					
					local lineOffset = 0
					for k, line in pairs(lines) do
						tSizeX, tSizeY = surface.GetTextSize(line)
						--surface.SetTextPos(w*0.5 - tSizeX*0.5, h*0.7 + tSizeY*0.5 + lineOffset)
						surface.SetTextPos(w*0.5 - tSizeX*0.5, h*0.75 + tSizeY*0.5 + lineOffset)
						surface.DrawText(line)
						
						lineOffset = lineOffset + tSizeY + 8
					end
				end
			end
		end
		
		-- Add darkness
		local function fadeIn()
			fade:AlphaTo(255, fadeDelay, 0)
		end
		
		-- Remove darkness
		local function fadeOut()
			fade:AlphaTo(0, fadeDelay, 0)
		end
		
		--change the background image
		local function changeImage(url)
			if(url) then
				image:SetHTML([[
					<html>
						<body style="margin: 0; padding: 0; overflow: hidden;">
							<img src="]]..url..[[" width="]]..ScrW()..[[" height="]]..(ScrH()*0.75)..[[" />
						</body>
					</html>
				]])
			else
				image:SetHTML("")
			end
		end
		
		--starts/changes the subtitles
		local function subtitleStart(subtitle)
			if(subtitle.sound) then
				surface.PlaySound(subtitle.sound)
			end
			
			--sent to client for drawing
			local clientScene = {
				subtitle = subtitle.text,
				color = subtitle.color,
				font = subtitle.font,
				sound = subtitle.sound,
			}
		
			client.scene = clientScene
		end
		
		--ends the cutscene
		local function endCutscene(scene)
			scenePanel:Remove()
			fadeOut()
			
			if(scene.songFade and nut.cutsceneMusic) then
				local i = 0
				timer.Create("cutSongFade", 0.5, 5, function()
					i = i + 2
					
					if(nut.cutsceneMusic.SetVolume) then
						nut.cutsceneMusic:SetVolume(0.5 - i/20)
					else
						nut.cutsceneMusic:ChangeVolume(1 - i/10)
					end
					
					if(nut.cutsceneMusic:GetVolume() == 0) then
						nut.cutsceneMusic:Stop()
						nut.cutsceneMusic = nil
					end
				end)
			end
			
			timer.Simple(fadeDelay, function()
				fade:Remove()
			end)
		end
		
		--this helps space things out and prevents things from fading too fast
		for k, scene in SortedPairs(cutscene) do
			if(scene.subtitles) then
				scene.subtitles[#scene.subtitles+1] = {
					text = "",
					font = "nutTitleFont", -- The font is uses
					duration = fadeDelay,
				}
			end
		end
		
		--gross timer nonsense here, there's definitely a better way to do this
		local delay = 0
		
		--cutscene starts with a fade in
		delay = delay + fadeDelay
		for k, scene in SortedPairs(cutscene) do
			-- every scene starts with a fade out
			scene.startTime = delay
			delay = delay + fadeDelay
			
			for k, subtitle in pairs(scene.subtitles) do
				subtitle.startTime = delay
				delay = delay + subtitle.duration
				subtitle.endTime = delay
			end
			
			-- every scene ends with fade in
			delay = delay + fadeDelay
		end
		
		--fade in to start cutscene
		fadeIn()
		for k, scene in SortedPairs(cutscene) do
			timer.Simple(scene.startTime, function() -- Scene timer, delays the scene
				fadeOut() -- Remove darkness, revealing the image
			
				cutStarted = true
			
				changeImage(scene.image)
		
				if(scene.sound) then
					if(nut.cutsceneMusic) then
						nut.cutsceneMusic:Stop()
						nut.cutsceneMusic = nil
					end
					
					if (scene.sound:find("http")) then
						sound.PlayURL(scene.sound, "noplay", function(music, errorID, fault)
							if (music) then
								music:SetVolume(0.5)
								nut.cutsceneMusic = music
								nut.cutsceneMusic:Play()
							end
						end)
					else
						nut.cutsceneMusic = CreateSound(client, scene.sound)
						nut.cutsceneMusic:PlayEx(1, 100)
					end
				end
			end)
		
			for k2, subtitle in SortedPairs(scene.subtitles) do
				-- Subtitle timer, delays each subtitle
				timer.Simple(subtitle.startTime, function() 
					subtitleStart(subtitle)
					
					-- last subtitle of scene, fade to black
					if(k2 == #scene.subtitles) then
						fadeIn()

						timer.Simple(fadeDelay, function()
							changeImage()
							client.scene = nil
							
							-- last subtitle of last scene, end the cutscene
							if(k == #cutscene) then
								timer.Simple(fadeDelay, function()
									endCutscene(scene)
								end)
							end
						end)
					end
				end)
			end
		end
	end

	--server tells client to run cutscene
	netstream.Hook("nut_cutscene", function(cutsceneID)
		PLUGIN:runCutscene(cutsceneID)
	end)
end

--commands to run these things
nut.command.add("cutscene", {
	adminOnly = true,
	syntax = "<string cutscene>",
	onRun = function(client, arguments)
		local cutsceneID = arguments[1]

		if(!cutsceneID) then
			client:notify("Missing information.")
			return false
		end
		
		if(!PLUGIN.cutscenes[cutsceneID]) then
			client:notify("Invalid cutscene " ..cutsceneID.. ".")
			return false
		end
		
		PLUGIN:runCutsceneAll(cutsceneID)
	end
})

--commands to run these things
nut.command.add("cutscenetarget", {
	adminOnly = true,
	syntax = "<string target> <string cutscene>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local cutsceneID = arguments[2]

			if(!cutsceneID) then
				client:notify("Missing information.")
				return false
			end
			
			if(!PLUGIN.cutscenes[cutsceneID]) then
				client:notify("Invalid cutscene " ..cutsceneID.. ".")
				return false
			end
			
			PLUGIN:runCutscene(target, cutsceneID)
		end
	end
})