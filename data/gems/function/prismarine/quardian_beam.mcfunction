# GUARDIAN BEAM - Laser targeting enemies
particle glow ~ ~1 ~ 10 2 10 1 200 force
particle end_rod ~ ~1 ~ 8 2 8 0.5 150 force
particle splash ~ ~1 ~ 8 2 8 0.8 100 force

# Damage: 10 per beam
execute as @e[distance=0.1..30,tag=drowning_target] run damage @s 10 magic by @p[tag=abyssal_master]

# Visual beam effect (line from caster to target)
execute as @e[distance=0.1..30,tag=drowning_target] at @s run particle glow ~ ~1 ~ 0.3 0.5 0.3 0.5 50 force
execute as @e[distance=0.1..30,tag=drowning_target] at @s run particle end_rod ~ ~1 ~ 0.2 0.3 0.2 0.2 30 force
execute as @e[distance=0.1..30,tag=drowning_target] at @s facing entity @p[tag=abyssal_master] feet run particle glow ^ ^1 ^-1 0 0 0 0.5 20 force

# Sound
execute at @s run playsound entity.guardian.attack master @a ~ ~ ~ 2 0.8
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 1 2

# Message
title @s actionbar [{"text":"🔱 GUARDIAN BEAM","color":"dark_aqua","bold":true}]