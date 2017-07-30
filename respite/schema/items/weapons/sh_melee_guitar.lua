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
ITEM.iconCam = {
	pos = Vector(0, -1, 200),
	ang = Angle(90, 0, -90),
	fov = 17
}

ITEM.data = { scrapamount = 2 }
ITEM.salvItem = "j_scrap_elecs"

ITEM.functions.Scrap = {
  tip = "Scrap this item",
  icon = "icon16/cross.png",
  onRun = function(item)
    if (item.player:getChar():getInv():findEmptySlot(1, 1) != nil) then
		item.player:getChar():getInv():add(item.salvItem, 1, { Amount = item:getData("scrapamount") })
		item:remove()
		return false 
    else
		item.player:notify("You don't have any room in your inventory!")
		return false 
    end
  end,
  onCanRun = function(item)
	if (item:getOwner() == nil) then
		return item.player:getChar():hasFlags("q") or item.player:getChar():getInv():hasItem("kit_salvager")
	else
		return item:getOwner():getChar():hasFlags("q") or item:getOwner():getChar():getInv():hasItem("kit_salvager")
	end
  end
}