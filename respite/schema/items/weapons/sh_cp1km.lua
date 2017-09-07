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

ITEM.name = "CP-1KM"
ITEM.desc = "Low capacity high calibre pistol with an extended barrel made out of various pieces of scrap. This one has an integral suppressor built into it.\nThis weapon utilizes .45 ACP rounds."
ITEM.model = "models/weapons/tfa_w_dmgf_co1911.mdl"
ITEM.class = "tfa_cp1km"
ITEM.uniqueID = "tfa_cp1km"
ITEM.weaponCategory = "sidearm"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"
ITEM.iconCam = {
	pos = Vector(0, -200, -2.5),
	ang = Angle(0, -270, 5),
	fov = 4
}

ITEM.holsterDrawInfo = {
	model = ITEM.model,
	bone = "ValveBiped.Bip01_R_Thigh",
	ang = Angle(180, 0, -90.22023010254),
	pos = Vector(0, 3.7719268798828, -3),
}