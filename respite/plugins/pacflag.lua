local PLUGIN = PLUGIN

PLUGIN.name = "PAC3 Flag"
PLUGIN.author = "Luna"
PLUGIN.desc = "Adds a flag to PAC3."

do

function PLUGIN:PrePACConfigApply(client)
	return client:getChar():hasFlags("P")
end

function PLUGIN:PrePACEditorOpen(client)
    return client:getChar():hasFlags("P")
end

end

nut.flag.add("P", "Access to PAC3.")