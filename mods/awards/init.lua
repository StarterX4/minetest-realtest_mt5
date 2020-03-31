--	AWARDS
--	   by Rubenwardy, CC-BY-SA
-------------------------------------------------------
-- this is the init file for the award mod
-------------------------------------------------------

dofile(minetest.get_modpath("awards").."/api.lua")

-- Light it up
awards.register_achievement("award_firstlight",{
	title = "First Light",
	description = "You have placed a torch",
	icon = "awards_novicebuilder.png",
	trigger={
		type="place",
		node="default:torch",
		target=1,
	},
})
awards.register_achievement("award_lightitup",{
	title = "Light It Up",
	description = "You have placed 100 torches",
	icon = "awards_novicebuilder.png",
	trigger={
		type="place",
		node="default:torch",
		target=100,
	},
})
awards.register_achievement("award_betterthantorch",{
	title = "Better Than Torch",
	description = "You have placed a streetlight",
	icon = minetest.inventorycube(""),
	trigger={
		type="place",
		node="light:streetlight",
		target=1,
	},
})

-- Lumber Jack
awards.register_achievement("award_lumberjack_ash",{
	title = "Ash Lumber Jack",
	description = "You have mined an ash log!",
	icon = "trees_ash_log.png",
	trigger={
		type="dig",
		node="trees:ash_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_aspen",{
	title = "Aspen Lumber Jack",
	description = "You have mined an aspen log!",
	icon = "trees_aspen_log.png",
	trigger={
		type="dig",
		node="trees:aspen_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_birch",{
	title = "Birch Lumber Jack",
	description = "You have mined a birch log!",
	icon = "trees_birch_log.png",
	trigger={
		type="dig",
		node="trees:birch_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_maple",{
	title = "Maple Lumber Jack",
	description = "You have mined a maple log!",
	icon = "trees_maple_log.png",
	trigger={
		type="dig",
		node="trees:maple_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_chestnut",{
	title = "Chestnut Lumber Jack",
	description = "You have mined a chestnut log!",
	icon = "trees_chestnut_log.png",
	trigger={
		type="dig",
		node="trees:chestnut_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_pine",{
	title = "Pine Lumber Jack",
	description = "You have mined a pine log!",
	icon = "trees_pine_log.png",
	trigger={
		type="dig",
		node="trees:pine_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_spruce",{
	title = "Spruce Lumber Jack",
	icon = "trees_spruce_log.png",
	description = "You have mined a spruce log!",
	trigger={
		type="dig",
		node="trees:spruce_log",
		target=1,
	},
})

-- Placed a stone anvil
awards.register_achievement("award_anvil_stone",{
	title = "Smithery",
	description = "Place a Stone Anvil",
	icon = "awards_anvil.png",
	background = "bg_default.png",
	trigger={
		type="place",
		node="anvil:anvil_stone",
		target=1,
	},
})
awards.register_achievement("award_anvil_dstone",{
	title = "Desert Smithery",
	description = "Place a Desert Stone Anvil",
	icon = "awards_desert_anvil.png",
	background = "bg_default.png",
	trigger={
		type="place",
		node="anvil:anvil_desert_stone",
		target=1,
	},
})

-- Just entered the mine
awards.register_achievement("award_mine1",{
	title = "Entering the mine",
	description = "You have dug 10 stone",
	icon = "awards_miniminer.png",
	background = "bg_mining.png",
	trigger={
		type="dig",
		node="default:stone",
		target=10,
	},
})

-- Mini Miner
awards.register_achievement("award_mine2",{
	title = "Mini Miner",
	description = "You have dug 100 stone",
	icon = "awards_miniminer.png",
	background = "bg_mining.png",
	trigger={
		type="dig",
		node="default:stone",
		target=100,
	},
})

-- Hardened Miner
awards.register_achievement("award_mine3",{
	title = "Hardened Miner",
	description = "You have dug 1000 stone",
	icon = "awards_miniminer.png",
	background = "bg_mining.png",
	trigger={
		type="dig",
		node="default:stone",
		target=1000,
	},
})

-- Master Miner
awards.register_achievement("award_mine4",{
	title = "Master Miner",
	description = "You have dug 10000 stone",
	icon = "awards_miniminer.png",
	background = "bg_mining.png",
	trigger={
		type="dig",
		node="default:stone",
		target=10000,
	},
})

-- First Death
awards.register_achievement("award_death1",{
	title = "First Death",
	description = "You died. Oh well, it does not matter, you have more lives than a cat",
	icon = "awards_death.png",
	trigger={
		type="death",
		target=1,
	},
})

-- Spike Placement
awards.register_achievement("award_spike_ash",{
	title = "Spiky Ash!",
	icon = "trees_ash_planks.png",
	description = "You placed ash spikes!",
	trigger={
		type="place",
		node="spikes:spike_ash",
		target=1,
	},
})
awards.register_achievement("award_spike_aspen",{
	title = "Spiky Aspen!",
	icon = "trees_aspen_planks.png",
	description = "You placed aspen spikes!",
	trigger={
		type="place",
		node="spikes:spike_aspen",
		target=1,
	},
})
awards.register_achievement("award_spike_birch",{
	title = "Spiky Birch!",
	description = "You placed birch spikes!",
	icon = "trees_birch_planks.png",
	trigger={
		type="place",
		node="spikes:spike_birch",
		target=1,
	},
})
awards.register_achievement("award_spike_maple",{
	title = "Spiky Maple!",
	description = "You placed maple spikes!",
	icon = "trees_maple_planks.png",
	trigger={
		type="place",
		node="spikes:spike_maple",
		target=1,
	},
})
awards.register_achievement("award_spike_chestnut",{
	title = "Spiky Chestnut!",
	icon = "trees_chestnut_planks.png",
	description = "You placed chestnut spikes!",
	trigger={
		type="place",
		node="spikes:spike_chestnut",
		target=1,
	},
})
awards.register_achievement("award_spike_pine",{
	title = "Spiky Pine!",
	icon = "trees_pine_planks.png",
	description = "You placed pine spikes!",
	trigger={
		type="place",
		node="spikes:spike_pine",
		target=1,
	},
})
awards.register_achievement("award_spike_spruce",{
	title = "Spiky Spruce!",
	icon = "trees_spruce_planks.png",
	description = "You placed spruce spikes!",
	trigger={
		type="place",
		node="spikes:spike_spruce",
		target=1,
	},
})

--Ants
awards.register_achievement("award_ants",{
	title = "ANTS!",
	description = "You dug an anthill",
	icon = "farming:anthill.png",
	trigger={
		type="dig",
		node="farming:ant_hill",
		target=1,
	},
})
