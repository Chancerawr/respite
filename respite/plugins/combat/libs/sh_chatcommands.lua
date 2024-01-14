local PLUGIN = PLUGIN

--stat prints
nut.command.add("chargetattribs", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			local char = target:getChar()

			local boosted = {}
		
			for k, v in pairs(nut.attribs.list) do
				boosted[k] = char:getAttrib(k)
			end
		
			local attribs = char:getAttribs()
		
			netstream.Start(client, "ShowAttribs", target, attribs, boosted)
		end
	end
})

--stat print
nut.command.add("chargetattrib", {
	adminOnly = true,
	syntax = "<string name> <string type>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local findAtt = arguments[2]
			local attribName
			for k, v in pairs(nut.attribs.list) do
				if (nut.util.stringMatches(L(v.name, client), findAtt) or nut.util.stringMatches(k, findAtt)) then
					attribName = k
				end
			end
			if(attribName) then
				local value = target:getChar():getAttrib(attribName, 0)
			
				client:notifyLocalized(target:Name() .." ".. findAtt .. ": " .. value)
			else
				client:notifyLocalized("Invalid Attribute")
			end
		end
	end
})

--stat print
nut.command.add("statcheck", {
	syntax = "<string attribute>",
	onRun = function(client, arguments)
		if(IsValid(client) and client:getChar()) then
			local findAtt = arguments[1]
			local attribName
			for k, v in pairs(nut.attribs.list) do
				if (nut.util.stringMatches(L(v.name, client), findAtt) or nut.util.stringMatches(k, findAtt)) then
					attribName = k
				end
			end
			if(attribName) then
				local value = client:getChar():getAttrib(attribName, 0)
				local name = nut.attribs.list[attribName].name
		
				nut.chat.send(client, "statcheck", "has " .. value .. " " .. name)
			else
				client:notifyLocalized("Invalid Attribute")
			end
		end
	end
})


--[[
--just a simple chat command for a regular attack
nut.command.add("attack", {
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			PLUGIN:attack(client, entity)
		else
			--rollHandle(client, tbl.uid)
			PLUGIN:attack(client)
		end
	end
})
--]]

--simple menu that shows attributes
if(CLIENT) then
	netstream.Hook("ShowAttribs", function(client, attribs, boosted)
		local attribText = ""
		
		local attribCount = 0
		local boostCount = 0
		
		for k, v in pairs(boosted or attribs) do
			local boostText = ""
			local bonus = 0
			
			if(boosted and !table.IsEmpty(boosted)) then
				bonus = (v - (attribs[k] or 0))
				boostText = boostText.. " (" ..(((bonus >= 0) and "+") or "")..bonus.. ")"
				
				boostCount = boostCount + bonus
			end
		
			attribCount = attribCount + v - bonus
			attribText = attribText .. nut.attribs.list[k].name .. ": " ..v..boostText.. "\n\n"
		end
	
		local attribMenu = vgui.Create("DFrame")
		attribMenu:SetSize( 500, 700 )
		attribMenu:Center()
		if(me) then
			attribMenu:SetTitle("Player Menu")
		else
			attribMenu:SetTitle(client:Name())
		end
		attribMenu:MakePopup()

		attribMenu.DS = vgui.Create( "DScrollPanel", attribMenu )
		attribMenu.DS:SetPos( 10, 50 )
		attribMenu.DS:SetSize( 500 - 10, 700 - 50 - 10 )
		function attribMenu.DS:Paint( w, h ) end
		
		attribMenu.B = vgui.Create( "DLabel", attribMenu.DS )
		attribMenu.B:SetPos( 0, 40 )
		attribMenu.B:SetFont( "nutSmallFont" )
		attribMenu.B:SetText( attribText )
		attribMenu.B:SetAutoStretchVertical( true )
		attribMenu.B:SetWrap( true )
		attribMenu.B:SetSize( 500 - 20, 10 )
		attribMenu.B:SetTextColor( Color( 255, 255, 255, 255 ) )
		
		attribMenu.count = vgui.Create( "DLabel", attribMenu.DS )
		attribMenu.count:Dock(BOTTOM)
		attribMenu.count:SetFont( "nutSmallFont" )
		attribMenu.count:SetText("Total Attributes: " ..attribCount.. " + " ..boostCount)
		attribMenu.count:SetAutoStretchVertical( true )
		attribMenu.count:SetWrap(true)
		attribMenu.count:SetTextColor(Color(255, 255, 255, 255))
	end)
end