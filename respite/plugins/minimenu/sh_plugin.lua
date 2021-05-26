local PLUGIN = PLUGIN
PLUGIN.name = "Mini Menu"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A little menu that goes into F2 that you can assign buttons to. It's ugly."

PLUGIN.buttons = {}

nut.config.add("minimenu_enabled", true, "Whether the Mini Menu (F2 menu) is enabled at all.", nil, {
	category = "Mini Menu"
})

function PLUGIN:getMenu()
	return self.buttons
end

function PLUGIN:addMenu(data)
	table.insert(self.buttons, data)
end