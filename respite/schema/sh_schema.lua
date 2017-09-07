SCHEMA.name = "Respite"
SCHEMA.introName = ""
SCHEMA.desc = " "
SCHEMA.author = "Chancer and Angelsaur"
SCHEMA.uniqueID = "respite" -- Schema will be a unique identifier stored in the database.

nut.currency.set("", "scrap coin", "scrap coins")

nut.util.include("cl_effects.lua")
nut.util.include("sh_commands.lua")
--nut.util.include("sv_resource.lua")
--nut.util.include("sh_dev.lua") -- Developer Functions

nut.util.includeDir("libs")
nut.util.includeDir("meta")
nut.util.includeDir("hooks")
nut.util.includeDir("derma")


--[[nut.flag.add("F", "Access to food/drink items.")
nut.flag.add("A", "Access to armor/clothing items.")
nut.flag.add("G", "Access to general items.")
nut.flag.add("S", "Access to special/classified items.")

nut.flag.add("1", "Access to melee weaponry.")
nut.flag.add("2", "Access to small weaponry.")
nut.flag.add("3", "Access to large weaponry.")
nut.flag.add("4", "Access to special weaponry.")--]]

nut.flag.add("j", "Access to the junk items.")
nut.flag.add("v", "Access to the general items.")
nut.flag.add("V", "Access to the more rare items.")
nut.flag.add("E", "Effects.")
nut.flag.add("T", "Access to more dangerous tools.")
nut.flag.add("q", "Ability to scrap junk objects.")
nut.flag.add("1", "Customize item names and descriptions.")
nut.flag.add("u", "Ban from OOC.")

nut.anim.setModelClass("models/nh2zombies/friendly.mdl", "citizen_male")
nut.anim.setModelClass("models/nh2zombies/creeper.mdl", "citizen_male")
nut.anim.setModelClass("models/sin/hopper.mdl", "citizen_male")
nut.anim.setModelClass("models/sin/leperkin.mdl", "citizen_male")
nut.anim.setModelClass("models/prosperity/freak.mdl", "citizen_male")
nut.anim.setModelClass("models/spite/doll.mdl", "citizen_male")
nut.anim.setModelClass("models/angelsaur/ghost_girl.mdl", "citizen_male")
nut.anim.setModelClass("models/spite/freak01.mdl", "citizen_male")
nut.anim.setModelClass("models/spite/freak02.mdl", "citizen_male")
nut.anim.setModelClass("models/spite/freak03.mdl", "citizen_male")
nut.anim.setModelClass("models/spite/freak04.mdl", "citizen_male")
nut.anim.setModelClass("models/spite/housewife.mdl", "citizen_male")
nut.anim.setModelClass("models/spite/pack.mdl", "citizen_male")
nut.anim.setModelClass("models/spite/scarlet.mdl", "citizen_male")
nut.anim.setModelClass("models/player/slow/amberlyn/re5/uroboro/slow_public.mdl", "citizen_male")
nut.anim.setModelClass("models/prosperity/shadow.mdl", "citizen_male")

--this is dumb, dont do this in the future.
for i = 1,100 do 
	if(i < 10) then
		nut.anim.setModelClass("models/tnb/citizens/female_0"..i..".mdl", "player")
		nut.anim.setModelClass("models/tnb/citizens/male_0"..i..".mdl", "player")
	end
	nut.anim.setModelClass("models/tnb/citizens/female_"..i..".mdl", "player")
	nut.anim.setModelClass("models/tnb/citizens/male_"..i..".mdl", "player")
end

nut.anim.setModelClass("models/tnb/citizens/male_gorka.mdl", "player")
nut.anim.setModelClass("models/tnb/citizens/male_gorka_helmet.mdl", "player")
nut.anim.setModelClass("models/tnb/citizens/male_hooded.mdl", "player")
nut.anim.setModelClass("models/tnb/citizens/male_miller.mdl", "player")
nut.anim.setModelClass("models/tnb/citizens/male_plates.mdl", "player")
nut.anim.setModelClass("models/tnb/citizens/male_woodland.mdl", "player")
nut.anim.setModelClass("models/tnb/citizens/male_tacticalcoat.mdl", "player")
nut.anim.setModelClass("models/tnb/citizens/male_tacticalrebel.mdl", "player")
nut.anim.setModelClass("models/tnb/combine/combine_dvl.mdl", "player")
nut.anim.setModelClass("models/tnb/combine/metrocop.mdl", "player")
nut.anim.setModelClass("models/tnb/combine/metrocop_female.mdl", "player")
nut.anim.setModelClass("models/tnb/combine/synth_soldier.mdl", "player")


--This is used for some entities to print stuff in the chat to people.
nut.chat.register("mind", {
	onChatAdd = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)
		chat.AddText(Color(115, 115, 115), "**\""..text.."\"")
	end,
	onCanHear = 1, --range is set incredibly low so that only the client can see it.
	prefix = {"/mind"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})