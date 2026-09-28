# SONIC SCREAM - The unfinished scream unleashed
particle sonic_boom ~ ~1 ~ 0 0 0 0 10 force
particle sculk_soul ~ ~1 ~ 10 2 10 1.5 200 force
particle soul_fire_flame ~ ~1 ~ 8 2 8 1 150 force
particle explosion ~ ~1 ~ 8 1 8 0 50 force

# Damage: 12 sonic damage
execute as @e[distance=0.1..30,tag=sculk_infected] run damage @s 12 sonic_boom by @p[tag=void_master]

# Knockback pulse
execute at @s as @e[distance=0.1..30,tag=sculk_infected] at @s facing entity @p[tag=void_master] feet run tp @s ^ ^ ^-1

# Visual feedback
execute as @e[distance=0.1..30,tag=sculk_infected] at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 3 force
execute as @e[distance=0.1..30,tag=sculk_infected] at @s run particle sculk_soul ~ ~1 ~ 0.5 0.8 0.5 1 50 force

# Sound
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 2 1.2
execute at @s run playsound block.sculk_shrieker.shriek master @a ~ ~ ~ 1.5 1

# Message
title @s actionbar [{"text":"⚫ SONIC SCREAM","color":"#0f3460","bold":true}]