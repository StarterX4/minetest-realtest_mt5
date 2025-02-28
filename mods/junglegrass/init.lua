-- This file supplies jungle grass for the plantlife modpack
-- Last revision:  2013-01-24

local SPAWN_DELAY = 1000
local SPAWN_CHANCE = 200
local GROW_DELAY = 500
local GROW_CHANCE = 30
local junglegrass_seed_diff = 329

local grasses_list = {
        {"junglegrass:shortest","junglegrass:short" },
        {"junglegrass:short"   ,"junglegrass:medium" },
        {"junglegrass:medium"  ,"default:junglegrass" },
        {"default:junglegrass" , nil}
}

if not minetest.registered_nodes["default:junglegrass"] then 
	minetest.register_node(":default:junglegrass", {
		description = "Jungle Grass",
		drawtype = "plantlike",
		visual_scale = 1.3,
		tiles = {"default_junglegrass.png"},
		inventory_image = "default_junglegrass.png",
		wield_image = "default_junglegrass.png",
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		is_ground_content = true,
		groups = {snappy=3,flammable=2,flora=1,attached_node=1, junglegrass=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
else
	new_junglegrass=plantslib:clone_node("default:junglegrass")
	new_junglegrass.groups.junglegrass = 1
	minetest.register_node(":default:junglegrass", new_junglegrass)
end

minetest.register_node('junglegrass:medium', {
	description = "Jungle Grass (medium height)",
	drawtype = 'plantlike',
	tiles = { 'junglegrass_medium.png' },
	inventory_image = 'junglegrass_medium.png',
	wield_image = 'junglegrass_medium.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3, flammable=2, junglegrass=1, flora=1 },
	sounds = default.node_sound_leaves_defaults(),
	drop = 'default:junglegrass',

	selection_box = {
		type = "fixed",
		fixed = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
	},
	buildable_to = true,
})

minetest.register_node('junglegrass:short', {
	description = "Jungle Grass (short)",
	drawtype = 'plantlike',
	tiles = { 'junglegrass_short.png' },
	inventory_image = 'junglegrass_short.png',
	wield_image = 'junglegrass_short.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3, flammable=2, junglegrass=1, flora=1 },
	sounds = default.node_sound_leaves_defaults(),
	drop = 'default:junglegrass',
	selection_box = {
		type = "fixed",
		fixed = {-0.4, -0.5, -0.4, 0.4, 0.3, 0.4},
	},
	buildable_to = true,
})

minetest.register_node('junglegrass:shortest', {
	description = "Jungle Grass (very short)",
	drawtype = 'plantlike',
	tiles = { 'junglegrass_shortest.png' },
	inventory_image = 'junglegrass_shortest.png',
	wield_image = 'junglegrass_shortest.png',
	sunlight_propagates = true,
	paramtype = 'light',
	walkable = false,
	groups = { snappy = 3, flammable=2, junglegrass=1, flora=1 },
	sounds = default.node_sound_leaves_defaults(),
	drop = 'default:junglegrass',
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.3},
	},
	buildable_to = true,
})

plantslib:spawn_on_surfaces({
	spawn_delay = SPAWN_DELAY,
	spawn_plants = {"junglegrass:shortest"},
	avoid_radius = 4,
	spawn_chance = SPAWN_CHANCE,
	spawn_surfaces = {"default:dirt_with_grass", "default:cactus", "default:papyrus"},
	avoid_nodes = {"group:junglegrass", "default:junglegrass", "default:dry_shrub"},
	seed_diff = junglegrass_seed_diff,
	light_min = 5
})

plantslib:spawn_on_surfaces({
	spawn_delay = SPAWN_DELAY,
	spawn_plants = {"junglegrass:shortest"},
	avoid_radius = 4,
	spawn_chance = SPAWN_CHANCE*2,
	spawn_surfaces = {"default:sand"},
	avoid_nodes = {"group:junglegrass", "default:junglegrass", "default:dry_shrub"},
	seed_diff = junglegrass_seed_diff,
	light_min = 5
})

plantslib:spawn_on_surfaces({
	spawn_delay = SPAWN_DELAY,
	spawn_plants = {"junglegrass:shortest"},
	avoid_radius = 4,
	spawn_chance = SPAWN_CHANCE*5,
	spawn_surfaces = {"default:desert_sand"},
	avoid_nodes = {"group:junglegrass", "default:junglegrass", "default:dry_shrub"},
	seed_diff = junglegrass_seed_diff,
	light_min = 5
})

for i in ipairs(grasses_list) do
	plantslib:grow_plants({
		grow_delay = GROW_DELAY,
		grow_chance = GROW_CHANCE/2,
		grow_plant = grasses_list[i][1],
		grow_result = grasses_list[i][2],
		dry_early_node = "default:desert_sand",
		grow_nodes = {"default:dirt_with_grass", "default:sand", "default:desert_sand"}
	})
end
