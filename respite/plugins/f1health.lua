local PLUGIN = PLUGIN
PLUGIN.name = "F1 Health Indicator"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Lets players see their HP in the F1 menu."

if(CLIENT) then
	function PLUGIN:CreateCharInfoText(panel, suppress)
		local char = LocalPlayer():getChar()
		if(!char) then return end
	
		--health
		panel.hp = panel.info:Add("DLabel")
		panel.hp:Dock(TOP)
		panel.hp:SetTall(25)
		panel.hp:SetFont("nutMediumFont")
		panel.hp:SetTextColor(Color(200,60,60))
		panel.hp:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		panel.hp:DockMargin(0, 10, 0, 0)
	
		local hp = LocalPlayer():Health()
		local hpMax = LocalPlayer():GetMaxHealth()
		if (hp and hpMax) then
			panel.hp:SetText("Health: " ..hp.. "/" ..hpMax)
		end		
	end
end