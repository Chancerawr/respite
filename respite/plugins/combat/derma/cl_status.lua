local PLUGIN = PLUGIN

local PANEL = {}

function PANEL:Init()
	local client = LocalPlayer()
	local char = client:getChar()

	nut.gui.status = self

	self:SetSize(self:GetParent():GetSize())

	self.scroll = self:Add("DScrollPanel")
	self.scroll:Dock(TOP)
	self.scroll:SetSize(self:GetParent():GetSize())
	--self.name:SetFont("nutMediumFont")
	--self.name:SetTextColor(color_white)
	--self.name:SetText("")
	--self.name:SetExpensiveShadow(1, Color(0, 0, 0, 150))
	--self.name:DockMargin(0, 10, 0, 0)
	--self.name:SetText(client:Name())

	self.name = self.scroll:Add("DLabel")
	self.name:Dock(TOP)
	self.name:SetTall(25)
	self.name:SetFont("nutMediumFont")
	self.name:SetTextColor(color_white)
	self.name:SetText("")
	self.name:SetExpensiveShadow(1, Color(0, 0, 0, 150))
	self.name:DockMargin(0, 10, 0, 0)
	self.name:SetText(client:Name())

	--level
	self.level = self.scroll:Add("DLabel")
	self.level:Dock(TOP)
	self.level:SetTall(25)
	self.level:SetFont("nutMediumFont")
	self.level:SetTextColor(color_white)
	self.level:SetText("")
	self.level:SetExpensiveShadow(1, Color(0, 0, 0, 150))
	self.level:DockMargin(0, 10, 0, 0)

	local level = LocalPlayer():getLevel()
	local extra = char:getData("points")
	self.level:SetText("Level: " ..level - (extra or 0).. ((extra and " (+" ..extra.. ")") or ""))

	--health
	self.hp = self.scroll:Add("DLabel")
	self.hp:Dock(TOP)
	self.hp:SetTall(25)
	self.hp:SetFont("nutMediumFont")
	self.hp:SetTextColor(Color(200,120,120))
	self.hp:SetExpensiveShadow(1, Color(0, 0, 0, 150))
	self.hp:DockMargin(0, 10, 0, 0)

	local hp = client:Health()
	local hpMax = client:GetMaxHealth()
	if (hp and hpMax) then
		self.hp:SetText("Health: " ..hp.. "/" ..hpMax)
	end		

	--mind
	self.mp = self.scroll:Add("DLabel")
	self.mp:Dock(TOP)
	self.mp:SetTall(25)
	self.mp:SetFont("nutMediumFont")
	self.mp:SetTextColor(Color(120,120,200))
	self.mp:SetExpensiveShadow(1, Color(0, 0, 0, 150))
	self.mp:DockMargin(0, 10, 0, 0)	
	
	local mp = client:getMP()
	local mpMax = client:getMaxMP()
	if (mp and mpMax) then
		self.mp:SetText("Mind: " ..mp.. "/" ..mpMax)
	end
	
	--weight
	--[[
	local weight = client:getWeight()
	local weightMax = client:getMaxWeight()
	if (weight and weightMax) then
		self.weight = self.scroll:Add("DLabel")
		self.weight:Dock(TOP)
		self.weight:SetTall(25)
		self.weight:SetFont("nutMediumFont")
		self.weight:SetTextColor(color_white)
		self.weight:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		self.weight:DockMargin(0, 10, 0, 0)
		self.weight:SetText("Weight: " ..weight.. "/" ..weightMax.. " kg")
	end
	--]]
	
	--damage
	local damage = client:getDamage()
	if(damage) then
		self.damage = self.scroll:Add("DLabel")
		self.damage:Dock(TOP)
		self.damage:SetTall(25)
		self.damage:SetFont("nutMediumFont")
		self.damage:SetTextColor(color_white)
		self.damage:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		self.damage:DockMargin(0, 10, 0, 0)
		
		local dmgString = ""
		local totalDam = 0
		for k, v in pairs(damage) do
			--dmgString = dmgString..(v.dmg or 0)..(v.weap and " {" ..v.weap.. ": " or "{")..(v.dmgT or "Crush").. "}"
			totalDam = totalDam + (v.dmg or 0)
			
			if(k == #damage and k > 1) then
				--dmgString = dmgString.. " [" ..totalDam.. "]"
			end
		end
		
		self.damage:SetText("Average Damage: " ..totalDam.. " damage.")
	end	
	
	--accuracy (small)
	local accuracy = client:getAccuracy()
	if(accuracy) then
		self.accuracy = self.scroll:Add("DLabel")
		self.accuracy:Dock(TOP)
		--self.accuracy:SetTall(25)
		self.accuracy:SetFont("nutSmallFont")
		--self.accuracy:SetTextColor(color_white)
		self.accuracy:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		self.accuracy:DockMargin(2,2,2,2)
		self.accuracy:SetText("   Accuracy: " ..accuracy)
	end
	
	--magic
	--[[
	local magic = client:getMagic()
	if(magic) then
		self.magic = self.scroll:Add("DLabel")
		self.magic:Dock(TOP)
		self.magic:SetTall(25)
		self.magic:SetFont("nutMediumFont")
		self.magic:SetTextColor(color_white)
		self.magic:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		self.magic:DockMargin(0, 10, 0, 0)
		
		self.magic:SetText("Magic Bonus: " ..magic.. ".")
	end	
	--]]
	
	--armor
	local armor = client:getArmor()
	if(armor) then
		self.armor = self.scroll:Add("DLabel")
		self.armor:Dock(TOP)
		self.armor:SetTall(25)
		self.armor:SetFont("nutMediumFont")
		self.armor:SetTextColor(color_white)
		self.armor:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		self.armor:DockMargin(0, 10, 0, 0)
		self.armor:SetText("Physical Armor: " ..armor)
	end
		
	--evasion (small)
	--[[
	local evasion = client:getEvasion()
	if(evasion) then
		self.evasion = self.scroll:Add("DLabel")
		self.evasion:Dock(TOP)
		--self.evasion:SetTall(25)
		self.evasion:SetFont("nutSmallFont")
		--self.evasion:SetTextColor(color_white)
		self.evasion:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		self.evasion:DockMargin(2,2,2,2)
		self.evasion:SetText("   Evasion: " ..evasion)
	end
	--]]
	
	--resistances
	self.resL = self.scroll:Add("DLabel")
	self.resL:Dock(TOP)
	self.resL:SetTall(25)
	self.resL:SetFont("nutMediumFont")
	self.resL:SetTextColor(color_white)
	self.resL:SetExpensiveShadow(1, Color(0, 0, 0, 150))
	self.resL:DockMargin(0, 10, 0, 0)
	self.resL:SetText("Resistances")
	
	local res = client:getRes()
	for k, v in pairs(res) do
		local resist = self.scroll:Add("DLabel")
		resist:Dock(TOP)

		resist:SetWrap(true)
		resist:SetAutoStretchVertical(true)
		resist:DockMargin(2,2,2,2)
		resist:SetFont("nutSmallFont")
		
		local name = (PLUGIN.dmgTypes[k] and PLUGIN.dmgTypes[k].name)-- or (EFFS.effects[k] and EFFS.effects[k].name)
		if(name) then
			resist:SetText("   " ..name.. " Resistance: " ..(v * 100).. "%.")
		elseif(k == "end") then
			resist:SetText("   General Resistance: " ..(v * 100).. "%.")
		else
			resist:SetText("   Unknown Resistance")
		end
	end	
	
	--amplifications
	self.ampL = self.scroll:Add("DLabel")
	self.ampL:Dock(TOP)
	self.ampL:SetTall(25)
	self.ampL:SetFont("nutMediumFont")
	self.ampL:SetTextColor(color_white)
	self.ampL:SetExpensiveShadow(1, Color(0, 0, 0, 150))
	self.ampL:DockMargin(0, 10, 0, 0)
	self.ampL:SetText("Amplifications")
	
	local amp = client:getAmp()
	for k, v in pairs(amp) do
		local amp = self.scroll:Add("DLabel")
		amp:Dock(TOP)

		amp:SetWrap(true)
		amp:SetAutoStretchVertical(true)
		amp:DockMargin(2,2,2,2)
		amp:SetFont("nutSmallFont")
		
		local name = (PLUGIN.dmgTypes[k] and PLUGIN.dmgTypes[k].name)-- or (EFFS.effects[k] and EFFS.effects[k].name)
		if(name) then
			amp:SetText("   " ..name.. " Amplification: " ..(v * 100).. "%.")
		elseif(k == "end") then
			amp:SetText("   General Amplification: " ..(v * 100).. "%.")
		else
			amp:SetText("   Unknown Amplification")
		end
	end	
	
	--tag bonuses
	self.bonusL = self.scroll:Add("DLabel")
	self.bonusL:Dock(TOP)
	self.bonusL:SetTall(25)
	self.bonusL:SetFont("nutMediumFont")
	self.bonusL:SetTextColor(color_white)
	self.bonusL:SetExpensiveShadow(1, Color(0, 0, 0, 150))
	self.bonusL:DockMargin(0, 10, 0, 0)
	self.bonusL:SetText("Tag Bonuses")
	
	local tags = client:getTagsBonus()
	
	for k, v in pairs(tags) do
		local bonus = self.scroll:Add("DLabel")
		bonus:Dock(TOP)

		bonus:SetWrap(true)
		bonus:SetAutoStretchVertical(true)
		bonus:DockMargin(2,2,2,2)
		bonus:SetFont("nutSmallFont")

		bonus:SetText("   [" ..k.. "]: " ..(v).. "x damage.")
	end
		
	--equipment
	local inventory = char:getInv()
	
	self.equip = {}
	
	local x, y = 500, 0
	
	for k, v in pairs(inventory:getItems()) do
		if(v:getData("equip")) then
			local equip = self.scroll:Add("DLabel")
			equip:SetPos(x, y)
			--equip:Dock(RIGHT)
			equip:SetTall(25)
			equip:SetWide(300)
			equip:SetFont("nutMediumFont")
			equip:SetTextColor(color_white)
			equip:SetExpensiveShadow(1, Color(0, 0, 0, 150))
			--equip:DockMargin(0, 10, 0, 0)
			equip:SetText(v:getName())
			
			--self.equip[k] = equip
			
			local dmg = v:getData("dmg", v.dmg)
			local dmgT = v:getData("dmgT", v.dmgT) or "Crush"
			if(dmg) then
				y = y + 25
			
				local dmgL = self.scroll:Add("DLabel")

				dmgL:SetFont("nutSmallFont")
				dmgL:SetPos(x, y)
				dmgL:SetWide(300)
				dmgL:SetExpensiveShadow(1, Color(0, 0, 0, 150))

				dmgL:SetText("   Base Damage: " ..dmg.. " {" ..dmgT.. "}")
			end	
			
			local armor = v:getData("armor", v.armor)
			if(armor) then
				y = y + 25
			
				local armorL = self.scroll:Add("DLabel")

				armorL:SetFont("nutSmallFont")
				armorL:SetPos(x, y)
				armorL:SetWide(300)
				armorL:SetExpensiveShadow(1, Color(0, 0, 0, 150))

				armorL:SetText("   Physical Armor: " ..armor)
			end		
			
			--[[
			local weight = v:getData("weight", v.weight)
			if(weight) then
				y = y + 25
			
				local weightL = self.scroll:Add("DLabel")

				weightL:SetFont("nutSmallFont")
				weightL:SetPos(x, y)
				weightL:SetWide(300)
				weightL:SetExpensiveShadow(1, Color(0, 0, 0, 150))

				weightL:SetText("   Weight: " ..weight)
			end
			--]]
			
			y = y + 25
		end
	end	
	
	
	--buffs here
	x, y = 900, 0
	
	for k, v in pairs(client:getBuffs()) do
		
		--[[
		if(v:getData("equip")) then
			local equip = self:Add("DLabel")
			equip:SetPos(x, y)
			--equip:Dock(RIGHT)
			equip:SetTall(25)
			equip:SetWide(300)
			equip:SetFont("nutMediumFont")
			equip:SetTextColor(color_white)
			equip:SetExpensiveShadow(1, Color(0, 0, 0, 150))
			--equip:DockMargin(0, 10, 0, 0)
			equip:SetText(v:getName())
			
			--self.equip[k] = equip
			
			local dmg = v:getData("dmg", v.dmg)
			local dmgT = v:getData("dmgT", v.dmgT) or "Crush"
			if(dmg) then
				y = y + 25
			
				local dmgL = self.scroll:Add("DLabel")

				dmgL:SetFont("nutSmallFont")
				dmgL:SetPos(x, y)
				dmgL:SetWide(300)
				dmgL:SetExpensiveShadow(1, Color(0, 0, 0, 150))

				dmgL:SetText("   Base Damage: " ..dmg.. " {" ..v.dmgT.. "}")
			end	
			
			local armor = v:getData("armor", v.armor)
			if(armor) then
				y = y + 25
			
				local armorL = self.scroll:Add("DLabel")

				armorL:SetFont("nutSmallFont")
				armorL:SetPos(x, y)
				armorL:SetWide(300)
				armorL:SetExpensiveShadow(1, Color(0, 0, 0, 150))

				armorL:SetText("   Physical Armor: " ..armor)
			end		
			
			local weight = v:getData("weight", v.weight)
			if(weight) then
				y = y + 25
			
				local weightL = self.scroll:Add("DLabel")

				weightL:SetFont("nutSmallFont")
				weightL:SetPos(x, y)
				weightL:SetWide(300)
				weightL:SetExpensiveShadow(1, Color(0, 0, 0, 150))

				weightL:SetText("   Weight: " ..weight)
			end
			
			y = y + 25
		end
		--]]
	end	
end

function PANEL:OnRemove()
end
vgui.Register("nutStatus", PANEL, "EditablePanel")

hook.Add("CreateMenuButtons", "nutStatus", function(tabs)
	tabs["Status"] = function(panel)
		panel:Add("nutStatus")
	end
end)