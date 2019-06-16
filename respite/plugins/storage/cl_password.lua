function PLUGIN:StorageUnlockPrompt(entity)
	Derma_StringRequest(
		L("storPassWrite"),
		L("storPassWrite"),
		"",
		function(val)
			net.Start("nutStorageUnlock")
				net.WriteString(val)
			net.SendToServer()
		end,
		function(val)
			net.Start("nutStorageUnlock")
				net.WriteString("")
			net.SendToServer()
		end
	)
end
