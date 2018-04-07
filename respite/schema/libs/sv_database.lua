nut.db = nut.db or {}
nut.util.include("nutscript/gamemode/config/sv_database.lua")

function nut.db.updateTable(value, callback, dbTable, condition)
	local query = "UPDATE "..("nut_"..(dbTable or "characters")).." SET "
	local changes = {}

	for k, v in pairs(value) do
		if(k == "_traits") then --this is a dumb thing I did to stop traits from being saved to the mysql.
			continue
		end
		
		changes[#changes + 1] = k.." = "..(k:find("steamID") and v or nut.db.convertDataType(v))
	end

	query = query..table.concat(changes, ", ")..(condition and " WHERE "..condition or "")
	nut.db.query(query, callback)
end
