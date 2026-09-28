# DAMAGE REFLECTION - The ocean returns the debt
# Reflect 50% of damage taken to nearby enemies

# Visual feedback
particle splash ~ ~1 ~ 1 1 1 1 50 force
particle bubble ~ ~1 ~ 0.8 0.8 0.8 0.5 40 force
particle glow ~ ~1 ~ 0.5 0.8 0.5 0.3 30 force

# Reflect damage to all nearby drowning targets (simplified - 5 damage per hit taken)
execute as @e[distance=0.1..15,tag=drowning_target] run damage @s 5 thorns by @p[tag=abyssal_master]

# Track reflection
scoreboard players add @s damage_reflected 5

# Visual on reflected targets
execute as @e[distance=0.1..15,tag=drowning_target] at @s run particle splash ~ ~1 ~ 0.5 0.8 0.5 0.5 30 force
execute as @e[distance=0.1..15,tag=drowning_target] at @s run particle glow ~ ~1 ~ 0.3 0.5 0.3 0.2 20 force

# Sound
playsound block.water.ambient master @a ~ ~ ~ 1 0.8
playsound entity.guardian.hurt master @s ~ ~ ~ 1 1.5

# Message
title @s actionbar [{"text":"🔱 DEBT COLLECTED: ","color":"dark_aqua","bold":true},{"score":{"name":"@s","objective":"damage_reflected"},"color":"yellow"}]