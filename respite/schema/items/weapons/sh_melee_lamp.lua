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

ITEM.name = "Lamp"
ITEM.desc = "A lamp used for illuminating PAIN."
ITEM.model = "models/props_interiors/Furniture_Lamp01a.mdl"
ITEM.class = "hl2_m_lamp"
ITEM.uniqueID = "hl2_m_lamp"
ITEM.weaponCategory = "melee"
ITEM.width = 4
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.salvItem = {
	["j_scrap_metals"] = 2,
	["j_scrap_cloth"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 20.5,
}