PLUGIN.name = "Radio"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "You can communicate with other people in distance."

nut.config.add("distortion", false, "Whether distortion is active or not.", nil, {
	category = "Radio"
})

local RADIO_CHATCOLOR = Color(100, 255, 50)

-- This is how initialize Language in Single File.
local langkey = "english"
local langTable = {
	radioFreq = "Frequency",
	radioSubmit = "Submit",
	radioNoRadio = "You don't have any radio to adjust.",
	radioNoRadioComm = "You don't have any radio to communicate",
	radioFormat = "%s radios in \"%s\"",
}

function PLUGIN:PluginLoaded()
	table.Merge(nut.lang.stored[langkey], langTable)
end

if (SERVER) then
    function PLUGIN:PlayerLoadedChar(client)
        --this just makes sure everything is properly networked to clients.
        --kind of annoying and gross, but might not work properly otherwise.
        for k, v in pairs(player.GetAll()) do
            local char = v:getChar()
            if(char) then
				local boost = char:getData("boost", false)
				if(boost) then
					char:setData("boost", true, false, player.GetAll())
				end
            end
        end
    end
end

if (CLIENT) then
	local PANEL = {}
	function PANEL:Init()
		self.number = 0
		self:SetWide(70)

		local up = self:Add("DButton")
		up:SetFont("Marlett")
		up:SetText("t")
		up:Dock(TOP)
		up:DockMargin(2, 2, 2, 2)
		up.DoClick = function(this)
			self.number = (self.number + 1)% 10
			surface.PlaySound("buttons/lightswitch2.wav")
		end

		local down = self:Add("DButton")
		down:SetFont("Marlett")
		down:SetText("u")
		down:Dock(BOTTOM)
		down:DockMargin(2, 2, 2, 2)
		down.DoClick = function(this)
			self.number = (self.number - 1)% 10
			surface.PlaySound("buttons/lightswitch2.wav")
		end

		local number = self:Add("Panel")
		number:Dock(FILL)
		number.Paint = function(this, w, h)
			draw.SimpleText(self.number, "nutDialFont", w/2, h/2, color_white, 1, 1)
		end
	end

	vgui.Register("nutRadioDial", PANEL, "DPanel")

	PANEL = {}

	function PANEL:Init()
		self:SetTitle(L("radioFreq"))
		self:SetSize(330, 220)
		self:Center()
		self:MakePopup()

		self.submit = self:Add("DButton")
		self.submit:Dock(BOTTOM)
		self.submit:DockMargin(0, 5, 0, 0)
		self.submit:SetTall(25)
		self.submit:SetText(L("radioSubmit"))
		self.submit.DoClick = function()
			local str = ""
			for i = 1, 5 do
				if (i != 4) then
					str = str .. tostring(self.dial[i].number or 0)
				else
					str = str .. "."
				end
			end
			netstream.Start("radioAdjust", str, self.itemID)

			self:Close()
		end

		self.dial = {}
		for i = 1, 5 do
			if (i != 4) then
				self.dial[i] = self:Add("nutRadioDial")
				self.dial[i]:Dock(LEFT)
				if (i != 3) then
					self.dial[i]:DockMargin(0, 0, 5, 0)
				end
			else
				local dot = self:Add("Panel")
				dot:Dock(LEFT)
				dot:SetWide(30)
				dot.Paint = function(this, w, h)
					draw.SimpleText(".", "nutDialFont", w/2, h - 10, color_white, 1, 4)
				end
			end
		end
	end

	function PANEL:Think()
		self:MoveToFront()
	end

	vgui.Register("nutRadioMenu", PANEL, "DFrame")

	surface.CreateFont("nutDialFont", {
		font = "Agency FB",
		size = 100,
		weight = 1000
	})

	surface.CreateFont("nutRadioFont", {
		font = "Lucida Sans Typewriter",
		size = math.max(ScreenScale(7), 17),
		weight = 100
	})

	netstream.Hook("radioAdjust", function(freq, id)
		local adjust = vgui.Create("nutRadioMenu")

		if (id) then
			adjust.itemID = id
		end

		if (freq) then
			for i = 1, 5 do
				if (i != 4) then
					adjust.dial[i].number = tonumber(freq[i])
				end
			end
		end
	end)
