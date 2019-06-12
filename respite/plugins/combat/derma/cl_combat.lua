local PLUGIN = PLUGIN

local PANEL = {}
	function PANEL:Init()
		if (IsValid(nut.gui.combat)) then
			nut.gui.combat:Remove()
		end
		
		nut.gui.combat = self
	
		local comTable = CMBT:GetAll()
		
		self:SetSize(ScrW() * 0.3, ScrH() * 0.45)
		self:Center()
		--self:SetPos(ScrW() * 0.2, ScrH() * 0.2)
		self:SetTitle("Commands")
		self:MakePopup()
		
		local inner = vgui.Create("DScrollPanel", self)
		inner:Dock(FILL)

		if(nut.plugin.list["combat"]) then
			local guide = inner:Add("DLabel")
			guide:Dock(TOP)

			guide:SetWrap(true)
			guide:SetAutoStretchVertical(true)
			guide:DockMargin(2,2,2,2)
			guide:SetFont("nutSmallFont")
			
			local guideText = [[QUICK GUIDE:
			Combat is generally done in these easy steps.
			1. Both Player 1 and Player 2 type /reflexes.
			2. Whoever had the higher /reflexes roll may now take the first turn.
			3. The player now has 2 action points. A player can use them to move twice (dash), move and attack, just attack, or for other things depending on the circumstances.
			4. The attacked opponent rolls a single reaction roll (/dodge, /melee, /block, /parry, etc.)
			5. If the attacker rolls higher than the defender then the action succeeds, otherwise the defender successfully dodges/blocks the attack.
			6. The defender types their reaction to attack, and their action. They go to step 3 and the cycle repeats.
			]]
			
			guide:SetText(guideText)
			
			--this is stupid and i hate it, it wouldn't all fit in one panel so i did it this stupid way, im bad with gui
			local rules = {
				"RULES OF COMBAT:",
				"· If in cover, the bullet hits the cover in front of the target limb, whether or not it pierces cover is between the two RPers.",
				"· If a player is not attacking on their turn, they may make two movements.",
				"· Shooting from cover still requires that you assume proper firing posture, so most cover (Leaning out from a wall, firing overtop of a barricade) will only protect the lower abdomen and below.",
				"· P2L with injuries, please be reasonable.",
				"· Injuries are determined by those they are dealt to, not the attacker.",
				"· When you see someone roll for reflexes, check if you're involved and if you are, also roll reflexes so that a turn order can be established.",
				"· You must use one action to unholster a weapon. This means that you can move or attack after unholstering it provided that the distance is not too great.",
				"· If all parties agree on a bonus/penalty to a roll or to roll for different stats entirely it is permitted. If any party says no, then it is resolved by the default rules.",
				"· If you kill someone, do not shoot them with your weapon unless they’ve given the OK.",
				"· If you are not in the combat when it begins, you are subject to timescale, and to join that combat you may have to wait several turns before being given a turn. Typically you are put at the end of the turn order. Turn delay is determined by how many turns have gone by in the combat. Every two turns is a one turn delay for incoming participants. Once combat is over, you cannot immediately jump onto the survivors due to timescale, you must wait before pursuing.",
				"· Once combat has started, your movements are limited to your turns. The two props used for movement measurement are models/hunter/blocks/cube025x4x025.mdl (Movement Distance) and models/hunter/blocks/cube025x8x025.mdl (Dash Distance). Moving a distance less than or equal to Movement Distance costs half of your turn, while moving Dash Distance takes your entire turn.",
				"· If you get hit by something that should reasonably cause an effect, please RP accordingly.",
				"· In some events, the /reflexes based system will be foregone for a team based turn order. For example, turns may be split into Abominations' turns and Drifters' turns. In this case, When it is Drifters' turns, all drifters will take their turns at the same time. This is done to speed up events and keep people from getting bored waiting for their turns. This can be a bit hectic sometimes so do try to stagger your emotes and actions. Be sure to use /meyy in these situations so admins see your actions.",		
			}
			
			for k, v in pairs(rules) do
				local rule = inner:Add("DLabel")
				rule:Dock(TOP)
				rule:SetWrap(true)
				rule:SetAutoStretchVertical(true)
				rule:DockMargin(2,2,2,2)
				rule:SetFont("nutSmallFont")

				rule:SetText(v)
			end
			
			local commands = inner:Add("DLabel")
			commands:Dock(TOP)
			commands:SetTall(ScrH() * 0.055)
			commands:DockMargin(2,2,2,2)
			commands:SetFont("nutSmallFont")
			commands:SetText("\nCOMMANDS:")
				
			for k, v in SortedPairsByMemberValue(comTable, "category", false) do
				local command = inner:Add("DLabel")
				command:Dock(TOP)
				command:SetWrap(true)
				command:SetAutoStretchVertical(true)
				command:SetTall(ScrH() * 0.055)
				command:DockMargin(2,2,2,2)
				
				--name and description
				local text = v.name.. ": " ..v.desc.. "\n\n"
				
				--command prefix
				text = text.. " Command: /" ..v.uid.. ".\n"				
				
				--atributes used
				text = text.. " Attributes: "
				for k2, v2 in pairs(v.stats) do 
					text = text..nut.attribs.list[k2].name.. ": " ..v2.."x. "
				end
				text = text.. "\n"
				
				--multiplier
				text = text.. " Multiplier: " ..v.mult.. "x."			
				
				--separator
				text = text.. "\n\n"
				
				command:SetFont("nutSmallFont")
				command:SetText(text)
			end
		end
	end
vgui.Register("nutCombat", PANEL, "DFrame")

timer.Simple(1, function()
	nut.plugin.list["minimenu"]:addMenu({"Combat Guide", "nutCombat"})
end)