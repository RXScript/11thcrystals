# ARMOR SHATTER - Reduce enemy defenses with sonic vibrations
particle explosion ~ ~1 ~ 10 2 10 0 50 force
particle portal ~ ~1 ~ 8 2 8 1 100 force
particle sonic_boom ~ ~1 ~ 5 1 5 0 10 force

# Remove resistance effects
execute as @e[distance=0.1..35,tag=resonance_target] run effect clear @s resistance

# Apply weakness (reduced defense)
execute as @e[distance=0.1..35,tag=resonance_target] run effect give @s weakness 6 2 true

# Damage armor durability for players
# (This is visual/thematic - actual durability damage isn't feasible in commands)

# Visual feedback
execute as @e[distance=0.1..35,tag=resonance_target] at @s run particle block{block_state:{Name:"minecraft:iron_block"}} ~ ~1 ~ 0.5 0.8 0.5 0.3 30 force
execute as @e[distance=0.1..35,tag=resonance_target] at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 3 force

# Sound
execute at @s run playsound block.anvil.break master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 1.5 0.8

# Message
title @s actionbar [{"text":"💜 ARMOR SHATTERED","color":"light_purple","bold":true}]