else
	netstream.Hook("radioAdjust", function(client, freq, id)
		local inv = (client:getChar() and client:getChar():getInv() or nil)

		if (inv) then
			local item

			if (id) then
				item = nut.item.instances[id]
			else
				item = inv:getFirstItemOfType("comm_radio")
			end

			local ent = item:getEntity()

			if (item and (IsValid(ent) or item:getOwner() == client)) then
				(ent or client):EmitSound("buttons/combine_button1.wav", 50, 170)
				item:setData("freq", freq, player.GetAll(), false, true)
			else
				client:notifyLocalized("radioNoRadio")
			end
		end
	end)

	/* Do we need it?
	nut.command.add("freq", {
		syntax = "<string name> [string flags]",
		onRun = function(client, arguments)
			local inv = client:getChar():getInv()

			if (inv) then
				local detect = {
					"comm_radio",
					"comm_radio_stationary",
					"pager"
				}

				for k, v in ipairs(detect) do
					item = inv:getFirstItemOfType(v)
				end

				if (item) then


					item:setData("freq", arguments[1], nil, nil, true)
				else
					client:notify("You do not have any radio to adjust.")
				end
			end
		end
	})
*/
end

-- Yelling out loud.
local find = {
	["comm_radio"] = false,
	["comm_radio_stationary"] = true
}
local function endChatter(listener)
	timer.Simple(1, function()
		if (!listener:IsValid() or !listener:Alive() or hook.Run("ShouldRadioBeep", listener) == false) then
			return false
		end

		listener:EmitSound("npc/metropolice/vo/off"..math.random(1, 3)..".wav", math.random(60, 70), math.random(80, 120))
	end)
end

nut.chat.register("radio", {
	format = "%s radios in, \"%s\"",
	font = "nutRadioFont",
	onGetColor = function(speaker, text)
		return RADIO_CHATCOLOR
	end,
	onCanHear = function(speaker, listener)
		local dist = speaker:GetPos():Distance(listener:GetPos())
		local speakRange = nut.config.get("chatRange", 280)
		local listenerEnts = ents.FindInSphere(listener:GetPos(), speakRange)
		local listenerInv = listener:getChar():getInv()
		local freq

		if (!CURFREQ or CURFREQ == "") then
			return false
		end

		if (dist <= speakRange) then
			return true
		end

		if (listenerInv) then
			for k, v in pairs(listenerInv:getItems()) do
				if (freq) then
					break
				end

				for id, far in pairs(find) do
					if (v.uniqueID == id and v:getData("power", false) == true) then
						if (CURFREQ == v:getData("freq", "000.0")) then
							endChatter(listener)
							
							return true
						end

						break
					end
				end
			end
		end

		if (!freq) then
			for k, v in ipairs(listenerEnts) do
				if (freq) then
					break
				end

				if (v:GetClass() == "nut_item") then
					local itemTable = v:getItemTable()

					for id, far in pairs(find) do
						if (far and itemTable and itemTable.uniqueID == id and v:getData("power", false) == true) then
							if (CURFREQ == v:getData("freq", "000.0")) then
								endChatter(listener)

								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
	onCanSay = function(speaker, text)
		local schar = speaker:getChar()
		local speakRange = nut.config.get("chatRange", 280)
		local speakEnts = ents.FindInSphere(speaker:GetPos(), speakRange)
		local speakerInv = schar:getInv()
		local freq

		if (speakerInv) then
			for k, v in pairs(speakerInv:getItems()) do
				if (freq) then
					break
				end

				for id, far in pairs(find) do
					if (v.uniqueID == id and v:getData("power", false) == true) then
						freq = v:getData("freq", "000.0")

						break
					end
				end
			end
		end

		if (!freq) then
			for k, v in ipairs(speakEnts) do
				if (freq) then
					break
				end

				if (v:GetClass() == "nut_item") then
					local itemTable = v:getItemTable()

					for id, far in pairs(find) do
						if (far and itemTable.uniqueID == id and v:getData("power", false) == true) then
							freq = v:getData("freq", "000.0")

							break
						end
					end
				end
			end
		end

		if (freq) then
			CURFREQ = freq
			speaker:EmitSound("npc/metropolice/vo/on"..math.random(1, 2)..".wav", math.random(50, 60), math.random(80, 120))
		else
			speaker:notifyLocalized("radioNoRadioComm")
			return false
		end
	end,
	onChatAdd = function(speaker, text, anonymous)
		local listener = LocalPlayer()
		local dist = speaker:GetPos():Distance(listener:GetPos())
		local radCol = RADIO_CHATCOLOR
		local finalMsg
		
		local booster = speaker:getChar():getData("boost", false)

		if(!nut.config.get("distortion") or booster) then
			finalMsg = text
		else
			radioMsg = string.Explode("",text)
			if(dist > nut.config.get("chatRange", 280) * 2.5) then
				for i = 1, math.Round((dist/(nut.config.get("chatRange", 280)*2.5)) * text:len()/100) do
					local ranSpot = math.random(1,text:len())
					if(radioMsg[ranSpot] != " ") then --dont replace empty spaces
						radioMsg[ranSpot] = "-"
					end
				end
			end
			finalMsg = string.Implode("", radioMsg)
		end
		
		local someone
		
		if(anonymous) then
			someone = "Someone"
		end
		
		local speako = someone or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name())

		chat.AddText(radCol, speako, radCol, " radios in \""..finalMsg.."\"")
	end,
	prefix = {"/r", "/radio"},
})

