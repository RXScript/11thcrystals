# CRUSHING GRAVITY - Weight of the mountain
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 12 2 12 1 200 force
particle cloud ~ ~1 ~ 10 2 10 0.8 150 force
particle smoke ~ ~1 ~ 8 2 8 0.5 120 force

# Base damage: 8 crushing damage
execute as @e[distance=0.1..35,tag=gravity_target] run damage @s 8 cramming by @p[tag=netherite_master]

# Increase gravity damage counter
execute as @e[distance=0.1..35,tag=gravity_target] run scoreboard players add @s gravity_damage 8

# Track total
scoreboard players add @s total_gravity_damage 8

# Visual feedback
execute as @e[distance=0.1..35,tag=gravity_target] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 0.8 0.5 0.5 30 force
execute as @e[distance=0.1..35,tag=gravity_target] at @s run particle cloud ~ ~1 ~ 0.4 0.6 0.4 0.3 20 force

# Sound
execute at @s run playsound entity.player.hurt master @a ~ ~ ~ 0.8 0.5
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 1 0.8

# Display
title @s actionbar [{"text":"⚫ CRUSHING GRAVITY ","color":"dark_gray","bold":true},{"text":"[","color":"gray"},{"score":{"name":"@s","objective":"total_gravity_damage"},"color":"yellow"},{"text":" DMG]","color":"gray"}]