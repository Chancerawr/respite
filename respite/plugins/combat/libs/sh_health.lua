local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

--this is so the stuff shows up in admin ESP
function PLUGIN:PlayerLoadout(client)
	client:SetMaxHealth(client:getMaxHP())
	client:SetHealth(client:GetMaxHealth())
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

--used to calculate what a player's max HP should be
function playerMeta:getMaxHP()
	local char = self:getChar()
	if(!char) then return 100 end
	
	local stat = char:getAttrib("end", 0)

	return math.max(100 + stat*3, 100)
end

if(SERVER) then
	--just use a negative value to subtract
	function playerMeta:addHP(amount)
		local new = math.Clamp(self:Health() + amount, -100, self:GetMaxHealth())
		
		new = math.Round(new, 3)
		
		self:SetHealth(new)
		
		return new
	end

	--just use a negative value to subtract
	function playerMeta:addMP(amount)
		local new = math.Clamp(self:getMP() + amount, -100, self:getMaxMP())
		
		new = math.Round(new, 3)
		
		self:setMP(new)
		
		return new
	end
	
	--sets to exactly the supplied value
	function playerMeta:setMP(amount)
		self:setNetVar("mp", amount)
	end
else
	function PLUGIN:CreateCharInfoText(panel, suppress)
		local char = LocalPlayer():getChar()
		if(!char) then return end
	
		--health
		panel.hp = panel.info:Add("DLabel")
		panel.hp:Dock(TOP)
		panel.hp:SetTall(25)
		panel.hp:SetFont("nutMediumFont")
		panel.hp:SetTextColor(Color(200,120,120))
		panel.hp:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		panel.hp:DockMargin(0, 10, 0, 0)
	
		local hp = LocalPlayer():Health()
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
			local new = math.Clamp(tonumber(arguments[2]), 0, target:GetMaxHealth())
			target:SetHealth(new)
			
			client:notify("Health is now " ..target:Health().. ".")
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

			client:notify("Health is now " ..target:Health().. ".")
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
			local new = math.Clamp(tonumber(arguments[2]), 0, target:GetMaxHealth())
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
			target:SetHealth(target:GetMaxHealth())
			
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
				target:SetHealth(target:GetMaxHealth())

				count = count + 1
			end
		end
		
		client:notify(count.. " players successfully restored.")
	end
})