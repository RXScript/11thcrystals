# IMMOLATION - Burning damage pulse
particle flame ~ ~1 ~ 12 2 12 0.5 200 force
particle soul_fire_flame ~ ~1 ~ 10 2 10 0.3 150 force
particle lava ~ ~1 ~ 8 1 8 0.5 60 force
particle smoke ~ ~1 ~ 10 2 10 0.2 100 force

# Base damage: 8 fire damage
execute as @e[distance=0.1..30,tag=burning_target] run damage @s 8 on_fire by @p[tag=phoenix_master]

# Increase burn stacks
execute as @e[distance=0.1..30,tag=burning_target,scores={burn_stacks=..9}] run scoreboard players add @s burn_stacks 1

# Extra damage for high burn stacks
execute as @e[distance=0.1..30,tag=burning_target,scores={burn_stacks=5..}] run damage @s 2 on_fire by @p[tag=phoenix_master]
execute as @e[distance=0.1..30,tag=burning_target,scores={burn_stacks=10..}] run damage @s 4 on_fire by @p[tag=phoenix_master]

# Track damage
scoreboard players add @s burn_damage_dealt 8

# LIFE STEAL - Heal from burn damage
effect give @s instant_health 1 0 true
effect give @s absorption 3 0 true

# Visual feedback
execute as @e[distance=0.1..30,tag=burning_target] at @s run particle flame ~ ~1 ~ 0.5 0.8 0.5 0.3 30 force
execute as @e[distance=0.1..30,tag=burning_target] at @s run particle soul_fire_flame ~ ~1 ~ 0.4 0.6 0.4 0.2 20 force

# Sound
execute at @s run playsound entity.blaze.shoot master @a ~ ~ ~ 2 0.8
execute at @s run playsound block.fire.extinguish master @a ~ ~ ~ 1 0.5

# Display
title @s actionbar [{"text":"🔥 IMMOLATION ","color":"dark_red","bold":true},{"text":"[Damage: ","color":"gray"},{"score":{"name":"@s","objective":"burn_damage_dealt"},"color":"yellow"},{"text":"]","color":"gray"}]