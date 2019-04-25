local PLUGIN = PLUGIN
PLUGIN.name = "Mini Menu"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A little menu that goes into F2 that you can assign buttons to. It's ugly."

PLUGIN.buttons = {}

function PLUGIN:getMenu()
	return self.buttons
end

function PLUGIN:addMenu(data)
	table.insert(self.buttons, data)
end