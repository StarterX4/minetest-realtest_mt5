spikes = {}

spikes.intllib_modpath = minetest.get_modpath("intllib")

if minetest.get_modpath("unified_inventory") or not minetest.setting_getbool("creative_mode") then
	spikes.expect_infinite_stacks = false
else
	spikes.expect_infinite_stacks = true
end

spikes.modpath = minetest.get_modpath("spikes")

-- protection wrapper for 6d stuff

function spikes.protect_and_rotate(itemstack, placer, pointed_thing)
	if not spikes.node_is_owned(pointed_thing.under, placer) 
	   and not spikes.node_is_owned(pointed_thing.above, placer) then
		minetest.rotate_and_place(itemstack, placer, pointed_thing,
			spikes.expect_infinite_stacks)
	end
	return itemstack
end

-- other components

dofile(spikes.modpath.."/ownership.lua")

for i, tree_name in ipairs(realtest.registered_trees_list) do
    local tree = realtest.registered_trees[tree_name]

    local texture_plank = "trees_"..tree.name:remove_modname_prefix().."_planks.png"
    local texture_top = texture_plank.."^spikes_dark_top.png"
    local texture_side = texture_plank.."^spikes_dark.png"
    local texture_bottom = texture_plank

    local spikes = {
        description = tree.description.." Spike",
        drawtype = "nodebox",
	    node_box = {
	        type = "fixed",
		    fixed = {
			    { -4/16, -8/16, -4/16,  -3/16,  -2/16,  -3/16 },
			    { 3/16, -8/16, -4/16,  4/16,  -2/16,  -3/16 },
			    { -4/16, -8/16, 3/16,  -3/16,  -2/16,  4/16 },
			    { 3/16, -8/16, 3/16,  4/16,  -2/16,  4/16 },
			    { -8/16, -8/16, -8/16,  8/16,  -7/16,  8/16 },
		    },
	    },
        tiles = {texture_top, texture_bottom, texture_side},
        drop = "spikes:spike_"..tree.name:remove_modname_prefix(),
        paramtype = "light",
        paramtype2 = "facedir",
        sunlight_propagates = false,
        groups = {oddly_breakable_by_hand=2, material=i},
        sounds = default.node_sound_wood_defaults(),
	    walkable = false,
	    damage_per_second = 10,
	    fall_damage_add_percent = 200,
	    on_place = spikes.protect_and_rotate
    }
    
    minetest.register_node("spikes:spike_"..tree.name:remove_modname_prefix(), spikes)
    
    minetest.register_craft({
        output = "spikes:spike_"..tree.name:remove_modname_prefix().." 2",
        recipe = {
            {tree.name.."_stick",tree.name.."_stick",tree.name.."_stick"},
            {tree.name.."_planks_slab",tree.name.."_planks_slab",tree.name.."_planks_slab"},
        }
    })
end
