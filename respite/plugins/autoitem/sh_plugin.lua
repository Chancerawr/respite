local PLUGIN = PLUGIN
PLUGIN.name = "Random Items"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Experimental randomly generated items."

--[[
PLUGIN.adj = {
	["Weak"] = "This weapon makes you and anything it touches feel weaker for a short period of time.",
	["Blinding"] = "Those who make physical contact with this weapon or anything coming out of it may lose some vision for a small period of time.",
	["Biting"] = "This weapon is made out of, or fires teeth.",
	["Shocking"] = "An electrical current runs through this weapon somehow, and without the proper equipment it will shock anything touching it.",
	["Burning"] = "This weapon is incredibly hot to the touch, it can burn your hands if held long enough.",
	["Horrific"] = "This weapon fills onlookers with terror, even though nothing about its appearance is particularly horrifying.",
	["Terrifying"] = "This weapon fills onlookers with terror, even though nothing about its appearance is particularly terrifying.",
	["Shattered"] = "This weapon has cracks all through it like glass, but it doesn't seem to affect its abilities.",
}
--]]

--Name, effect.
--Weak ___, Those who touch it or anything it fires are weaker.
--Weak ___, _______ something ___________________________ adj

--[weak] = {"make contact", "weaker physically"}
PLUGIN.adj = {
	{"Weak", "make contact with", "weaker physically"},
	{"Shocking", "make contact with", "shocked"},
	{"Blinding", "make contact with", "blinded"},
	{"Burning", "make contact with", "burned"},
	{"Horrific", "look at", "horrified"},
	{"Terrifying", "look at", "terrified"},
}

PLUGIN.names = {
	"Clean",
	"Dirty",
	"Scary",
	"Horrifying",
	"Terrifying",
	"Spectacular",
	"Shiny",
	"Sturdy",
	"Shattered",
	"Fancy",
	"Crude",
	"Amazing",
	"Bloodstained",
	"Damaged",
	"Large",
	"Small",
	"Gross",
	"Aromatic",
	"Uninspiring",
	"Inspiring",
	"Uninteresting",
	"Interesting",
	"Rugged",
	"Used",
	"Pristine",
	"Dusty",
	"Old",
	"Restored",
	"Ancient",
	"New",
	"Wonderful",
	"Hot",
	"Cold",
	"Chilled",
	"Warm",
	"Neutral",
	"Balanced",
	"Hostile"
}

local function contructItem()
	local adj = table.Random(PLUGIN.adj)
	
	return adj[1], "Those who " ..adj[2].. " it or anything it fires are " ..adj[3].. "."
end

nut.command.add("generateitem", {
	adminOnly = true,
	onRun = function(client, arguments)
		local position = client:getItemDropPos()
		
		local models = {}
		for k, v in pairs(nut.item.list) do
			if(!models[v.model]) then
				models[v.model] = v.model
			end
		end
		
		local colors = {
			Color(255,255,255),
			Color(0,255,255),
			Color(255,0,255),
			Color(255,255,0),
			Color(255,0,0),
			Color(0,255,0),
			Color(0,0,255),
			Color(128,128,128),
			Color(255,128,128),
			Color(128,255,128),
			Color(128,128,255),
			Color(0,0,0)
		}
		
		local name, desc = contructItem()
		
		local model = table.Random(models)
		local color = table.Random(colors)
		
		nut.item.spawn("quest", position, function(item2)
			item2:getEntity():SetModel(model)
		
			item2:setData("customName", name.. " " ..item2.name)
			item2:setData("customDesc", desc)
			item2:setData("customMdl", model)
			item2:setData("customCol", color)
		end)
	end
})
