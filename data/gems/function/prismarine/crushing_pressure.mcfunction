# CRUSHING PRESSURE - Ocean depths crush enemies
particle splash ~ ~1 ~ 12 2 12 1 150 force
particle bubble ~ ~1 ~ 10 2 10 0.8 120 force
particle falling_water ~ ~1 ~ 8 2 8 0.5 100 force

# Base damage: 6 crushing damage
execute as @e[distance=0.1..30,tag=drowning_target] run damage @s 6 cramming by @p[tag=abyssal_master]

# Increase pressure counter
execute as @e[distance=0.1..30,tag=drowning_target] run scoreboard players add @s pressure_damage 6

# Visual feedback
execute as @e[distance=0.1..30,tag=drowning_target] at @s run particle splash ~ ~1 ~ 0.5 0.8 0.5 0.5 30 force
execute as @e[distance=0.1..30,tag=drowning_target] at @s run particle bubble ~ ~1 ~ 0.4 0.6 0.4 0.3 20 force

# Sound
execute at @s run playsound entity.player.hurt_drown master @a ~ ~ ~ 1 0.5
execute at @s run playsound block.water.ambient master @a ~ ~ ~ 0.8 0.5

# Display
title @s actionbar [{"text":"🌊 CRUSHING PRESSURE ","color":"dark_aqua","bold":true},{"text":"[Total: ","color":"gray"},{"score":{"name":"@e[tag=drowning_target,limit=1]","objective":"pressure_damage"},"color":"yellow"},{"text":"]","color":"gray"}]