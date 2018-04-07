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

ITEM.name = "Makeshift Spear"
ITEM.desc = "A chunk of wood with a sharp piece of metal on the end."
ITEM.model = "models/props_c17/signpole001.mdl"
ITEM.material = "models/props/cs_militia/roofbeams03"
ITEM.class = "hl2_m_makeshift_spear"
ITEM.uniqueID = "hl2_m_makeshift_spear"
ITEM.weaponCategory = "melee"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.data = { scrapamount = 7 }

ITEM.salvItem = {
	["j_scrap_metals"] = 3,
	["j_scrap_wood"] = 4
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 54),
	ang = Angle(0, -0, 90),
	fov = 32,
}
