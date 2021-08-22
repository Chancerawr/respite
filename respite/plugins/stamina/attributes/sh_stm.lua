ATTRIBUTE.name = "Agility"
ATTRIBUTE.desc = "Character's swiftness and balance. Used primarily for dodging and anything that requires speed."

function ATTRIBUTE:onSetup(client, value)
	client:SetRunSpeed(nut.config.get("runSpeed") + value)
end