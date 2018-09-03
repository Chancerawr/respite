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

ITEM.name = "Nailed Bat"
ITEM.desc = "A bat made out of wood, it has nails in it."
ITEM.model = "models/warz/melee/baseballbat_spike.mdl"
ITEM.class = "hl2_m_batnail"
ITEM.weaponCategory = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.salvItem = {
	["j_scrap_nails"] = 4,
	["j_scrap_wood"] = 3
}

ITEM.iconCam = {
	pos = Vector(0, 200, -7),
	ang = Angle(0, 270, 90),
	fov = 9,
}