# 1. Move to the next ability
scoreboard players add @s netherite_ability 1

# 2. If it goes past the 5th ability, reset it to 1
execute if score @s netherite_ability matches 6.. run scoreboard players set @s netherite_ability 1

# 3. Show the UI (The Action Bar you have in your show_ability file)
function gems:netherite/show_ability

# 4. Technical Feedback
execute at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.5
particle minecraft:enchant ~ ~1 ~ 0.2 0.5 0.2 0.1 10 force