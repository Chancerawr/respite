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

ITEM.name = ".50 AE Ammo"
ITEM.model = "models/items/357ammo.mdl"
ITEM.material = "models/props_pipes/pipesystem01a_skin2"
ITEM.ammo = "50ae" // type of the ammo
ITEM.ammoAmount = 12 // amount of the ammo
ITEM.desc = "A box that contains %s .50 AE bullets."
ITEM.price = 10
ITEM.category = "Ammunition"
ITEM.flag = "v"
ITEM.price = 0
ITEM.uniqueID = "ammo_50ae"

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 4.25,
}