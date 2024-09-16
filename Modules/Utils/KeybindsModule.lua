KeybindsModule = KeybindsModule or BeardLib:ModuleClass("Keybinds", ModuleBase)

function KeybindsModule:Load()
	for _, keybind in ipairs(self._config) do
		if keybind._meta == "keybind" then
			if not keybind.keybind_id and not keybind.id then
				self:Err("Keybind does not contain a definition for keybind_id!")
				return
			end

			keybind.keybind_id = keybind.keybind_id or keybind.id
			local config = table.merge({ run_in_menu = true, run_in_game = true }, keybind)

			if BLT and BLT.Keybinds then
				BLT.Keybinds:register_keybind_json(self._mod, config)
			else
				LuaModManager:AddJsonKeybinding(config, self._mod.ModPath .. "/")
			end
		end
	end
end
