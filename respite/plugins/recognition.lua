PLUGIN.name = "Recognition"
PLUGIN.author = "Chessnut"
PLUGIN.desc = "Adds the ability to recognize people."

do
	local character = nut.meta.character

	if (SERVER) then
		function character:recognize(id)
			if (type(id) != "number" and id.getID) then
				id = id:getID()
			end

			local recognized = self:getData("rgn", "")

			if (recognized != "" and recognized:find(","..id..",")) then
				return false;
			end;

			self:setData("rgn", recognized..","..id..",")

			return true
		end
	end

	function character:doesRecognize(id)
		if (type(id) != "number" and id.getID) then
			id = id:getID()
		end

		return hook.Run("IsCharRecognized", self, id) != false
	end

	function PLUGIN:IsCharRecognized(char, id)
		local other = nut.char.loaded[id]

		if (other) then
			local faction = nut.faction.indices[other:getFaction()]

			if (faction and faction.isGloballyRecognized) then
				return
			end
		end
		
		local client = char:getPlayer()
		if(client and client:getNetVar("adminRec")) then
			return
		end

		local recognized = char:getData("rgn", "")

		if (recognized == "") then
			return false
		end

		if(isstring(id)) then
			if (!recognized:find(","..id..",")) then
				return false
			end
		end
	end
end

