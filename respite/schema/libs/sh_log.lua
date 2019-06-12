FLAG_NORMAL = 0
FLAG_SUCCESS = 1
FLAG_WARNING = 2
FLAG_DANGER = 3
FLAG_SERVER = 4
FLAG_DEV = 5
FLAG_ORANGE = 6

nut.log = nut.log or {}
nut.log.color = {
	[FLAG_NORMAL] = Color(200, 200, 200),
	[FLAG_SUCCESS] = Color(50, 200, 50),
	[FLAG_WARNING] = Color(255, 255, 0),
	[FLAG_DANGER] = Color(255, 50, 50),
	[FLAG_SERVER] = Color(200, 200, 220),
	[FLAG_DEV] = Color(200, 200, 220),
	[FLAG_ORANGE] = Color(150, 150, 75),
}
local consoleColor = Color(50, 200, 50)

-- TODO: Creating MYSQL/SQLLite Query for the logging.
-- SUGG: Do I have to get Seperated Database? For ChatLog, For EventLog.

if (SERVER) then
	if (!nut.db) then
		include("sv_database.lua")
	end

	function nut.log.loadTables()
		file.CreateDir("nutscript/logs")
	end

	function nut.log.resetTables()
	end

	nut.log.types = nut.log.types or {}
	function nut.log.addType(logType, func)
		nut.log.types[logType] = func
	end

	function nut.log.getString(client, logType, ...)
		local text = nut.log.types[logType]
		
		if (text) then
			if (isfunction(text)) then
				text = text(client, ...)
			end
		else
			text = -1
		end

		return text
	end

	function nut.log.addRaw(logString, flag)	
		nut.log.send(nut.util.getAdmins(), logString, flag)
		
		Msg("[LOG] ", logString .. "\n")
		
		if (!noSave) then
			file.Append("nutscript/logs/"..os.date("%x"):gsub("/", "-")..".txt", "["..os.date("%X").."]\t"..logString.."\r\n")
		end
	end

	function nut.log.add(client, logType, ...)
		local logString = nut.log.getString(client, logType, ...)
		if (logString == -1) then return end
		local flag
		if(logType == "chat") then
			flag = 0
		end
		nut.log.send(nut.util.getAdmins(), logString, flag)
		
		Msg("[LOG] ", logString .. "\n")
		
		if (!noSave) then
			file.Append("nutscript/logs/"..os.date("%x"):gsub("/", "-")..".txt", "["..os.date("%X").."]\t"..logString.."\r\n")
		end
	end

	function nut.log.open(client)
		local logData = {}

		netstream.Hook(client, "nutLogView", logData)
	end

	function nut.log.send(client, logString, flag)
		netstream.Start(client, "nutLogStream", logString, flag)
	end
else
	netstream.Hook("nutLogStream", function(logString, flag)
		MsgC(consoleColor, "[LOG] ", nut.log.color[flag] or color_white, logString .. "\n")
	end)
end