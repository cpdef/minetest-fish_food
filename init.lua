

fish_food = {}

fish_food.feedable_fishes = {}
fish_food.feedable_fishes["mobs_jellyfish:jellyfish"] = 5 --spawnchance in percent
fish_food.feedable_fishes["mobs_fish:clownfish"] = 10
fish_food.feedable_fishes["mobs_fish:tropical"] = 7
--print(dump(fish_food.feedable_fishes))

local feed_fish = function(obj)
        --print('FEED FISH', dump(obj))
	local entity = obj:get_luaentity()
	--print(dump(entity))
	--print(entity.name)
	for fish, spawnchance in pairs(fish_food.feedable_fishes) do
		--print(fish, spawnchance)
		if entity.name == fish then
			local rnd = math.random(100)
			--print(rnd)
			if rnd >= (100-spawnchance) then
				minetest.add_entity(obj:getpos(), entity.name)
			end
		end
		--print(entity.name, fish, entity.name == fish)
	end
end

minetest.register_craftitem("fish_food:fish_food", {
	description = "fish food",
	inventory_image = "fish_food.png",
	liquids_pointable = true,
	on_use = function(itemstack, user, pointed_thing)
		local pos = minetest.get_pointed_thing_position(pointed_thing, true)
				
		--feed pointed fish
		if pointed_thing.ref then
		        local obj = pointed_thing.ref
			feed_fish(obj, itemstack)
		end
		
		--feed all fishes in radius 4
		local all_objects = minetest.get_objects_inside_radius(pos, 4)
                local _,obj
                for i,obj in ipairs(all_objects) do
		        if ( not obj:is_player() ) and ( not (i > 10) ) then
		                feed_fish(obj)
			end
	        end
		
		--return
		itemstack:take_item(1)
		return itemstack
	end,
})

--crafting:
minetest.register_craftitem("fish_food:unfinished_fish_food", {
	description = "unfinished fish food",
	inventory_image = "unfinished_fish_food.png",
})

minetest.register_craftitem("fish_food:leave_dust", {
	description = "leave dust",
	inventory_image = "leave_dust.png",
})

minetest.register_craft( {
        output = "fish_food:unfinished_fish_food 1",
                recipe = {
                        { "farming:seed_wheat", "default:apple", "fish_food:leave_dust" },
                        { "fish_food:leave_dust", "farming:seed_wheat", "dye:red"},
			{ "dye:red", "fish_food:leave_dust", "default:apple"},
                },
})

if technic then
        technic.register_grinder_recipe({ input = { "default:leaves" }, output = "fish_food:leave_dust 1" })
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



print("fish_food      [ ok ]")