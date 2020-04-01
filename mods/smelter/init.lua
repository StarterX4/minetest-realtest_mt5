smelter={}

local F = minetest.formspec_escape


smelter.smelter_formspec =
	"size[8,7]"..
	"image[3,0;1,1;default_furnace_fire_bg.png]"..
	"list[current_name;fuel;3,1;1,1;]"..
	"list[current_name;src;0,0;2,2;]"..
	"list[current_name;dst;6,0;2,2;]"..
	"list[current_player;main;0,3;8,4;]"..
	"image[4.5,1;1,1;furnace_arrow.png^[transformR90]"..
	"button[0,2;1,1;guide;Guide]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;fuel]"..
	"listring[current_player;main]"..
	"listring[current_name;dst]"

local function get_guide(player, fields)
	if fields and fields.quit then
		return
	end
	local formspec = "size[8,7]"..
	"image[3,0;1,1;default_furnace_fire_bg.png]"..
	"image[4.5,1;1,1;furnace_arrow.png^[transformR90]"..
	"button_exit[7,2;1,1;exit_guide;Exit]"..
	-- fuel
	"box[3,1;0.8,0.9;#BBBBBB]"..
	-- src
	"box[0,0;0.8,0.9;#BBBBBB]"..
	"box[0,1;0.8,0.9;#BBBBBB]"..
	"box[1,0;0.8,0.9;#BBBBBB]"..
	"box[1,1;0.8,0.9;#BBBBBB]"..
	-- dst
	"box[6,0;0.8,0.9;#BBBBBB]"..
	"box[6,1;0.8,0.9;#BBBBBB]"..
	"box[7,0;0.8,0.9;#BBBBBB]"..
	"box[7,1;0.8,0.9;#BBBBBB]"
	local get_desc = function(itemstring)
		return ItemStack(itemstring):get_description()
	end
	if fields then
		local current_craft
		for c=1, #crafter.crafts do
			local craft = crafter.crafts[c]
			local output1 = ItemStack(craft.output):get_name()
			if fields[output1] and craft.type == "smelting" and craft._w <= 2 and craft._h <= 2 then
				current_craft = crafter.crafts[c]
				break
			end
		end
		if current_craft then
			local recipe = current_craft.recipe
			-- src
			for y=1, 2 do
			for x=1, 2 do
			if recipe[y] and recipe[y][x] then
				local fxfy = (x-1) .. "," .. (y-1)
				formspec = formspec .. "item_image["..fxfy..";1,1;"..recipe[y][x].."]"..
					"tooltip["..fxfy..";0.8,0.9;"..F(get_desc(recipe[y][x])).."]"
			end
			end
			end
			-- fuel
			formspec = formspec .. "label[3.05,1.2;Fuel]"
			-- dst
			formspec = formspec .. "item_image[6,0;1,1;"..current_craft.output.."]" ..
				"tooltip[6,0;0.8,0.9;"..F(get_desc(current_craft.output)).."]"
		end
	end

	-- Display all available outputs
	local x, y = 0, 3
	for c=1, #crafter.crafts do
		local craft = crafter.crafts[c]
		if craft.type == "smelting" and craft._w <= 2 and craft._h <= 2 then
			local output = craft.output
			local output1 = ItemStack(craft.output):get_name()
			formspec = formspec .. "item_image_button["..x..","..y..";1,1;"..output..";"..output1..";]"
			x = x + 1
			if x >= 8 then
				x = 0
				y = y + 1
			end
		end
	end
	minetest.show_formspec(player:get_player_name(), "smelter:guide", formspec)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "smelter:guide" then
		get_guide(player, fields)
	end
end)

local function receive_node_fields(pos, formname, fields, player)
	if fields.guide then
		get_guide(player)
	end
end

minetest.register_node("smelter:smelter", {
	description = "Smelter",
	tiles = {"smelter_smelter_top.png", "smelter_smelter_base.png", "smelter_smelter_side.png",
		"smelter_smelter_side.png", "smelter_smelter_side.png", "smelter_smelter_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", smelter.smelter_formspec)
		meta:set_string("infotext", "Smelter")
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 4)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	on_receive_fields = receive_node_fields,
})

minetest.register_node("smelter:smelter_active", {
	description = "Smelter",
	tiles = {"smelter_smelter_top.png", "smelter_smelter_base.png", "smelter_smelter_side.png",
		"smelter_smelter_side.png", "smelter_smelter_side.png", "smelter_smelter_front_active.png"},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "smelter:smelter",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", smelter.smelter_formspec)
		meta:set_string("infotext", "Smelter");
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 4)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
	on_receive_fields = receive_node_fields,
})


