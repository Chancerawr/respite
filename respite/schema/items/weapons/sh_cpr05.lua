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

ITEM.name = "CP-R05"
ITEM.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size.\nThis weapon utilizes .40 S&W rounds."
ITEM.model = "models/weapons/tfa_w_hk45c.mdl"
ITEM.class = "tfa_cpr05"
ITEM.uniqueID = "tfa_cpr05"
ITEM.weaponCategory = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"
ITEM.iconCam = {
	pos = Vector(-200, 5, 1.7000000476837),
	ang = Angle(0, 0, 1),
	fov = 4
}

ITEM.holsterDrawInfo = {
	model = ITEM.model,
	bone = "ValveBiped.Bip01_R_Thigh",
	ang = Angle(270, 90, 180),
	pos = Vector(-2, -1, -5),
}