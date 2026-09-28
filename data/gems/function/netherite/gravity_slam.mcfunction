# GRAVITY SLAM - Space collapses around impact
particle explosion ~ ~1 ~ 12 2 12 0 80 force
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 10 2 10 1.5 250 force
particle cloud ~ ~1 ~ 8 2 8 1 180 force

# Damage: 15 per slam
execute as @e[distance=0.1..35,tag=gravity_target] run damage @s 15 falling_anvil by @p[tag=netherite_master]

# Minor knockback downward (gravity slam)
execute as @e[distance=0.1..35,tag=gravity_target] run effect give @s levitation 1 250 true

# Visual feedback
execute as @e[distance=0.1..35,tag=gravity_target] at @s run particle explosion ~ ~1 ~ 1 1 1 0 10 force
execute as @e[distance=0.1..35,tag=gravity_target] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.8 0.8 0.8 1 80 force

# Sound
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 1.5 0.8

# Message
title @s actionbar [{"text":"⚫ GRAVITY SLAM","color":"dark_gray","bold":true}]