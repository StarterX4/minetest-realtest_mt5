-- Light it up
awards.register_award("award_firstlight",{
	title = "First Light",
	description = "Place a torch",
	icon = "awards_novicebuilder.png^awards_level1.png",
	trigger={
		type="place",
		node="default:torch",
		target=1,
	},
})
awards.register_award("award_lightitup",{
	title = "Light It Up",
	description = "Place 100 torches",
	icon = "awards_novicebuilder.png^awards_level2.png",
	trigger={
		type="place",
		node="default:torch",
		target=100,
	},
})
awards.register_award("award_betterthantorch",{
	title = "Better Than Torch",
	description = "Place a streetlight",
	icon = "light_streetlight.png",
	trigger={
		type="place",
		node="light:streetlight",
		target=1,
	},
})

-- Lumber Jack
awards.register_award("award_lumberjack_ash",{
	title = "Ash Lumber Jack",
	description = "Mine an ash log",
	icon = "trees_ash_log.png",
	trigger={
		type="dig",
		node="trees:ash_log",
		target=1,
	},
})
awards.register_award("award_lumberjack_aspen",{
	title = "Aspen Lumber Jack",
	description = "Mine an aspen log",
	icon = "trees_aspen_log.png",
	trigger={
		type="dig",
		node="trees:aspen_log",
		target=1,
	},
})
awards.register_award("award_lumberjack_birch",{
	title = "Birch Lumber Jack",
	description = "Mine a birch log",
	icon = "trees_birch_log.png",
	trigger={
		type="dig",
		node="trees:birch_log",
		target=1,
	},
})
awards.register_award("award_lumberjack_maple",{
	title = "Maple Lumber Jack",
	description = "Mine a maple log",
	icon = "trees_maple_log.png",
	trigger={
		type="dig",
		node="trees:maple_log",
		target=1,
	},
})
awards.register_award("award_lumberjack_chestnut",{
	title = "Chestnut Lumber Jack",
	description = "Mine a chestnut log",
	icon = "trees_chestnut_log.png",
	trigger={
		type="dig",
		node="trees:chestnut_log",
		target=1,
	},
})
awards.register_award("award_lumberjack_pine",{
	title = "Pine Lumber Jack",
	description = "Mine a pine log",
	icon = "trees_pine_log.png",
	trigger={
		type="dig",
		node="trees:pine_log",
		target=1,
	},
})
awards.register_award("award_lumberjack_spruce",{
	title = "Spruce Lumber Jack",
	icon = "trees_spruce_log.png",
	description = "Mine a spruce log",
	trigger={
		type="dig",
		node="trees:spruce_log",
		target=1,
	},
})

-- Placed a stone anvil
awards.register_award("award_anvil_stone",{
	title = "Smithery",
	description = "Place a Stone Anvil",
	icon = "awards_anvil.png",
	trigger={
		type="place",
		node="anvil:anvil_stone",
		target=1,
	},
})
awards.register_award("award_anvil_dstone",{
	title = "Desert Smithery",
	description = "Place a Desert Stone Anvil",
	icon = "awards_desert_anvil.png",
	trigger={
		type="place",
		node="anvil:anvil_desert_stone",
		target=1,
	},
})

-- Just entered the mine
awards.register_award("award_mine1",{
	title = "Entering the mine",
	description = "Dig 10 stone",
	icon = "awards_miniminer.png^awards_level1.png",
	background = "awards_bg_mining.png",
	trigger={
		type="dig",
		node="default:stone",
		target=10,
	},
})

-- Mini Miner
awards.register_award("award_mine2",{
	title = "Mini Miner",
	description = "Dig 100 stone",
	icon = "awards_miniminer.png^awards_level2.png",
	background = "awards_bg_mining.png",
	trigger={
		type="dig",
		node="default:stone",
		target=100,
	},
})

-- Hardened Miner
awards.register_award("award_mine3",{
	title = "Hardened Miner",
	description = "Dig 1000 stone",
	icon = "awards_miniminer.png^awards_level3.png",
	background = "awards_bg_mining.png",
	trigger={
		type="dig",
		node="default:stone",
		target=1000,
	},
})

-- Master Miner
awards.register_award("award_mine4",{
	title = "Master Miner",
	description = "Dig 10000 stone",
	icon = "awards_miniminer.png^awards_level4.png",
	background = "awards_bg_mining.png",
	trigger={
		type="dig",
		node="default:stone",
		target=10000,
	},
})

-- First Death
awards.register_award("award_death1",{
	title = "First Death",
	description = "You get this when you die.\nDeath does not matter, you have more lives than a cat",
	icon = "awards_death.png",
	trigger={
		type="death",
		target=1,
	},
})

-- Spike Placement
awards.register_award("award_spike_ash",{
	title = "Spiky Ash!",
	icon = "trees_ash_planks.png",
	description = "Place ash spikes",
	trigger={
		type="place",
		node="spikes:spike_ash",
		target=1,
	},
})
awards.register_award("award_spike_aspen",{
	title = "Spiky Aspen!",
	icon = "trees_aspen_planks.png",
	description = "Place aspen spikes!",
	trigger={
		type="place",
		node="spikes:spike_aspen",
		target=1,
	},
})
awards.register_award("award_spike_birch",{
	title = "Spiky Birch!",
	description = "Place birch spikes",
	icon = "trees_birch_planks.png",
	trigger={
		type="place",
		node="spikes:spike_birch",
		target=1,
	},
})
awards.register_award("award_spike_maple",{
	title = "Spiky Maple!",
	description = "Place maple spikes",
	icon = "trees_maple_planks.png",
	trigger={
		type="place",
		node="spikes:spike_maple",
		target=1,
	},
})
awards.register_award("award_spike_chestnut",{
	title = "Spiky Chestnut!",
	icon = "trees_chestnut_planks.png",
	description = "Place chestnut spikes",
	trigger={
		type="place",
		node="spikes:spike_chestnut",
		target=1,
	},
})
awards.register_award("award_spike_pine",{
	title = "Spiky Pine!",
	icon = "trees_pine_planks.png",
	description = "Place pine spikes",
	trigger={
		type="place",
		node="spikes:spike_pine",
		target=1,
	},
})
awards.register_award("award_spike_spruce",{
	title = "Spiky Spruce!",
	icon = "trees_spruce_planks.png",
	description = "Place spruce spikes",
	trigger={
		type="place",
		node="spikes:spike_spruce",
		target=1,
	},
})

--Ants
awards.register_award("award_ants",{
	title = "ANTS!",
	description = "Dig an anthill",
	icon = "farming_anthill.png",
	trigger={
		type="dig",
		node="farming:ant_hill",
		target=1,
	},
})
