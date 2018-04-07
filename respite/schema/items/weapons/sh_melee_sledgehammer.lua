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

ITEM.name = "Sledgehammer"
ITEM.desc = "A large hammer usually used to distribute force over a wide area."
ITEM.model = "models/props_debris/wood_board02a.mdl"
ITEM.class = "hl2_m_sledgehammer"
ITEM.uniqueID = "hl2_m_sledgehammer"
ITEM.weaponCategory = "melee"
ITEM.width = 4
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.data = { scrapamount = 2 }

ITEM.salvItem = {
	["j_scrap_concrete"] = 2,
	["j_scrap_wood"] = 4
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 19,
}