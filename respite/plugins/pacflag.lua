local PLUGIN = PLUGIN

PLUGIN.name = "PAC3 Flag"
PLUGIN.author = "Luna"
PLUGIN.desc = "Adds a flag to PAC3."

do

function PLUGIN:PrePACConfigApply(client)
	local char = client:getChar()
	
	if(char) then
		return char:hasFlags("P")
	end

	return false
end

function PLUGIN:PrePACEditorOpen(client)
    return client:getChar():hasFlags("P")
end

end

nut.flag.add("P", "Access to PAC3.")