nut.chat.register("radiow", {
	format = "%s quietly radios in, \"%s\"",
	font = "nutRadioFont",
	onGetColor = function(speaker, text)
		return Color(RADIO_CHATCOLOR.r - 35, RADIO_CHATCOLOR.g - 35, RADIO_CHATCOLOR.b - 35)
	end,
	onCanHear = function(speaker, listener)
		local dist = speaker:GetPos():Distance(listener:GetPos())
		local speakRange = nut.config.get("chatRange", 280) * .25 -- .1 is the whisper modifier I use since I make standard chat range big.
		local listenerEnts = ents.FindInSphere(listener:GetPos(), speakRange)
		local listenerInv = listener:getChar():getInv()
		local freq

		if (!CURFREQ or CURFREQ == "") then
			return false
		end

		if (dist <= speakRange) then
			return true
		end

		if (listenerInv) then
			for k, v in pairs(listenerInv:getItems()) do
				if (freq) then
					break
				end

				for id, far in pairs(find) do
					if (v.uniqueID == id and v:getData("power", false) == true) then
						if (CURFREQ == v:getData("freq", "000.0")) then
							endChatter(listener)
							
							return true
						end

						break
					end
				end
			end
		end

		if (!freq) then
			for k, v in ipairs(listenerEnts) do
				if (freq) then
					break
				end

				if (v:GetClass() == "nut_item") then
					local itemTable = v:getItemTable()

					for id, far in pairs(find) do
						if (far and itemTable.uniqueID == id and v:getData("power", false) == true) then
							if (CURFREQ == v:getData("freq", "000.0")) then
								endChatter(listener)

								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
	onCanSay = function(speaker, text)
		local schar = speaker:getChar()
		local speakRange = nut.config.get("chatRange", 280) * .25
		local speakEnts = ents.FindInSphere(speaker:GetPos(), speakRange)
		local speakerInv = schar:getInv()
		local freq

		if (speakerInv) then
			for k, v in pairs(speakerInv:getItems()) do
				if (freq) then
					break
				end

				for id, far in pairs(find) do
					if (v.uniqueID == id and v:getData("power", false) == true) then
						freq = v:getData("freq", "000.0")

						break
					end
				end
			end
		end

		if (!freq) then
			for k, v in ipairs(speakEnts) do
				if (freq) then
					break
				end

				if (v:GetClass() == "nut_item") then
					local itemTable = v:getItemTable()

					for id, far in pairs(find) do
						if (far and itemTable.uniqueID == id and v:getData("power", false) == true) then
							freq = v:getData("freq", "000.0")

							break
						end
					end
				end
			end
		end

		if (freq) then
			CURFREQ = freq
			speaker:EmitSound("npc/metropolice/vo/on"..math.random(1, 2)..".wav", math.random(50, 60), math.random(80, 120))
		else
			speaker:notifyLocalized("radioNoRadioComm")
			return false
		end
	end,
	onChatAdd = function(speaker, text, anonymous)
		local listener = LocalPlayer()
		local dist = speaker:GetPos():Distance(listener:GetPos())
		local radCol = Color(RADIO_CHATCOLOR.r - 35, RADIO_CHATCOLOR.g - 35, RADIO_CHATCOLOR.b - 35)
		local radioMsg
		local finalMsg
		
		local booster = speaker:getChar():getData("boost", false)
		
		if(!nut.config.get("distortion") or booster) then
			finalMsg = text
		else			
			radioMsg = string.Explode("",text)
			if(dist > nut.config.get("chatRange", 280) * 2.5) then
				for i = 1, math.Round((dist/(nut.config.get("chatRange", 280)*2.5)) * text:len()/100) do
					local ranSpot = math.random(1,text:len())
					if(radioMsg[ranSpot] != " ") then --dont replace empty spaces
						radioMsg[ranSpot] = "-"
					end
				end
			end
			finalMsg = string.Implode("", radioMsg)
		end
		
		local someone
		
		if(anonymous) then
			someone = "Someone"
		end
		
		local speako = someone or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name())
		chat.AddText(radCol, speako, radCol, " quietly radios in \""..finalMsg.."\"")
	end,
	prefix = {"/rw", "/radiow"},
})