if (CLIENT) then
	CHAT_RECOGNIZED = CHAT_RECOGNIZED or {}
	CHAT_RECOGNIZED["ic"] = true
	CHAT_RECOGNIZED["y"] = true
	CHAT_RECOGNIZED["w"] = true
	CHAT_RECOGNIZED["me"] = true

	function PLUGIN:IsRecognizedChatType(chatType)
		return CHAT_RECOGNIZED[chatType]
	end

	function PLUGIN:GetDisplayedDescription(client)
		if (client:getChar() and client != LocalPlayer() and LocalPlayer():getChar() and !LocalPlayer():getChar():doesRecognize(client:getChar()) and !hook.Run("IsPlayerRecognized", client)) then
			return L"noRecog"
		end
	end

	function PLUGIN:ShouldAllowScoreboardOverride(client)
		if (nut.config.get("sbRecog")) then
			return true
		end
	end

	function PLUGIN:GetDisplayedName(client, chatType)
		if (client != LocalPlayer()) then
			local character = client:getChar()
			local charID = (character.getID and character:getID()) or -1
			
			local ourCharacter = LocalPlayer():getChar()
		
			local recogData = ourCharacter:getData("alias", {})
			local nickname = recogData[charID]
		
			--if they're concealed by a mask or something
			if(client:getNetVar("concealed")) then
				return "Concealed"
			end
		
			--if they have a nickname set by the viewer
			if(nickname) then
				return nickname
			end
		
			if (ourCharacter and character and !ourCharacter:doesRecognize(character) and !hook.Run("IsPlayerRecognized", client)) then
				if (chatType and hook.Run("IsRecognizedChatType", chatType)) then
					local description = character:getDesc()

					if (#description > 40) then
						description = description:utf8sub(1, 37).."..."
					end

					return "["..description.."]"
				elseif (!chatType) then
					return L"unknown"
				end
			end
		end
	end

	netstream.Hook("rgnMenu", function()
		local menu = DermaMenu()
			menu:AddOption(L"rgnLookingAt", function()
				netstream.Start("rgn", 1)
			end)
			menu:AddOption(L"rgnWhisper", function()
				netstream.Start("rgn", 2)
			end)
			menu:AddOption(L"rgnTalk", function()
				netstream.Start("rgn", 3)
			end)
			menu:AddOption(L"rgnYell", function()
				netstream.Start("rgn", 4)
			end)
			menu:AddOption("Add Nickname", function()
				netstream.Start("nut_nickA")
			end)
			menu:AddOption("Remove Nickname", function()
				netstream.Start("nut_nickR")
			end)
		menu:Open()
		menu:MakePopup()
		menu:Center()
	end)

	netstream.Hook("rgnDone", function()
		hook.Run("OnCharRecognized", client, id)
	end)

	function PLUGIN:OnCharRecognized(client, recogCharID)
		surface.PlaySound("buttons/button17.wav")
	end

	-- Add interaction function
	nut.playerInteract.addFunc("recognize", {
		nameLocalized = "recognize",
		callback = function(target)
			netstream.Start("rgnDirect", target)
		end,
		canSee = function(target)
			return true
		end
	})
else
	function PLUGIN:ShowSpare1(client)
		if client:getChar() then
			netstream.Start(client, "rgnMenu")
		end
	end

	netstream.Hook("nut_nickA", function(client)
		local target = client:GetEyeTrace().Entity
	
		if (IsValid(target) and target:IsPlayer()) then
			client:requestString("Set Nickname", "Unknown", function(text)
				local char = client:getChar()
				
				local alias = char:getData("alias", {})
				alias[target:getChar():getID()] = text
				
				char:setData("alias", alias)
				
				client:notify("Nickname successfully set.")
			end)
		else
			client:notify("You must be looking at a player.")
		end
	end)
	
	netstream.Hook("nut_nickR", function(client)
		local target = client:GetEyeTrace().Entity
	
		if (IsValid(target) and target:IsPlayer()) then
			local char = client:getChar()
			
			local alias = char:getData("alias", {})
			alias[target:getChar():getID()] = nil
			
			char:setData("alias", alias)
			
			client:notify("Nickname successfully removed.")
		else
			client:notify("You must be looking at a player.")
		end
	end)
	
	netstream.Hook("rgnDirect", function(client, target)
		if target:GetPos():DistToSqr(client:GetPos()) > 100000 then return end

		local id = client:getChar():getID()
		if target:getChar():recognize(id) then
			netstream.Start(client, "rgnDone")
			hook.Run("OnCharRecognized", client, id)
			client:notifyLocalized("recognized")
		else
			client:notifyLocalized("already_recognized")
		end
	end)

	netstream.Hook("rgn", function(client, level)
		local targets = {}

		if (level < 2) then
			local entity = client:GetEyeTraceNoCursor().Entity

			if (IsValid(entity) and entity:IsPlayer() and entity:getChar() and nut.chat.classes.ic.onCanHear(client, entity)) then
				targets[1] = entity
			end
		else
			local class = "w"

			if (level == 3) then
				class = "ic"
			elseif (level == 4) then
				class = "y"
			end

			class = nut.chat.classes[class]

			for k, v in ipairs(player.GetAll()) do
				if (client != v and v:getChar() and class.onCanHear(client, v)) then
					targets[#targets + 1] = v
				end
			end
		end

		if (#targets > 0) then
			local id = client:getChar():getID()
			local i = 0

			for k, v in ipairs(targets) do
				if (v:getChar():recognize(id)) then
					i = i + 1
				end
			end

			if (i > 0) then
				netstream.Start(client, "rgnDone")
				hook.Run("OnCharRecognized", client, id)
			end
		end
	end)
end

nut.command.add("charnickname", {
	syntax = "<string nickname>",
	onRun = function(client, arguments)
		local target = client:GetEyeTrace().Entity
		if (IsValid(target) and target:IsPlayer()) then
			local char = client:getChar()
			
			local alias = char:getData("alias", {})
			alias[target:getChar():getID()] = arguments[1]
			
			char:setData("alias", alias)
			
			client:notify("Character's nickname has been set.")
		else
			client:notify("You must be looking at a player.")
		end
	end
})

nut.command.add("adminrec", {
	adminOnly = true,
	onRun = function(client, arguments)
		if(!client:getNetVar("adminRec")) then
			client:setNetVar("adminRec", true)
			client:notify("Admin recognition enabled.")
		else
			client:setNetVar("adminRec", false)
			client:notify("Admin recognition disabled.")
		end
	end
})