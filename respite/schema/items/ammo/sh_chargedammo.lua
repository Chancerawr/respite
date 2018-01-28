--[[
    NutScript is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    NutScript is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with NutScript.  If not, see <http://www.gnu.org/licenses/>.
--]]

ITEM.name = "Charged Battery"
ITEM.model = "models/items/battery.mdl"
ITEM.ammo = "battery" // type of the ammo
ITEM.ammoAmount = 50 // amount of the ammo
ITEM.desc = "A single, seemingly enhanced battery."
ITEM.category = "Ammunition"
ITEM.flag = "v"
ITEM.price = 0
ITEM.uniqueID = "ammo_battery"
ITEM.material = "phoenix_storms/wire/pcb_blue"

ITEM.iconCam = {
	pos = Vector(200, 0, 5),
	ang = Angle(180, -0, 180),
	fov = 3.75,
}

local function onUse(item)
	if(!item.player:getChar():getInv():add("j_battery_dead")) then
		nut.item.spawn("j_battery_dead", item.player:getItemDropPos())
	end
end

ITEM:hook("use", onUse)

ITEM.functions.use = {
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(item.ammoAmount, item.ammo)
		item.player:EmitSound("npc/scanner/cbot_discharge1.wav", 110)
		
		return true
	end,
	onCanRun = function(item)
		local player = item.player or item:getOwner()
		
		if (player:GetAmmoCount(item.ammo) >= item.ammoAmount * 2) then
			return false
		end
	end
}