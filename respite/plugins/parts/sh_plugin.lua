local PLUGIN = PLUGIN
PLUGIN.name = "Weird Bodies"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A weird body system, don't worry about it."

PLUGIN.parts = {
	["Skull"] = 2,
	["Left Eye"] = 1,
	["Right Eye"] = 1,
	["Nose"] = 1,
	["Mouth"] = 1,
	["Neck Flesh"] = 1,
	["Neck"] = 2,
	["Larynx"] = 1,
	["Neck Spine"] = 2,
	["Base of Neck"] = 1,
	["Left Shoulder"] = 2,
	["Right Shoulder"] = 2,
	["Left Shoulder Socket"] = 1,
	["Right Shoulder Socket"] = 1,
	["Left Upper Arm Bone"] = 2,
	["Right Upper Arm Bone"] = 2,
	["Left Upper Arm Flesh"] = 2,
	["Right Upper Arm Flesh"] = 2,
	["Left Elbow"] = 1,
	["Right Elbow"] = 1,
	["Left Forearm Flesh"] = 2,
	["Right Forearm Flesh"] = 2,
	["Left Forearm Bone"] = 2,
	["Right Forearm Bone"] = 2,
	["Left Hand"] = 1,
	["Right Hand"] = 1,
	["Left Scapula"] = 1,
	["Right Scapula"] = 1,
	["Heart"] = 3,
	["Left Lung"] = 3,
	["Right Lung"] = 3,
	["Upper Chest Spine"] = 2,
	["Lower Chest Spine"] = 2,
	["Abdomen Spine"] = 2,
	["Left Upper Chest Rib"] = 1,
	["Right Upper Chest Rib"] = 1,
	["Left Lower Chest Rib"] = 1,
	["Right Lower Chest Rib"] = 1,
	["Liver"] = 2,
	["Kidney"] = 2,
	["Stomach"] = 2,
	["Spleen"] = 1,
	["Large Intestine"] = 2,
	["Small Intestine"] = 2,
	["Left Pelvis"] = 2,
	["Center Pelvis"] = 2,
	["Right Pelvis"] = 2,
	["Left Hip"] = 2,
	["Right Hip"] = 2,
	["Left Hip Socket"] = 2,
	["Right Hip Socket"] = 2,
	["Left Upper Leg Flesh"] = 2,
	["Right Upper Leg Flesh"] = 2,
	["Left Upper Leg Femur"] = 2,
	["Right Upper Leg Femur"] = 2,
	["Left Knee"] = 1,
	["Right Knee"] = 1,
	["Left Shin Flesh"] = 1,
	["Right Shin Flesh"] = 1,
	["Left Tibia"] = 1,
	["Right Tibia"] = 1,
	["Left Ankle"] = 1,
	["Right Ankle"] = 1,
	["Left Foot"] = 1,
	["Right Foot"] = 1,
	["Left Ear"] = 1,
	["Right Ear"] = 1
}

--calculates how much of a person's body is special
function PLUGIN:calcPercent(char)
	local total = 0
	for k, v in pairs(self.parts) do
		total = total + v
	end

	local pTable = char:getData("parts", 0)
	
	local total2 = 0
	for k, v in pairs(pTable) do
		total2 = total2 + self.parts[k]
	end
	
	return (total2 / total)
end

function PLUGIN:addPart(char, part)
	local pTable = char:getData("parts", {})
	pTable[part] = true
	
	char:setData("parts", pTable)
end

function PLUGIN:removePart(char, part)
	local pTable = char:getData("parts", {})
	pTable[part] = nil
	
	char:setData("parts", pTable)
end

--oh look it's this menu again big surprise
if(CLIENT) then
	netstream.Hook("ShowParts", function(client, parts)
		local text = ""
		
		for k, v in pairs(parts) do
			text = text .. k .. ": is made of ichor.\n\n"
		end
	
		local menu = vgui.Create( "DFrame" )
		menu:SetSize( 500, 700 )
		menu:Center()
		if( me ) then
			menu:SetTitle( "Player Menu" )
		else
			menu:SetTitle( client:Name() )
		end
		menu:MakePopup()

		menu.DS = vgui.Create( "DScrollPanel", menu )
		menu.DS:SetPos( 10, 50 )
		menu.DS:SetSize( 500 - 10, 700 - 50 - 10 )
		function menu.DS:Paint( w, h ) end
		
		menu.B = vgui.Create( "DLabel", menu.DS )
		menu.B:SetPos( 0, 40 )
		menu.B:SetFont( "nutSmallFont" )
		menu.B:SetText( text )
		menu.B:SetAutoStretchVertical( true )
		menu.B:SetWrap( true )
		menu.B:SetSize( 500 - 20, 10 )
		menu.B:SetTextColor( Color( 255, 255, 255, 255 ) )
	end)
end


--stat prints
nut.command.add("chargetparts", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			local parts = target:getChar():getData("parts", {})
		
			netstream.Start(client, "ShowParts", target, parts)
		end
	end
})

--stat prints
nut.command.add("charaddpart", {
	adminOnly = true,
	syntax = "<string target> <string part>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			if(PLUGIN.parts[arguments[2]]) then
				PLUGIN:addPart(target:getChar(), arguments[2])
			end
		end
	end
})