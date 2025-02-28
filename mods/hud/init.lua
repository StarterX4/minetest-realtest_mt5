hud = {}

--minetest.after(SAVE_INTERVAL, timer, SAVE_INTERVAL)

local function hide_builtin(player)
	player:hud_set_flags({crosshair = true, hotbar = true, healthbar = true, wielditem = true, breathbar = true})
end


local function costum_hud(player)

 --fancy hotbar
 player:hud_set_hotbar_image("hud_hotbar.png")
 player:hud_set_hotbar_selected_image("hud_hotbar_selected.png")
end

minetest.register_on_joinplayer(function(player)
	-- Disable minimap to revert to 0.4.5 gameplay
	if not minetest.settings:get_bool("creative_mode") then
		player:hud_set_flags({minimap = false, minimap_radar = false})
	end

	minetest.after(0.5, function(player)
		if player and player:is_player() then
			hide_builtin(player)
			costum_hud(player)
		end
	end, player)
end)
