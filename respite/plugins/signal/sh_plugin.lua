local PLUGIN = PLUGIN
PLUGIN.name = "Signal"
PLUGIN.author = "Black Tea"
PLUGIN.desc = "You can beep at other people."
local SIGNAL_CHATCOLOR = Color(100, 100, 255)

PLUGIN.codeList = {
	"HELP!",
	"DANGER!",
	"CAUTION!",
	
	"Plastic",
	"Drifter",
	"Shade",
	"Abomination",
	"Aberration",
	"Wraith",
	"Lost",
	"Shadow",
	
	"Ichor",
	"Blight",
	"Shard",
	"Memory",
	"Idea",
	
	"Water",
	"Fire",
	"Resources",
	"Anomaly",
	"Equipment",
	
	"Fabricator",
	"Safebox",

	"Injured",
	"Healthy",
	
	"Haze",
	"Blue Haze",
	"Black Haze",
	"Blood Haze",
	"Pink Haze",
	
	"Storm",
	"Snow",
	"Rain",
	"Fog",
	"Cloud",
	
	"Elephant",
	"Bird",
	"Dog",
	"Rat",
	"Mouse",
	"Cat",
	"Bear",
	"Wolf",
	"Tiger",
	"Moose",
	"Bee",
	"Fly",
	"Fish",
	"Rhino",
	"Fox",
	"Giraffe",
	"Squid",
	"Octopus",
	"Shark",
	"Toad",
	"Tortoise",
	"Hedgehog",
	"Donkey",
	"Gopher",
	"Horse",
	"Scorpion",
	"Spider",
	"Monkey",
	"Whale",
	"Lizard",
	
	"Jeffrey",
	"???",
}

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

	vgui.Register("nutSignalDial", PANEL, "DPanel")

	PANEL = {}

	function PANEL:Init()
		self:SetTitle("Signal Frequency")
		self:SetSize(330, 220)
		self:Center()
		self:MakePopup()

		self.submit = self:Add("DButton")
		self.submit:Dock(BOTTOM)
		self.submit:DockMargin(0, 5, 0, 0)
		self.submit:SetTall(25)
		self.submit:SetText("Submit")
		self.submit.DoClick = function()
			local str = ""
			for i = 1, 5 do
				if (i != 4) then
					str = str .. tostring(self.dial[i].number or 0)
				else
					str = str .. "."
				end
			end
			netstream.Start("signalAdjust", str, self.itemID)

			self:Close()
		end

		self.dial = {}
		for i = 1, 5 do
			if (i != 4) then
				self.dial[i] = self:Add("nutSignalDial")
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

	vgui.Register("nutSignalMenu", PANEL, "DFrame")

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

	netstream.Hook("signalAdjust", function(freq, id)
		local adjust = vgui.Create("nutSignalMenu")

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
	netstream.Hook("signalAdjust", function(client, freq, id)
		local inv = (client:getChar() and client:getChar():getInv() or nil)

		if (inv) then
			local item

			if (id) then
				item = nut.item.instances[id]
			else
				item = inv:getFirstItemOfType("comm_signal")
			end

			local ent = item:getEntity()

			if (item and (IsValid(ent) or item:getOwner() == client)) then
				(ent or client):EmitSound("buttons/combine_button1.wav", 50, 170)
				item:setData("freq", freq, player.GetAll(), false, true)
			else
				client:notifyLocalized("You don't have a signalling device.")
			end
		end
	end)

	nut.command.add("sigfreq", {
		syntax = "<string name> [string flags]",
		onRun = function(client, arguments)
			local inv = client:getChar():getInv()

			if (inv) then
				item = inv:getFirstItemOfType("comm_signal")

				if (item) then
					item:setData("freq", arguments[1], nil, nil, true)
				else
					client:notify("You don't have a signalling device.")
				end
			end
		end
	})
end

local function endChatter(listener)
	timer.Simple(1, function()
		if (!listener:IsValid() or !listener:Alive()) then
			return false
		end

		listener:EmitSound("buttons/button18.wav", math.random(60, 70), math.random(80, 120), 0.3, CHAN_STATIC)
	end)
end

nut.command.add("signal", {
	onRun = function(client, arguments)		
		nut.chat.send(client, "signal", arguments)
	end
})

nut.chat.register("signal", {
	format = "**%s's signalling device beeps.",
	font = "nutRadioFont",
	filter = "actions",
	onGetColor = function(speaker, text)
		return SIGNAL_CHATCOLOR
	end,
	onCanHear = function(speaker, listener)
		local listenerInv = listener:getChar():getInv()
		local freq

		if (!CURFREQ or CURFREQ == "") then
			return false
		end

		if (listenerInv) then
			for k, v in pairs(listenerInv:getItems()) do
				if (freq) then
					break
				end

				if ((v.uniqueID == "comm_signal" or v.uniqueID == "comm_radio") and v:getData("power") == true) then
					if (CURFREQ == v:getData("freq", "000.0")) then
						endChatter(listener)
						return true
					end

					break
				end
			end
		end

		return false
	end,
	onCanSay = function(speaker, text)
		local schar = speaker:getChar()
		local speakerInv = schar:getInv()
		local freq

		if (speakerInv) then
			for k, v in pairs(speakerInv:getItems()) do
				if (freq) then
					break
				end

				if (v.uniqueID == "comm_signal" and v:getData("power", false) == true) then
					freq = v:getData("freq", "000.0")
					break
				end
			end
		end

		if (freq) then
			CURFREQ = freq
			speaker:EmitSound("buttons/button18.wav", math.random(60, 70), math.random(80, 120), 0.3, CHAN_STATIC)
		else
			speaker:notifyLocalized("You don't have an activated signalling device.")
			return false
		end
	end,
	onChatAdd = function(speaker, text, anonymous)
		--local name = anonymous and L"someone" or hook.Run("GetDisplayedName", speaker, chatType) or (IsValid(speaker) and speaker:Name() or "Console")

		if(istable(text)) then
			text = ""
		end
		
		local textSep = string.Explode(" ", text)
		
		local code = ""
		for k, v in pairs(textSep) do		
			local codeNum = 100

			if(tonumber(v)) then
				codeNum = tonumber(v)
			end
			
			if(codeNum < table.Count(nut.plugin.list["signal"].codeList) and codeNum > 0) then
				code = code.. " " ..nut.plugin.list["signal"].codeList[codeNum]
			else
				code = code.. " Unknown"
			end
			
			code = code.. "."
		end
		
		code = code.. " (Distance " ..math.Round(LocalPlayer():GetPos():Distance(speaker:GetPos())).. ")"

		chat.AddText(SIGNAL_CHATCOLOR, code)
	end,	
	prefix = {"/signal"},
})