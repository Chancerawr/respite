local PLUGIN = PLUGIN

PLUGIN.name = "Noticeboard"
PLUGIN.author = "Vex"
PLUGIN.desc = "A super fancy notice board, for... Notices."

if (SERVER) then
	function PLUGIN:SaveData()
		local data = {}
		for k, v in ipairs(ents.FindByClass("nut_noticeboard")) do
			data[#data + 1] = {v:GetPos(), v:GetAngles()}
		end;
		self:setData(data)
	end
	
	function PLUGIN:LoadData()
		local data = self:getData()
		if (data) then
			for k, v in ipairs(data) do
				local ent = ents.Create("nut_noticeboard")
				ent:SetPos(v[1])
				ent:SetAngles(v[2])
				ent:Spawn()
				ent:SetSolid(SOLID_VPHYSICS)
				ent:PhysicsInit(SOLID_VPHYSICS)
				
				local physObject = ent:GetPhysicsObject()

				if (physObject) then
					physObject:EnableMotion()
				end
			end;
		end;
	end;

	netstream.Hook("noticeUpdateEntry", function(client, index, txt, id, tag)
		local notices = nut.data.get("noticeBoardNotes") or {}
		
		if (!notices[index]) then
			table.insert(notices, {owner = id, label = tag, text = txt})
		else
			notices[index]["text"] = txt
		end;
		
		nut.data.set("noticeBoardNotes", notices)
	end)
	
	netstream.Hook("noticeTakePaper", function(client)
		local inv = client:getChar():getInv()
		local items = inv:getItems()
		
		for _, v in pairs(items) do
			if (v.uniqueID == "paper") then
				v:remove()
				return
			end;
		end;
	end)
	
	netstream.Hook("noticeRemoveEntry", function(client, index)
		local notices = nut.data.get("noticeBoardNotes") or {}
		
		table.remove(notices, index)
		
		nut.data.set("noticeBoardNotes", notices)
	end)
	
	function PLUGIN:openNoticeBoard(client)
		local notices = nut.data.get("noticeBoardNotes") or {}
		PrintTable(notices)
		
		netstream.Start(client, "openNoticeUI", notices)
	end;
else
	netstream.Hook("openNoticeUI", function(notices)
		vgui.Create("noticeBoard"):populate(notices)
	end)
end;

--[[nut.command.add("noticeboard", {
	onRun = function(client, arguments)
		PLUGIN:openNoticeBoard(client)
	end
})]]--