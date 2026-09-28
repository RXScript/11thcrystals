# VOID DECAY - Darkness consumes life force
particle sculk_soul ~ ~1 ~ 12 2 12 1 150 force
particle soul_fire_flame ~ ~1 ~ 10 2 10 0.8 120 force
particle smoke ~ ~1 ~ 8 2 8 0.5 100 force

# Base damage: 7 void damage per 1.5s
execute as @e[distance=0.1..30,tag=sculk_infected] run damage @s 7 out_of_world by @p[tag=void_master]

# Increase void damage counter
execute as @e[distance=0.1..30,tag=sculk_infected] run scoreboard players add @s void_damage 7

# Track total
scoreboard players add @s total_void_damage 7

# Visual feedback
execute as @e[distance=0.1..30,tag=sculk_infected] at @s run particle sculk_soul ~ ~1 ~ 0.5 0.8 0.5 0.5 30 force
execute as @e[distance=0.1..30,tag=sculk_infected] at @s run particle soul_fire_flame ~ ~1 ~ 0.4 0.6 0.4 0.3 20 force

# Sound
execute at @s run playsound entity.player.hurt master @a ~ ~ ~ 0.8 0.5
execute at @s run playsound block.sculk.spread master @a ~ ~ ~ 1 0.5

# Display
title @s actionbar [{"text":"⚫ VOID DECAY ","color":"#0f3460","bold":true},{"text":"[","color":"gray"},{"score":{"name":"@s","objective":"total_void_damage"},"color":"yellow"},{"text":" DMG]","color":"gray"}]