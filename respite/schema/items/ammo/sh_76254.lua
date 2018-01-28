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

ITEM.name = "7.62x54mm Ammo"
ITEM.model = "models/items/boxmrounds.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01c"
ITEM.ammo = "76254" // type of the ammo
ITEM.ammoAmount = 45 // amount of the ammo
ITEM.desc = "A box that contains %s 7.62x54mm rounds."
ITEM.category = "Ammunition"
ITEM.flag = "v"
ITEM.price = 0
ITEM.uniqueID = "ammo_76254"

ITEM.iconCam = {
	pos = Vector(-200, 0, 6),
	ang = Angle(0, -0, 0),
	fov = 6.5,
}