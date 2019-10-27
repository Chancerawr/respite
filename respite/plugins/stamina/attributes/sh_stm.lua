ATTRIBUTE.name = "Agility"
ATTRIBUTE.desc = "The quickness of your character in various actions."

function ATTRIBUTE:onSetup(client, value)
	client:SetRunSpeed(nut.config.get("runSpeed") + value)
end