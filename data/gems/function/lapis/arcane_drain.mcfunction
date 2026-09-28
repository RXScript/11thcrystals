# ARCANE DRAIN - Damage + XP theft
particle enchant ~ ~1 ~ 10 2 10 2 150 force
particle witch ~ ~1 ~ 8 2 8 1 100 force
particle soul ~ ~1 ~ 6 1 6 0.5 80 force

# Damage all victims
execute as @e[distance=0.1..30,tag=arcane_victim] run damage @s 10 player_attack by @p[tag=arcane_master]

# Drain XP from players (1 level every 2 seconds)
execute as @e[distance=0.1..30,tag=arcane_victim,type=player] run xp add @s -1 levels

# Give XP to arcane master
xp add @s 1 levels
scoreboard players add @s xp_stolen 1

# Visual feedback - knowledge flowing to master
execute as @e[distance=0.1..30,tag=arcane_victim] at @s facing entity @p[tag=arcane_master] feet run particle enchant ^ ^1 ^1 0 0 0 1 20 force
execute as @e[distance=0.1..30,tag=arcane_victim] at @s facing entity @p[tag=arcane_master] feet run particle soul ^ ^1 ^0.5 0 0 0 0.5 10 force

# Increase drain counter
execute as @e[distance=0.1..30,tag=arcane_victim] run scoreboard players add @s arcane_drain 1

# Sound
execute at @s run playsound entity.player.hurt master @a ~ ~ ~ 0.8 0.5
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 1 1.5
execute at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 2

# Display progress
title @s actionbar [{"text":"✦ KNOWLEDGE STOLEN: ","color":"dark_blue","bold":true},{"score":{"name":"@s","objective":"xp_stolen"},"color":"yellow"},{"text":" levels","color":"gray"}]