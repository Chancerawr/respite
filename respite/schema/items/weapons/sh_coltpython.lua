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

ITEM.name = "Colt Python"
ITEM.desc = "An expertly crafted revolver, from a time when Colt wasn't riding the government contract gravy train. Use both hands when firing, and god help you if you limp-wrist.\nThis weapon utilizes .357 rounds."
ITEM.model = "models/weapons/tfa_w_colt_python.mdl"
ITEM.onGetDropModel = "models/weapons/tfa_w_remington_1858.mdl"
ITEM.class = "tfa_coltpython"
ITEM.weaponCategory = "sidearm"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Pistols"
ITEM.iconCam = {
	pos = Vector(-200, -7.5, 2),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}

function ITEM:onGetDropModel(self)
	return "models/weapons/tfa_w_remington_1858.mdl"
end