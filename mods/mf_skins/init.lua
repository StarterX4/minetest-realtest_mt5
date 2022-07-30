-- simple player textures mod
-- based on player_textures by PilzAdam
-- License:  MIT License

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

		local skin_id
		if mf_skins_table[skin_name] == "m" then
			skin_id = { "player_marcus.png" }
		elseif mf_skins_table[skin_name] == "f" then
			skin_id = { "player_felicia.png" }
		elseif mf_skins_table[skin_name] == "nyan" then
			skin_id = { "player_nyan.png" }
		end
		local init_skin = false
		if not skin_id then
			local r = math.random(1,2)
			if r == 1 then
				skin_id = { "player_marcus.png" }
				mf_skins_table[skin_name] = "m"
			else
				skin_id = { "player_felicia.png" }
				mf_skins_table[skin_name] = "f"
			end
			minetest.log("action", "[mf_skins] Initial skin for "..pn.." set to \""..tostring(mf_skins_table[skin_name]).."\"")
			init_skin = true
			save_skins()
		end

		player:set_properties({
			visual = "mesh",
			visual_size = {x=1, y=1},
			textures = skin_id
		})

		if not init_skin then
			minetest.log("action", "[mf_skins] Active skin for "..pn..": \""..tostring(mf_skins_table[skin_name]).."\"")
		end
	end
)

-- commands

minetest.register_chatcommand("skin", {
	params = "<player_name> [ Marcus | Felicia ]",
	description = "Set a player's skin to either 'Marcus' or 'Felicia'.",
	func = function(name, param)
		-- this line borrowed from worldedit
		local _,_, username, skinname = param:find("^([^%s]+)%s+(.+)$")
		if not username or not skinname then
			return false
		end
		skinname = string.lower(skinname)
		if skinname == "marcus" then
			skinname = "m"
		elseif skinname == "felicia" then
			skinname = "f"
		end
		if minetest.get_player_privs(name).basic_privs  or name==username then
			if username and minetest.player_exists(username) then
				if skinname == "nyan" then
					-- Nyan skin only for privileged players to prevent abuse
					local privs = minetest.get_player_privs(username)
					if not privs.server then
						skinname = nil
					end
				end
				if skinname ~= "f" and skinname ~= "m" and skinname ~= "nyan" then
					-- Pick random skin if invalid
					local r = math.random(1,2)
					if r == 1 then
						skinname = "m"
					else
						skinname = "f"
					end
				end

				mf_skins_table["skin_"..username] = skinname
				local skinname_out
				if skinname == "m" then
					skinname_out = "Marcus"
				elseif skinname == "f" then
					skinname_out = "Felicia"
				elseif skinname == "nyan" then
					skinname_out = "Nyan Cat"
				end
				minetest.chat_send_player(name, "Set skin for "..username.." to \""..skinname_out.."\".")
				minetest.log("action", "[mf_skins] Skin for "..username.." set to \""..skinname_out.."\".")
				save_skins()
				local skin_id = { "player_marcus.png" }
				if skinname == "f" then
					skin_id = { "player_felicia.png" }
				elseif skinname == "nyan" then
					skin_id = { "player_nyan.png" }
				end
				local player = minetest.get_player_by_name(username)
				player:set_properties({
					visual = "mesh",
					visual_size = {x=1, y=1},
					textures = skin_id
				})
			else
				return false, "That player does not exist."
			end
		else
			return false, "You are not authorized to run this command (required privilege: 'basic_privs')."
		end
		return true
	end
})

