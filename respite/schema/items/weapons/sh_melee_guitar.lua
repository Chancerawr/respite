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

ITEM.name = "Guitar"
ITEM.desc = "A popular musical instrument that makes sound by the playing of its (typically) six strings with the sound being projected either acoustically or through electrical amplification (for an acoustic guitar or an electric guitar, respectively). It is typically played by strumming or plucking the strings with the right hand while fretting the strings with the left hand."
ITEM.model = "models/props_phx/misc/fender.mdl"
ITEM.class = "hl2_m_guitar"
ITEM.uniqueID = "j_guitar"
ITEM.weaponCategory = "melee"
ITEM.width = 3
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.salvItem = {
	["j_scrap_elecs"] = 2,
	["j_scrap_wood"] = 4
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 17,
}