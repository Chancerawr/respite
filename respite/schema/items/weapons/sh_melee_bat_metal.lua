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

ITEM.name = "Metal Bat"
ITEM.desc = "A bat made out of metal."
ITEM.model = "models/warz/melee/baseballbat.mdl"
ITEM.material = "models/props_combine/metal_combinebridge001"
ITEM.class = "hl2_m_bat_metal"
ITEM.uniqueID = "hl2_m_bat_metal"
ITEM.weaponCategory = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.data = { scrapamount = 3}
ITEM.salvItem = "j_scrap_metals"

ITEM.iconCam = {
	pos = Vector(-200, 0, 5),
	ang = Angle(0, -0, 90),
	fov = 8.5,
}