nut.chat.register("radioit", {
	format = "%s%s",
	font = "nutRadioFont",
	onGetColor = function(speaker, text)
		return Color(RADIO_CHATCOLOR.r - 35, RADIO_CHATCOLOR.g - 35, RADIO_CHATCOLOR.b - 35)
	end,
	onCanHear = function(speaker, listener)
		local dist = speaker:GetPos():Distance(listener:GetPos())
		local speakRange = nut.config.get("chatRange", 280) * .25 -- .1 is the whisper modifier I use since I make standard chat range big.
		local listenerEnts = ents.FindInSphere(listener:GetPos(), speakRange)
		local listenerInv = listener:getChar():getInv()
		local freq

		if (!CURFREQ or CURFREQ == "") then
			return false
		end

		if (dist <= speakRange) then
			return true
		end

		if (listenerInv) then
			for k, v in pairs(listenerInv:getItems()) do
				if (freq) then
					break
				end

				for id, far in pairs(find) do
					if (v.uniqueID == id and v:getData("power", false) == true) then
						if (CURFREQ == v:getData("freq", "000.0")) then
							endChatter(listener)
							
							return true
						end

						break
					end
				end
			end
		end

		if (!freq) then
			for k, v in ipairs(listenerEnts) do
				if (freq) then
					break
				end

				if (v:GetClass() == "nut_item") then
					local itemTable = v:getItemTable()

					for id, far in pairs(find) do
						if (far and itemTable.uniqueID == id and v:getData("power", false) == true) then
							if (CURFREQ == v:getData("freq", "000.0")) then
								endChatter(listener)

								return true
							end
						end
					end
				end
			end
		end

		return false
	end,
	onCanSay = function(speaker, text)
		local schar = speaker:getChar()
		local speakRange = nut.config.get("chatRange", 280) * .25
		local speakEnts = ents.FindInSphere(speaker:GetPos(), speakRange)
		local speakerInv = schar:getInv()
		local freq

		if (speakerInv) then
			for k, v in pairs(speakerInv:getItems()) do
				if (freq) then
					break
				end

				for id, far in pairs(find) do
					if (v.uniqueID == id and v:getData("power", false) == true) then
						freq = v:getData("freq", "000.0")

						break
					end
				end
			end
		end

		if (!freq) then
			for k, v in ipairs(speakEnts) do
				if (freq) then
					break
				end

				if (v:GetClass() == "nut_item") then
					local itemTable = v:getItemTable()

					for id, far in pairs(find) do
						if (far and itemTable.uniqueID == id and v:getData("power", false) == true) then
							freq = v:getData("freq", "000.0")

							break
						end
					end
				end
			end
		end

		if (freq) then
			CURFREQ = freq
			speaker:EmitSound("npc/metropolice/vo/on"..math.random(1, 2)..".wav", math.random(50, 60), math.random(80, 120))
		else
			speaker:notifyLocalized("radioNoRadioComm")
			return false
		end
	end,
	onChatAdd = function(speaker, text, anonymous)
		local listener = LocalPlayer()
		local dist = speaker:GetPos():Distance(listener:GetPos())
		local radCol = Color(RADIO_CHATCOLOR.r - 45, RADIO_CHATCOLOR.g - 45, RADIO_CHATCOLOR.b - 45)
		
		--local speako = anonymous and L"someone" or hook.Run("GetDisplayedName", speaker, "ic")
		chat.AddText(radCol, "**", radCol, text)
	end,
	prefix = {"/rit", "/radioit"},
})

nut.command.add("distortiontoggle", {
	adminOnly = true,
	onRun = function(client, arguments)
		if(nut.config.get("distortion", false)) then
			nut.config.set("distortion", false)
			client:notify("Distortion has been turned off.")
		else
			nut.config.set("distortion", true)
			client:notify("Distortion has been turned on.")
		end
	end
})