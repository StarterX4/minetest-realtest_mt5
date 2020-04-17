-- simple male/female player textures mod
-- based on player_textures by PilzAdam
-- License:  WTFPL

local worldpath = minetest.get_worldpath()
local textures_config = worldpath.."/player_skins_db.txt"

if io.open(textures_config, "r") ~= nil then
	io.input(textures_config)
	skins_cfg = io.read("*all")
	minetest.log("verbose", dump(skins_cfg))
	mf_skins_table = minetest.deserialize(skins_cfg)
	io.close()
end

if minetest.global_exists("mf_skins_table") then
	mf_skins_table = mf_skins_table
else
	mf_skins_table = {}
end

local save_skins = function()
	minetest.log("verbose", dump(mf_skins_table))
	local file = io.open(textures_config, "w")
		file:write(minetest.serialize(mf_skins_table))
	io.close()
end

minetest.register_on_joinplayer(
	function(player)
		local pn = player:get_player_name()
		local skin_name = "skin_"..pn

		local skin_gender
		if mf_skins_table[skin_name] == "m" then
			skin_gender = { "player_male.png" }
		elseif mf_skins_table[skin_name] == "f" then
			skin_gender = { "player_female.png" }
		elseif mf_skins_table[skin_name] == "nyan" then
			skin_gender = { "player_nyan.png" }
		end
		if not skin_gender then
			local r = math.random(1,2)
			if r == 1 then
				skin_gender = { "player_male.png" }
				mf_skins_table[skin_name] = "m"
			else
				skin_gender = { "player_female.png" }
				mf_skins_table[skin_name] = "f"
			end
			save_skins()
		end

		player:set_properties({
			visual = "mesh",
			visual_size = {x=1, y=1},
			textures = skin_gender
		})

		minetest.log("action", "Skin for "..pn.." was set to "..dump(mf_skins_table[skin_name]))
	end
)

-- commands

minetest.register_chatcommand("skin", {
	params = "<name> <gender>",
	description = "Set a player's skin to either male (m) or female (f).",
	func = function(name, param)
		-- this line borrowed from worldedit
		local _,_, username, gender = param:find("^([^%s]+)%s+(.+)$")
		if not username or not gender then
			return false, "Invalid syntax."
		end
		if minetest.get_player_privs(name).basic_privs  or name==username then
			if username and minetest.player_exists(username) then
				if gender ~= "f" and gender ~= "m" and gender ~= "nyan" then
					-- Pick random skin if invalid
					local r = math.random(1,2)
					if r == 1 then
						gender = "m"
					else
						gender = "f"
					end
				end

				mf_skins_table["skin_"..username] = gender
				minetest.chat_send_player(name, "Set skin for "..username.." to "..gender..".")
				save_skins()
				local skin_gender = { "player_male.png" }
				if gender == "f" then
					skin_gender = { "player_female.png" }
				elseif gender == "nyan" then
					skin_gender = { "player_nyan.png" }
				end
				local player = minetest.get_player_by_name(username)
				player:set_properties({
					visual = "mesh",
					visual_size = {x=1, y=1},
					textures = skin_gender
				})
			else
				return false, "That player does not exist."
			end
		else
			return false, "You are not authorized to run that command."
		end
		return true
	end
})

