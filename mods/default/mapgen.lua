-- minetest/default/mapgen.lua

--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_water_source", "default:water_source")
minetest.register_alias("mapgen_river_water_source", "default:water_source")
minetest.register_alias("mapgen_dirt", "default:dirt")
minetest.register_alias("mapgen_sand", "default:sand")
minetest.register_alias("mapgen_gravel", "default:gravel")
minetest.register_alias("mapgen_lava_source", "default:lava_source")
minetest.register_alias("mapgen_dirt_with_grass", "default:dirt_with_grass")
minetest.register_alias("mapgen_desert_sand", "default:desert_sand")
minetest.register_alias("mapgen_desert_stone", "default:desert_stone")
minetest.register_alias("mapgen_dirt_with_snow", "default:dirt_with_grass")
minetest.register_alias("mapgen_snowblock", "default:dirt_with_grass")
minetest.register_alias("mapgen_snow", "air")
minetest.register_alias("mapgen_ice", "default:water_source")

minetest.register_alias("mapgen_cobble", "default:stone")
minetest.register_alias("mapgen_mossycobble", "default:stone")
minetest.register_alias("mapgen_stair_cobble", "default:stone_stair")
minetest.register_alias("mapgen_stair_desert_stone", "default:desert_stone_stair")

minetest.register_alias("mapgen_tree", "air")
minetest.register_alias("mapgen_leaves", "air")
minetest.register_alias("mapgen_apple", "air")
minetest.register_alias("mapgen_jungletree", "air")
minetest.register_alias("mapgen_jungleleaves", "air")
minetest.register_alias("mapgen_junglegrass", "air")
minetest.register_alias("mapgen_pine_tree", "air")
minetest.register_alias("mapgen_pine_needles", "air")

local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name ~= "singlenode" then
	minetest.set_mapgen_setting("mg_name", "v6")
	minetest.set_mapgen_setting("mg_flags", "nodungeons,caves,decorations,nobiomes,light")
	minetest.set_mapgen_setting("mgv6_spflags", "mudflow,biomeblend,nosnowbiomes,notrees,nojungles,noflat")
end

