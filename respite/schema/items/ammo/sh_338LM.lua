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

ITEM.name = ".338 LM Ammo"
ITEM.model = "models/items/sniper_round_box.mdl"
ITEM.material = "models/props_canal/metalwall005b"
ITEM.ammo = "338" // type of the ammo
ITEM.ammoAmount = 12 // amount of the ammo
ITEM.desc = "A box that contains %s .338 LM bullets."
ITEM.price = 10
ITEM.category = "Ammunition"
ITEM.flag = "v"
ITEM.price = 0
ITEM.uniqueID = "ammo_338"

ITEM.iconCam = {
	pos = Vector(-200, 0, 3),
	ang = Angle(0, -0, 0),
	fov = 3,
}