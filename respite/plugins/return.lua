PLUGIN.name = "Return"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Go back. /return."

function PLUGIN:PlayerDeath(victim, inflictor, attacker)
	local char = victim:getChar()
	
	if(char) then
		char:setData("deathPos", victim:GetPos())
	end
end

nut.command.add("return", {
	onRun = function(client, arguments)
		if(IsValid(client)) then
			if(client:Alive()) then
				local char = client:getChar()
				local oldPos = char:getData("deathPos")
				
				if(oldPos) then
					client:SetPos(oldPos)
					char:setData("deathPos", nil)
				else
					client:notify("No death position saved.")
				end
			else
				client:notify("Wait until you respawn.")
			end
		end
	end
})