minetest.register_abm({
	nodenames = {"smelter:smelter","smelter:smelter_active"},
	interval = 2.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
    -- Init the values
		local meta = minetest.get_meta(pos)
		for i, name in ipairs({
				"fuel_totaltime",
				"fuel_time",
				"src_totaltime",
				"src_time"
		}) do
			if meta:get_string(name) == "" then
				meta:set_float(name, 0.0)
			end
		end

    -- Get the source materials
		local inv = meta:get_inventory()
		local srclist = inv:get_list("src")
		local cooked = nil
		if srclist then
			cooked = crafter.get_craft_result({method = "smelting", width = 2, items = srclist})
      --cooked = default.get_craft_result({method = "cooking", width = 1, items = srclist})
		end

		local was_active = false
    local consume = false
		minetest.log("verbose", "Fuel time: "..dump(meta:get_float("fuel_time")))
		minetest.log("verbose", "Fuel totaltime: "..dump(meta:get_float("fuel_totaltime")))

		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			was_active = true
			meta:set_float("fuel_time", meta:get_float("fuel_time") + 1)
			meta:set_float("src_time", meta:get_float("src_time") + 1)
			if cooked and cooked.item and not cooked.item:is_empty() and meta:get_float("src_time") >= cooked.time then
				-- check if there's room for output in "dst" list
				if inv:room_for_item("dst",cooked.item) then
          consume = true
					-- Put result in "dst" list
					inv:add_item("dst", cooked.item)
					-- take stuff from "src" list
          for i=1,4 do
					  local srcstack = inv:get_stack("src", i)
            if not srcstack:is_empty() then
              minetest.log("verbose", "Removing "..srcstack:get_name())
					    srcstack:take_item(1)
					    inv:set_stack("src", i, srcstack)
            end
          end
				else
					minetest.log("verbose", "Could not insert '"..cooked.item:to_string().."'")
				end
				meta:set_string("src_time", 0)
			end
		end
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			local percent = math.floor(meta:get_float("fuel_time") /
					meta:get_float("fuel_totaltime") * 100)
			meta:set_string("infotext","Smelter active: "..percent.."%")
			hacky_swap_node(pos,"smelter:smelter_active")
			meta:set_string("formspec",
				"size[8,7]"..
				"image[3,0;1,1;default_furnace_fire_bg.png^[lowpart:"..
						(100-percent)..":default_furnace_fire_fg.png]"..
				"list[current_name;fuel;3,1;1,1;]"..
				"list[current_name;src;0,0;2,2;]"..
				"list[current_name;dst;6,0;2,2;]"..
				"list[current_player;main;0,3;8,4;]"..
				"image[4.5,1;1,1;furnace_arrow.png^[transformR90]"..
				"button[0,2;1,1;guide;Guide]"..
				"listring[current_player;main]"..
				"listring[current_name;src]"..
				"listring[current_player;main]"..
				"listring[current_name;fuel]"..
				"listring[current_player;main]"..
				"listring[current_name;dst]")
			return
		end

		local fuel = nil
		local cooked = nil
		local fuellist = inv:get_list("fuel")
		local srclist = inv:get_list("src")
		
		if srclist then
			cooked = crafter.get_craft_result({method = "smelting", width = 2, items = srclist})
		end
		if fuellist then
			fuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
		end

		if fuel and fuel.time <= 0 then
			meta:set_string("infotext","Smelter out of fuel")
			hacky_swap_node(pos,"smelter:smelter")
			meta:set_string("formspec", smelter.smelter_formspec)
			return
		end

		if cooked and cooked.item and cooked.item:is_empty() then
			if was_active then
				meta:set_string("infotext","Smelter is empty")
				hacky_swap_node(pos,"smelter:smelter")
				meta:set_string("formspec", smelter.smelter_formspec)
			end
			return
		end

		if fuel and fuel.time then
			meta:set_string("fuel_totaltime", fuel.time)
			meta:set_string("fuel_time", 0)
			if consume then
			  local stack = inv:get_stack("fuel", 1)
			  stack:take_item()
			  inv:set_stack("fuel", 1, stack)
			end
		end
	end,
})

minetest.register_craft({
	output = 'smelter:smelter',
	recipe = {
		{'default:brick', 'default:brick', 'default:brick'},
		{'default:brick', '', 'default:brick'},
		{'default:stone_slab', 'default:stone_slab', 'default:stone_slab'},
	}
})