-- Register biomes (Experimental! We don't officially support non-v6 mapgens yet.)
if mg_name ~= "v6" then
	minetest.register_biome({
		name = "Temperate",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		node_riverbed = "default:gravel",
		y_min = 3,
		heat_point = 50,
		humidity_point = 50,
	})
	minetest.register_biome({
		name = "Desert",
		node_top = "default:desert_sand",
		depth_top = 1,
		node_filler = "default:desert_sand",
		depth_filler = 2,
		node_stone = "default:desert_stone",
		node_riverbed = "default:sand",
		node_dungeon = "default:desert_stone",
		node_dungeon_stair = "default:desert_stone_stair",
		y_min = 3,
		heat_point = 80,
		humidity_point = 50,
	})
	minetest.register_biome({
		name = "Temperate Shore",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:gravel",
		y_max = 2,
		y_min = 1,
		heat_point = 50,
		humidity_point = 50,
	})
	minetest.register_biome({
		name = "Desert Beach",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_riverbed = "default:sand",
		y_max = 2,
		y_min = 1,
		heat_point = 80,
		humidity_point = 50,
	})
	minetest.register_biome({
		name = "Dirt Ocean",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		node_riverbed = "default:dirt",
		y_max = 0,
		heat_point = 50,
		humidity_point = 50,
	})
	minetest.register_biome({
		name = "Sand Ocean",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_riverbed = "default:sand",
		y_max = 0,
		heat_point = 50,
		humidity_point = 95,
	})
end

function default.make_papyrus(pos, size)
	for y=0,size-1 do
		local p = {x=pos.x, y=pos.y+y, z=pos.z}
		minetest.set_node(p, {name="default:papyrus"})
	end
end

function default.make_cactus(pos, size)
	for y=0,size-1 do
		local p = {x=pos.x, y=pos.y+y, z=pos.z}
		minetest.set_node(p, {name="default:cactus"})
	end
end

local water_level = tonumber(minetest.settings:get("water_level")) or 1

minetest.register_on_generated(function(minp, maxp, seed)
	if maxp.y >= 2 and minp.y <= 0 then
		-- Generate papyrus
		local perlin1 = minetest.get_perlin(354, 3, 0.7, 100)
		-- Assume X and Z lengths are equal
		local divlen = 8
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx=0,divs-1 do
		for divz=0,divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine papyrus amount from perlin noise
			local papyrus_amount = math.floor(perlin1:get_2d({x=x0, y=z0}) * 45 - 20)
			-- Find random positions for papyrus based on this random
			local pr = PseudoRandom(seed+1)
			for i=0,papyrus_amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				if minetest.get_node({x=x,y=water_level,z=z}).name == "default:dirt_with_grass" and
						minetest.find_node_near({x=x,y=water_level,z=z}, 1, "default:water_source") then
					default.make_papyrus({x=x,y=water_level+1,z=z}, pr:next(2, 4))
				end
			end
		end
		end
		-- Generate cactuses
		local perlin1 = minetest.get_perlin(230, 3, 0.6, 100)
		-- Assume X and Z lengths are equal
		local divlen = 16
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx=0,divs-1 do
		for divz=0,divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine cactus amount from perlin noise
			local cactus_amount = math.floor(perlin1:get_2d({x=x0, y=z0}) * 6 - 3)
			-- Find random positions for cactus based on this random
			local pr = PseudoRandom(seed+1)
			for i=0,cactus_amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				-- Find ground level (0...15)
				local ground_y = nil
				for y=30,0,-1 do
					if minetest.get_node({x=x,y=y,z=z}).name ~= "air" then
						ground_y = y
						break
					end
				end
				-- If desert sand, make cactus
				if ground_y and minetest.get_node({x=x,y=ground_y,z=z}).name == "default:desert_sand" then
					default.make_cactus({x=x,y=ground_y+1,z=z}, pr:next(3, 4))
				end
			end
		end
		end
		-- Generate cobbles
		local perlin1 = minetest.get_perlin(200, 3, 0.6, 100)
		-- Assume X and Z lengths are equal
		local divlen = 16
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx=0,divs-1 do
		for divz=0,divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			local cobbles_amount = math.floor(perlin1:get_2d({x=x0, y=z0}) * 5 + 0)
			local pr = PseudoRandom(seed+1)
			for i=0,cobbles_amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				-- Find ground level (0...15)
				local ground_y = nil
				for y=30,0,-1 do
					if minetest.get_node({x=x,y=y,z=z}).name ~= "air" then
						ground_y = y
						break
					end
				end
				if ground_y and minetest.get_node({x=x,y=ground_y,z=z}).name == "default:dirt_with_grass" then
					minetest.add_node({x=x,y=ground_y+1,z=z}, {name = "default:cobble_node"})
				end
			end
		end
		end
		-- Generate dry shrubs
		local perlin1 = minetest.get_perlin(329, 3, 0.6, 100)
		-- Assume X and Z lengths are equal
		local divlen = 16
		local divs = (maxp.x-minp.x)/divlen+1;
		for divx=0,divs-1 do
		for divz=0,divs-1 do
			local x0 = minp.x + math.floor((divx+0)*divlen)
			local z0 = minp.z + math.floor((divz+0)*divlen)
			local x1 = minp.x + math.floor((divx+1)*divlen)
			local z1 = minp.z + math.floor((divz+1)*divlen)
			-- Determine amount from perlin noise
			local cactus_amount = math.floor(perlin1:get_2d({x=x0, y=z0}) * 5 + 0)
			-- Find random positions based on this random
			local pr = PseudoRandom(seed+1)
			for i=0,cactus_amount do
				local x = pr:next(x0, x1)
				local z = pr:next(z0, z1)
				-- Find ground level (0...15)
				local ground_y = nil
				for y=30,0,-1 do
					if minetest.get_node({x=x,y=y,z=z}).name ~= "air" then
						ground_y = y
						break
					end
				end
				-- If desert sand, make cactus
				if ground_y and
						minetest.get_node({x=x,y=ground_y,z=z}).name == "default:desert_sand" and
						minetest.get_node({x=x,y=ground_y+1,z=z}).name == "air" then
					minetest.set_node({x=x,y=ground_y+1,z=z}, {name="default:dry_shrub"})
				end
			end
		end
		end
	end
end)

