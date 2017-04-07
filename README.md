# minetest mod fish_food
This is a minetest mod,
which allows farming of
fishes and jellyfishes.

## license
* code: [LGPL 2.1+ free software license](https://www.gnu.org/licenses/lgpl-2.1.html) or later
* textures: [CC0](https://creativecommons.org/publicdomain/zero/1.0/)

## install
1. Download
2. extract the package
3. rename the minetest-fish_food folder too fish_food
4. move the fish_food folder into your minetest mod folder (on linux (most times): ~/.minetest/mods/)
5. (optional) remove the screenshot folder if u don't need to look at the screenshots, or if u wanna have more free space

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

### fish_food:
#### with technic mod:
compress the unfinished fish_food
#### without
cook the unfinished fish_food

### leave_dust
#### with technic mod:
grind any leaves (in group:leaves)
#### without
|  |  |  |
|--|--|--|
| leave |  | leave |
|  | leave |  |
| leave |  | leave |

