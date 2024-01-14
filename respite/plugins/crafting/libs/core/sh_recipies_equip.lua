--EQUIPMENT
local PLUGIN = PLUGIN

//
RECIPE = {}
RECIPE.uid = "nut_helmet_gasmask"
RECIPE.name = "Gas Mask"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/gasmask.mdl"
RECIPE.desc = "A mask used to protect the user from inhaling airborne pollutants and toxic gases."
 
RECIPE.items = {
	["j_scrap_cloth"] = 5,
	["j_scrap_plastics"] = 5,
	["j_scrap_elastic"] = 1,
	["j_scrap_glass"] = 2
}
RECIPE.result = {
	["gasmask"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_beanie"
RECIPE.name = "Beanie"
RECIPE.category = "Clothing"
RECIPE.model = "models/tnb/items/beanie.mdl"
RECIPE.desc = "A warm winter beanie."
 
RECIPE.items = {
	["j_scrap_cloth"] = 5
}
RECIPE.result = {
	["j_beanie"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ushanka"
RECIPE.name = "Ushanka"
RECIPE.category = "Clothing"
RECIPE.model = "models/ushanka.mdl"
RECIPE.desc = "A Russian fur cap with ear flaps that can be tied up to the crown of the cap."
 
RECIPE.items = {
	["j_scrap_cloth"] = 10
}
RECIPE.result = {
	["j_ushanka"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_boonie"
RECIPE.name = "Leather Boonie"
RECIPE.category = "Clothing"
RECIPE.model = "models/warz/leatherboonie.mdl"
RECIPE.desc = "A form of wide-brim hat commonly used by military forces. Its design is similar to a bucket hat but with a stiffer brim."
 
RECIPE.items = {
	["j_scrap_cloth"] = 10,
	["j_scrap_organic"] = 2
}
RECIPE.result = {
	["j_boonie"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_gloves"
RECIPE.name = "Gloves"
RECIPE.category = "Clothing"
RECIPE.model = "models/tnb/items/gloves.mdl"
RECIPE.desc = "A warm pair of gloves to protect against the cold."
 
RECIPE.items = {
	["j_scrap_cloth"] = 5
}
RECIPE.result = {
	["j_gloves"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_helmet_makeshift"
RECIPE.name = "Makeshift Helmet"
RECIPE.category = "Armor"
RECIPE.model = "models/helm_04.mdl"
RECIPE.desc = "A crude helmet fashioned out of scrap cloth and scrap metal.\nMay protect the head from weaker melee blows to some extent, but likely not very bullet resistant."
 
RECIPE.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_cloth"] = 5
}
RECIPE.result = {
	["helmet_makeshift"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_chain"
RECIPE.name = "Makeshift Chain Armor"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel_molle.mdl"
RECIPE.desc = "A crude vest crafted in a style similar to that of medieval chain mail.\nInstead of using individual chain links, circular pieces of scrap metal with hole drilled through them have been woven into the fabric, providing a fair amount of chest protection against slashing and low-velocity munitions."
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["j_scrap_elastic"] = 4,
	["j_scrap_cloth"] = 15,
	["j_tshirts"] = 1
}
RECIPE.result = {
	["armor_chain"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_gambeson"
RECIPE.name = "Crude Gambeson"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebelmetrocop.mdl"
RECIPE.desc = "A simple jacket that has been reinforced by quilting additional layers of fabric underneath the exterior, with scraps of cloth and cotton stuffed in.\nIt provides a fair amount of protection against blunt strikes and light slashing, while remaining comfortable for the wearer."
 
RECIPE.items = {
	["j_scrap_cloth"] = 30,
	["j_tshirts"] = 2
}
RECIPE.result = {
	["armor_gambeson"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_tread"
RECIPE.name = "Tread Warrior's Guard"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"
RECIPE.desc = "A rubber chestplate that covers the breast and shoulders of the wearer through the ingenious use of repurposed tires.\nThe thick treads covering the chest stop most melee attacks, but are vulnerable to strong thrusts and ranged weapons."
 
RECIPE.items = {
	["j_scrap_rubber"] = 15,
	["j_scrap_screws"] = 4,
	["j_scrap_elastic"] = 2,
	["j_tire"] = 2
}
RECIPE.result = {
	["armor_tread"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_charged"
RECIPE.name = "Voltaic Armor"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"
RECIPE.desc = "A type of chest armor composed mostly of rubber with some sort of light metal component lining the outside. Upon making physical contact with another conductive surface, it will discharge its electricity, injuring and potentially stunning a creature if it has the misfortune of touching it.\nCannot discharge on the wearer.\nMust be recharged with a charged battery after each discharge."
 
RECIPE.items = {
	["j_scrap_rubber"] = 15,
	["j_scrap_elastic"] = 2,
	["j_scrap_metals"] = 10,
	["j_scrap_elecs"] = 10,
	["ammo_battery"] = 2,
	["j_scrap_energy"] = 1
}
RECIPE.result = {
	["armor_charged"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_pauldrons"
RECIPE.name = "PL-8 Pauldrons"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"
RECIPE.desc = "Pauldrons that protect the shoulders crafted from old license plates.\nThe plates are fastened together through the use of zipties in holes that once housed screws, and provide a small amount of protection against firearms on the shoulders.  The plates are vulnerable to blunt strikes, but impervious to stabbing and slashing."
 
RECIPE.items = {
	["j_scrap_rubber"] = 4,
	["j_scrap_cloth"] = 5,
	["j_scrap_plastics"] = 5,
	["j_scrap_elastic"] = 2,
	["j_scrap_metals"] = 30
}
RECIPE.result = {
	["armor_pauldrons"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_wood"
RECIPE.name = "Drifter-Wood"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"
RECIPE.desc = "The simplest armor that man can come up with. Dried scraps of wood are cut and strapped together to provide some protection against slashes from light blades, light stabs, and lower velocity ammunition.\nBlunt strikes, axe swings, thrusts into a grain, and larger calibers may cause the armor to splinter, rendering that panel useless until repaired."
 
RECIPE.items = {
	["j_scrap_rubber"] = 4,
	["j_scrap_wood"] = 20,
	["j_scrap_cloth"] = 8,
	["j_scrap_elastic"] = 1
}
RECIPE.result = {
	["armor_wood"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_armor_sapper"
RECIPE.name = "Sapper's Friend"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebeloverwatch.mdl"
RECIPE.desc = "A modern-ish take on the medieval cuirass, this 2.6MM thick steel breastplate clocks in at just under 8 pounds.\nAt a range of 100 meters, the plate can easily stop any pistol caliber munitions fired at it and may even stop a rifle-caliber cartridge.\nUnfortunately, the substantial protection offered comes at the cost of limited mobility and the retention of vulnerabilities on the backside. Most importantly however, it protects your crotch."
 
RECIPE.items = {
	["j_scrap_metals"] = 30,
	["j_scrap_rubber"] = 4,
	["j_scrap_cloth"] = 10,
	["j_scrap_screws"] = 4,
	["j_car_door"] = 1
}
RECIPE.result = {
	["armor_sapper"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_shield_wood"
RECIPE.name = "Makeshift Shield (Wood)"
RECIPE.category = "Shields"
RECIPE.model = "models/cloud/glassholdshield.mdl"
RECIPE.desc = "A large wooden shield."
 
RECIPE.items = {
	["j_scrap_wood"] = 20
}
RECIPE.result = {
	["shield_wood"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_shield_metal"
RECIPE.name = "Makeshift Shield (Scrap Metal)"
RECIPE.category = "Shields"
RECIPE.model = "models/cloud/glassholdshield.mdl"
RECIPE.desc = "A large metal shield."
 
RECIPE.items = {
	["j_scrap_metals"] = 20
}
RECIPE.result = {
	["shield_metal"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_shield_ballistic"
RECIPE.name = "Ballistic Shield"
RECIPE.category = "Shields"
RECIPE.model = "models/cloud/ballisticshield_mod.mdl"
RECIPE.desc = "A large metal shield."
 
RECIPE.items = {
	["j_scrap_plastics"] = 25,
	["j_scrap_rubber"] = 10,
	["j_scrap_chems"] = 10,
	["j_scrap_steel"] = 5,
	["cube_chip"] = 15,
}
RECIPE.result = {
	["shield_ballistic"] = 1
}
RECIPES:Register( RECIPE )