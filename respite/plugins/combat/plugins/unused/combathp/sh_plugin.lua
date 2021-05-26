local PLUGIN = PLUGIN
PLUGIN.name = "Combat HP"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Adds a system for managing an HP Value for turn based combat."

PLUGIN.NUTCOMBATHP = NUTCOMBATHP or {}

--this is so the stuff shows up in admin ESP
function PLUGIN:PlayerLoadout(client)
	client:setNetVar("hp", client:getMaxHP())
	client:setNetVar("hpMax", client:getMaxHP())
end

local playerMeta = FindMetaTable("Player")

function playerMeta:getHP()
	return self:getNetVar("hp", 0)
end

function playerMeta:getMaxHP()
	local char = self:getChar()
		
	local maxHP = 20
	--[[
	if(char) then
		local vit = char:getAttrib("end", 0)
		maxHP = maxHP + vit * 3
		
		for k, v in pairs(nut.attribs.list) do
			maxHP = maxHP + (char:getAttrib(k, 0) * 0.5)
		end
	end
	--]]
	
	return maxHP
end

--just use a negative value to take away hp
function playerMeta:addHP(amount)
	local new = math.Clamp(self:getHP() + amount, -100, self:getMaxHP())
	
	new = math.Round(new, 3)
	
	self:setNetVar("hp", new)
	
	return new
end

function PLUGIN:Think()
	if((self.nextHPCheck or 0) < CurTime()) then
		self.nextHPCheck = CurTime() + 10
		for k, v in pairs(player.GetAll()) do
			if(IsValid(v)) then
				local char = v:getChar()
				if(char) then
					local hp = v:getHP()
					local hpMax = v:getNetVar("hpMax", 0)
					
					PLUGIN.NUTCOMBATHP[v] = {hp, hpMax}
				end
			end
		end
	end
	
	if((self.nextHPClean or 0) < CurTime()) then
		self.nextHPClean = CurTime() + 600
		
		for k, v in pairs(PLUGIN.NUTCOMBATHP) do
			if(!IsValid(v)) then
				PLUGIN.NUTCOMBATHP[v] = nil
			end
		end
	end
end

if(CLIENT) then
	NUT_CVAR_ADMINESPR = CreateClientConVar("nut_obsespr", 1, true, true)

	function PLUGIN:CreateCharInfoText(panel, suppress)
		local char = LocalPlayer():getChar()
		if(!char) then return end
	
		--health
		panel.hp = panel.info:Add("DLabel")
		panel.hp:Dock(TOP)
		panel.hp:SetTall(25)
		panel.hp:SetFont("nutMediumFont")
		panel.hp:SetTextColor(color_white)
		panel.hp:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		panel.hp:DockMargin(0, 10, 0, 0)
	
		local hp = LocalPlayer():getHP()
		local hpMax = LocalPlayer():getMaxHP()
		if (hp and hpMax) then
			panel.hp:SetText("Health: " ..hp.. "/" ..hpMax)
		end		
	end
end

nut.command.add("charsethp", {
	adminOnly = true,
	syntax = "<string target> <number value>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No target specified")
			return false
		end
	
		if(!arguments[2]) then
			client:notify("No HP specified")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then	
			local new = math.Clamp(tonumber(arguments[2]), 0, target:getMaxHP())
			target:setNetVar("hp", new)
			
			client:notify("Health successfully changed.")
		end
	end
})

nut.command.add("charaddhp", {
	adminOnly = true,
	syntax = "<string target> <number health>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No target specified")
			return false
		end
		
		if(!arguments[2]) then
			client:notify("No amount specified")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then	
			target:addHP(tonumber(arguments[2]))
			
			client:notify("Health successfully added.")
		end
	end
})

nut.command.add("charrestore", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No target specified")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then	
			target:setNetVar("hp", target:getMaxHP())
			
			client:notify("Health successfully restored.")
		end
	end
})

nut.command.add("charrestoreall", {
	adminOnly = true,
	syntax = "<none>",
	onRun = function(client, arguments)
		local count = 0
	
		for k, target in pairs(player.GetAll()) do
			if(IsValid(target) and target:getChar()) then	
				target:setNetVar("hp", target:getMaxHP())

				count = count + 1
			end
		end
		
		client:notify(count.. " players successfully restored.")
	end
})