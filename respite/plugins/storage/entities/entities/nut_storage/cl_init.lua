include("shared.lua")

ENT.DrawEntityInfo = true

local COLOR_LOCKED = Color(242, 38, 19)
local COLOR_UNLOCKED = Color(135, 211, 124)
local toScreen = FindMetaTable("Vector").ToScreen
local colorAlpha = ColorAlpha
local drawText = nut.util.drawText
local configGet = nut.config.get

function ENT:onDrawEntityInfo(alpha)
	local locked = self.getNetVar(self, "locked", false)
	local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
	local x, y = position.x, position.y

	-- TODO: refactor this
	y = y - 20
	local tx, ty = nut.util.drawText(locked and "P" or "Q", x, y, colorAlpha(locked and COLOR_LOCKED or COLOR_UNLOCKED, alpha), 1, 1, "nutIconsMedium", alpha * 0.65)
	y = y + ty*.9

	local def = self:getStorageInfo()
	if (def) then
		local name = self:getNetVar("name") or L(def.name) or "Storage"
	
		local tx, ty = drawText(name, x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 0.65)
		y = y + ty + 1

		local desc = self:getNetVar("desc") or def.desc
		if (desc) then
			drawText(desc, x, y, colorAlpha(color_white, alpha), 1, 1, nil, alpha * 0.65)
		end
	end
end
