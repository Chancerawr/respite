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

ITEM.name = "CP-R06"
ITEM.desc = "Classy professional looking scrap pistol. Boasts decent controllability for damage although lacking in magazine size. This one has a suppressor.\nThis weapon utilizes .40 S&W rounds."
ITEM.model = "models/weapons/tfa_w_hk45c.mdl"
ITEM.material = "models/props_wasteland/quarryobjects01"
ITEM.class = "tfa_cpr06"
ITEM.uniqueID = "tfa_cpr06"
ITEM.weaponCategory = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"
ITEM.iconCam = {
	pos = Vector(-200, -5, 1.75),
	ang = Angle(0, -0, 0),
	fov = 4,
}

ITEM.holsterDrawInfo = {
	model = ITEM.model,
	bone = "ValveBiped.Bip01_R_Thigh",
	ang = Angle(270, 90, 180),
	pos = Vector(-2, -1, -5),
}