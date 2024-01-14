local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

--this is so the stuff shows up in admin ESP
function PLUGIN:PlayerLoadout(client)
	client:SetMaxHealth(math.max(client:getMaxHP(),100))
	client:SetHealth(math.max(client:getMaxHP(),100))
	client:setHP(client:getMaxHP())
	client:setMP(client:getMaxMP())
end

--just use a negative value to take away hp
function playerMeta:getMaxMP()
	local char = self:getChar()
	
	local stat = 0
	if(char) then
		stat = self:getChar():getAttrib("fortitude", 0)
	end

	return math.max(10 + stat, 1)
end

--just use a negative value to take away hp
function playerMeta:getMP()
	return self:getNetVar("mp", self:getMaxMP())
end

--just use a negative value to take away hp
function playerMeta:getHP()
	return self:getNetVar("hp", self:getMaxHP())
	--return self:Health()
end

--used to calculate what a player's max HP should be
function playerMeta:getMaxHP()
	local char = self:getChar()
	if(!char) then return 100 end
	
	local stat = char:getAttrib("end", 0)

	local maxHP = math.max(100 + stat*3, 1)

	maxHP = math.Round(maxHP, 2)

	return maxHP
end

if(SERVER) then
	--just use a negative value to subtract
	function playerMeta:addHP(amount)
		local new = math.Clamp(self:getHP() + amount, -1000, self:getMaxHP())
		
		new = math.Round(new, 2)
		
		self:setHP(new)
		
		return new
	end

	--just use a negative value to subtract
	function playerMeta:addMP(amount)
		local new = math.Clamp(self:getMP() + amount, -1000, self:getMaxMP())
		
		new = math.Round(new, 2)
		
		self:setMP(new)
		
		return new
	end
	
	--sets to exactly the supplied value
	function playerMeta:setHP(amount)
		self:setNetVar("hp", amount)
		
		self:SetMaxHealth(self:getMaxHP())
	end
	
	--sets to exactly the supplied value
	function playerMeta:setMP(amount)
		self:setNetVar("mp", amount)
	end
else
	function PLUGIN:CreateCharInfoText(panel, suppress)
		local char = LocalPlayer():getChar()
		if(!char) then return end

		--health (turn based)
		panel.hp = panel.info:Add("DLabel")
		panel.hp:Dock(TOP)
		panel.hp:SetTall(25)
		panel.hp:SetFont("nutMediumFont")
		panel.hp:SetTextColor(Color(200,120,120))
		panel.hp:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		panel.hp:DockMargin(0, 10, 0, 0)
	
		local hp = LocalPlayer():Health()
		local hpMax = LocalPlayer():getMaxHP()
		if (hp and hpMax) then
			panel.hp:SetText("Health: " ..hp.. "/" ..hpMax)
		end

		--[[
		--health (turn based)
		panel.hp = panel.info:Add("DLabel")
		panel.hp:Dock(TOP)
		panel.hp:SetTall(25)
		panel.hp:SetFont("nutMediumFont")
		panel.hp:SetTextColor(Color(200,120,120))
		panel.hp:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		panel.hp:DockMargin(0, 10, 0, 0)
	
		local hp = LocalPlayer():getHP()
		local hpMax = LocalPlayer():GetMaxHealth()
		if (hp and hpMax) then
			panel.hp:SetText("Health: " ..hp.. "/" ..hpMax)
		end
	
		--mind
		panel.mp = panel.info:Add("DLabel")
		panel.mp:Dock(TOP)
		panel.mp:SetTall(25)
		panel.mp:SetFont("nutMediumFont")
		panel.mp:SetTextColor(Color(120,120,200))
		panel.mp:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		panel.mp:DockMargin(0, 10, 0, 0)
	
		local mp = LocalPlayer():getMP()
		local mpMax = LocalPlayer():getMaxMP()
		if (mp and mpMax) then
			panel.mp:SetText("Mind: " ..mp.. "/" ..mpMax)
		end	
		--]]
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
			target:setHP(new)
			
			client:notify("Health is now " ..target:getHP().. ".")
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

			client:notify("Health is now " ..target:getHP().. ".")
		end
	end
})

nut.command.add("charsetmp", {
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
			local new = math.Clamp(tonumber(arguments[2]), 0, target:GetMaxMP())
			target:setMP(new)
			
			client:notify("Mind is now " ..target:getMP().. ".")
		end
	end
})

nut.command.add("charaddmp", {
	adminOnly = true,
	syntax = "<string target> <number mind>",
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
			target:addMP(tonumber(arguments[2]))

			client:notify("Mind is now " ..target:getMP().. ".")
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
			target:setHP(target:getMaxHP())
			
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
				target:setHP(target:getMaxHP())

				count = count + 1
			end
		end
		
		client:notify(count.. " players successfully restored.")
	end
})