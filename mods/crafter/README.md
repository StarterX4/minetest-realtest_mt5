=== Crafter MOD for MINETEST-C55 ===
by Master Gollum

Introduction:

  This is an utility MOD, itself does nothing. Clones the crafting
  definition system to allow new MOD developers to create their
  own craft systems. For example a pottery wheel to do items with
  clay, a mill to produce flour from cereals, etc.

  How it works?
  It give you 2 functions crafter.register_craft(craft) and
  crafter.get_craft_result(data). The main difference with the
  default ones is that they are not restricted for the method
  name, you can use whatever name you want and create a new
  family of crafts. They are used exactly as the default ones
  are used, with the exception that register_craft requires
  the method property.

  Example:

    -- In the list of definitions
    crafter.register_craft({
      type = 'pottery',
	    output = 'potter:awasome_jar',
	    recipe = {
        {'default:clay_lump','default:clay_lump'},
        {'default:clay_lump','default:clay_lump'},
	    }
    })

    -- Inside your the abm of your crafter node
    local shape = inv:get_list("shape")
    crafter.get_craft_result({method = "pottery", width = 4, items = shape})


Release Notes

  Version 0.1
     Initial version

PS: This document has been structured as the README.txt of PilzAdam in 
    his Bed MOD.

How to install:
  Unzip the archive an place it in minetest-base-directory/mods/minetest/
  if you have a windows client or a linux run-in-place client. If you 
  have a linux system-wide instalation place it in 
  ~/.minetest/mods/minetest/.
  If you want to install this mod only in one world create the folder
  worldmods/ in your worlddirectory.
  For further information or help see:
    http://wiki.minetest.com/wiki/Installing_Mods


License:
Source code: MIT License
Graphics: MIT License

See also:
https://minetest.net/
