local PLUGIN = PLUGIN

if(CLIENT) then return end
if(game.GetMap() != "gm_prison") then return end

PLUGIN.scripts = PLUGIN.scripts or {}
--
PLUGIN.scripts["prison"] = {
	onLoad = function(self)
		if(self.loadedEnts) then
			for k, v in pairs(self.loadedEnts) do
				SafeRemoveEntity(v)
			end
		end
	
		self.loadedEnts = nut.plugin.list["templates"]:loadTemplate(nil, "prison", nil)
	end,
	onEnd = function(self)
		if(self.loadedEnts) then
			for k, v in pairs(self.loadedEnts) do
				SafeRemoveEntity(v)
			end
		end
	end,
}