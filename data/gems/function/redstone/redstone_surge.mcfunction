# REDSTONE SURGE - Energy blast
particle explosion ~ ~1 ~ 12 2 12 0 60 force
particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 10 2 10 1.5 200 force
particle electric_spark ~ ~1 ~ 8 2 8 1.5 150 force

# Damage: 8 electric damage
execute as @e[distance=0.1..30,tag=circuit_target] run damage @s 8 lightning_bolt by @p[tag=redstone_master]

# Visual feedback
execute as @e[distance=0.1..30,tag=circuit_target] at @s run particle electric_spark ~ ~1 ~ 0.5 0.8 0.5 1 50 force
execute as @e[distance=0.1..30,tag=circuit_target] at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.4 0.6 0.4 0.8 40 force

# Sound
execute at @s run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 2 0.5

# Message
title @s actionbar [{"text":"⚡ REDSTONE SURGE","color":"red","bold":true}]