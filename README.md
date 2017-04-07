# minetest mod fish_food
This is a minetest mod to allow farming of
fishes and jellyfishes.

## install
1. Download
2. extract the package
3. rename the minetest-fish_food folder too fish_food
4. move the fish_food folder into your minetest mod folder (on linux (most times): ~/.minetest/mods/)

## depends
| modname  |  download link   | forum link |
|----------|------------------|------------|
| mobs | https://github.com/tenplus1/mobs_redo/archive/master.zip | https://forum.minetest.net/viewtopic.php?f=11&t=9917&hilit=mobs+redo |
| mobs_fish (from mobs_water modpack) | https://github.com/blert2112/mobs_water/archive/master.zip | https://forum.minetest.net/viewtopic.php?f=9&t=12652&hilit=water+critters |
mobs_jellyfish (from mobs_water modpack) | https://github.com/blert2112/mobs_water/archive/master.zip | https://forum.minetest.net/viewtopic.php?f=9&t=12652&hilit=water+critters |
| technic (optional) | https://github.com/minetest-mods/technic/archive/master.zip | https://forum.minetest.net/viewtopic.php?f=11&t=2538&hilit=technic |


## usage

With a left click on a fish or jellyfish there spawns a second fish/jellyfish by a chance under 10%.

## crafting
### unfinished fish_food:
|  |  |  |
|--|--|--|
| "farming:seed_wheat" | "default:apple" | "fish_food:leave_dust" |
| "fish_food:leave_dust" | "farming:seed_wheat" | "dye:red" |
| "dye:red" | "fish_food:leave_dust" | "default:apple"|


if technic then
        technic.register_grinder_recipe({ input = { "group:leaves" }, output = "fish_food:leave_dust 1" })
	technic.register_compressor_recipe({ input = { "fish_food:unfinished_fish_food" }, output = "fish_food:fish_food" })
else
        minetest.register_craft( {
        output = "fish_food:leave_dust 1",
                recipe = {
                        { "group:leaves", "", "group:leaves" },
                        { "", "group:leaves", ""},
			{ "group:leaves", "", "group:leaves"},
                },
        })
	minetest.register_craft({
                type = "cooking",
                output = "fish_food:fish_food",
                recipe = "fish_food:unfinished_fish_food",
                cooktime = 10,
        })
end
