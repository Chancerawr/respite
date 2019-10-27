local PLUGIN = PLUGIN
PLUGIN.name = "Creep"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A weird experimental thing that grows."

PLUGIN.amt = 0
PLUGIN.spawns = {}
PLUGIN.heart = false

nut.config.add("maxCreep", 50, "How many total creep entities should be on the map before they stop spreading.", nil, {
	data = {min = 1, max = 2000},
	category = "Creep"
})

nut.config.add("creepSpreadRate", 60, "How fast creep spreads and grows.", nil, {
	data = {min = 1, max = 10000},
	category = "Creep"
})

nut.config.add("maxCreepSpawns", 15, "How many total creep npcs can be on the map before it stops spawning them.", nil, {
	data = {min = 1, max = 2000},
	category = "Creep"
})

nut.config.add("creepSpawnRate", 600, "How fast creep spawns npcs.", nil, {
	data = {min = 1, max = 10000},
	category = "Creep"
})

--extinguishes all fire
nut.command.add("cleancreep", {
	adminOnly = true,
	onRun = function(client, arguments)
		for k, v in pairs(ents.FindByClass("nut_creep")) do
			v:Remove()
		end
		
		for k, v in pairs(ents.FindByClass("nut_creepspread")) do
			v:Remove()
		end
		
		client:notify("Cleaned all creep.")
	end
})

if(SERVER) then
	function PLUGIN:Think()
		if(!self.nextCheck) then self.nextCheck = CurTime() end
		
		if(CurTime() > self.nextCheck) then
			for k, v in pairs(self.spawns) do
				if !IsValid(v) then
					table.remove(self.spawns, k)
				end
			end
			
			self.nextCheck = CurTime() + 60
		end
	end
end