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

ITEM.name = "Generic Ammo"
ITEM.model = "models/items/boxsrounds.mdl"
ITEM.ammo = "slam" // type of the ammo
ITEM.ammoAmount = 1 // amount of the ammo
ITEM.desc = "A container filled with ammunition."
ITEM.category = "Ammunition"
ITEM.flag = "v"
ITEM.price = 0
ITEM.uniqueID = "ammo_generic"
ITEM.material = "models/gibs/metalgibs/metal_gibs"
ITEM.data = {am = "ammo_pistol", amt = 10}

ITEM.iconCam = {
	pos = Vector(-200, 0, 5),
	ang = Angle(0, -0, 0),
	fov = 6.5,
}

ITEM.functions.use = {
	name = "Load",
	tip = "useTip",
	icon = "icon16/add.png",
	onRun = function(item)
		item.player:GiveAmmo(item:getData("amt"), tostring(item:getData("am")))
		item.player:EmitSound("items/ammo_pickup.wav", 110)
		
		return true
	end,
	onCanRun = function(item)
		local player = item.player
		
		if (player:GetAmmoCount(tostring(item:getData("am"))) >= 30) then
			return false
		end
	end
}

function ITEM:getDesc()
	local desc = Format(self.desc, self.ammoAmount)
	
	if(self:getData("amt") != nil) then
		desc = desc .. "\n" .. self:getData("amt") .. " ammo."
	end		
	
	return Format(desc)
end

function ITEM:getName()
	local name = self.name
	
	if(self:getData("customName") != nil) then
		name = self:getData("customName")
	end

	return Format(name)
end

if (CLIENT) then
	function ITEM:paintOver(item, w, h)
		if(item:getData("amt")) then
			draw.SimpleText(item:getData("amt"), "DermaDefault", w , h - 5, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, color_black)
		end
	end
end