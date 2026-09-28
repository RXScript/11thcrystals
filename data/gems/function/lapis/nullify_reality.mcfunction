# REALITY NULLIFICATION - Remove all beneficial effects from enemies
particle explosion ~ ~1 ~ 12 2 12 0 60 force
particle enchant ~ ~1 ~ 10 2 10 2 200 force
particle witch ~ ~1 ~ 8 2 8 1 150 force
particle reverse_portal ~ ~1 ~ 8 2 8 1 100 force

# Clear all beneficial effects
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s speed
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s strength
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s regeneration
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s resistance
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s absorption
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s fire_resistance
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s water_breathing
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s night_vision
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s jump_boost
execute as @e[distance=0.1..30,tag=arcane_victim] run effect clear @s haste

# Apply nausea (reality distortion)
execute as @e[distance=0.1..30,tag=arcane_victim] run effect give @s nausea 8 0 true

# Visual feedback
execute as @e[distance=0.1..30,tag=arcane_victim] at @s run particle enchant ~ ~1 ~ 1 1 1 2 100 force
execute as @e[distance=0.1..30,tag=arcane_victim] at @s run particle witch ~ ~1 ~ 0.8 0.8 0.8 1 80 force
execute as @e[distance=0.1..30,tag=arcane_victim] at @s run particle reverse_portal ~ ~1 ~ 0.5 0.8 0.5 1 60 force

# Sound
execute at @s run playsound entity.evoker.cast_spell master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 1.5 0.5

# Message
title @s actionbar [{"text":"✦ REALITY NULLIFIED","color":"dark_blue","bold":true}]