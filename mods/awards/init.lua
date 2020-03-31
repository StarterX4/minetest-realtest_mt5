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
	icon = "novicebuilder.png",
	trigger={
		type="place",
		node="default:torch",
		target=1,
	},
})
awards.register_achievement("award_lightitup",{
	title = "Light It Up",
	description = "You have placed 100 torches",
	icon = "novicebuilder.png",
	trigger={
		type="place",
		node="default:torch",
		target=100,
	},
})
awards.register_achievement("award_betterthantorch",{
	title = "Better Than Torch",
	description = "You have placed a streetlight",
	icon = "novicebuilder.png",
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
	trigger={
		type="dig",
		node="trees:ash_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_aspen",{
	title = "Aspen Lumber Jack",
	description = "You have mined an aspen log!",
	trigger={
		type="dig",
		node="trees:aspen_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_birch",{
	title = "Birch Lumber Jack",
	description = "You have mined a birch log!",
	trigger={
		type="dig",
		node="trees:birch_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_maple",{
	title = "Maple Lumber Jack",
	description = "You have mined a maple log!",
	trigger={
		type="dig",
		node="trees:maple_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_chestnut",{
	title = "Chestnut Lumber Jack",
	description = "You have mined a chestnut log!",
	trigger={
		type="dig",
		node="trees:chestnut_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_pine",{
	title = "Pine Lumber Jack",
	description = "You have mined a pine log!",
	trigger={
		type="dig",
		node="trees:pine_log",
		target=1,
	},
})
awards.register_achievement("award_lumberjack_spruce",{
	title = "Spruce Lumber Jack",
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
	icon = "anvil.png",
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
	icon = "anvil.png",
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
	icon = "miniminer.png",
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
	icon = "miniminer.png",
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
	icon = "miniminer.png",
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
	icon = "miniminer.png",
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
	trigger={
		type="death",
		target=1,
	},
})

-- Spike Placement
awards.register_achievement("award_spike_ash",{
	title = "Spiky Ash!",
	description = "You placed ash spikes!",
	trigger={
		type="place",
		node="spikes:spike_ash",
		target=1,
	},
})
awards.register_achievement("award_spike_aspen",{
	title = "Spiky Aspen!",
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
	trigger={
		type="place",
		node="spikes:spike_birch",
		target=1,
	},
})
awards.register_achievement("award_spike_maple",{
	title = "Spiky Maple!",
	description = "You placed maple spikes!",
	trigger={
		type="place",
		node="spikes:spike_maple",
		target=1,
	},
})
awards.register_achievement("award_spike_chestnut",{
	title = "Spiky Chestnut!",
	description = "You placed chestnut spikes!",
	trigger={
		type="place",
		node="spikes:spike_chestnut",
		target=1,
	},
})
awards.register_achievement("award_spike_pine",{
	title = "Spiky Pine!",
	description = "You placed pine spikes!",
	trigger={
		type="place",
		node="spikes:spike_pine",
		target=1,
	},
})
awards.register_achievement("award_spike_spruce",{
	title = "Spiky Spruce!",
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
	trigger={
		type="dig",
		node="farming:ant_hill",
		target=1,
	},
})
