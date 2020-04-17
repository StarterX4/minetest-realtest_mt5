--
--Kill/Heal Yourself (requires server priv for heal)
--

minetest.register_chatcommand("suicide", {
	description = "Commit suicide",
	privs = {},
	func = function(name, param, player)
		if minetest.settings:get_bool("enable_damage", true) == false then
			return false, "Can't commit suicide, damage is disabled!"
		end
		minetest.get_player_by_name(name):set_hp(0);
		return true, "You committed suicide."
	end,
})

minetest.register_chatcommand("heal", {
	description = "Completely heal yourself",
	privs = {server=true},
	func = function(name, param, player)
		if minetest.settings:get_bool("enable_damage", true) == false then
			return false, "Can't heal yourself, damage is disabled!"
		end
		minetest.get_player_by_name(name):set_hp(20);
		return true, "You have been healed."
	end,
})
