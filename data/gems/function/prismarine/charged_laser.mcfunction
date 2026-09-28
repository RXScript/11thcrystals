# ==========================================
# PARTIAL - TIDAL REPAYMENT
# ==========================================

# MEDIUM OCEAN BLAST
particle explosion ~ ~1 ~ 5 5 5 0 100 force
particle falling_water ~ ~1 ~ 5 5 5 1 500 force
particle bubble_pop ~ ~1 ~ 3 3 3 0.5 200 force

# SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 2 1.5
execute at @s run playsound entity.guardian.ambient master @a ~ ~ ~ 2 1

# MEDIUM DAMAGE (28 HP)
execute at @s as @e[distance=0.1..18,tag=laser_target] run damage @s 28 indirect_magic by @p[tag=guardian_focusing]

# Medium pressure
execute at @s as @e[distance=0.1..18,tag=laser_target] at @s facing entity @p[tag=guardian_focusing] feet run tp @s ^ ^ ^-5

# MINOR BUFFS (8 seconds)
effect give @s absorption 8 1 true
effect give @s resistance 8 0 true

# Messages
title @s title [{"text":"⬥ LASER FIRED ⬥","color":"aqua","bold":true}]
title @s subtitle [{"text":"Charged!","color":"dark_aqua"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @s [{"text":"   ⬥ CHARGED LASER ⬥","color":"aqua","bold":true}]
tellraw @s [{"text":"  Charge: ","color":"gray"},{"score":{"name":"@s","objective":"focus_charge"},"color":"yellow"},{"text":"%","color":"gray"}]
tellraw @s [{"text":"  Laser Damage: 28 HP","color":"red"}]
tellraw @s [{"text":"  • Absorption II (8s)","color":"green"}]
tellraw @s [{"text":"  • Resistance I (8s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]

# Cleanup
tag @s remove guardian_focusing
tag @s remove prismarine_immune
tag @e remove laser_target
scoreboard players reset @s focus_timer
scoreboard players reset @s focus_charge
scoreboard players reset @s focus_broken
scoreboard players reset @s focus_pos_x
scoreboard players reset @s focus_pos_y
scoreboard players reset @s focus_pos_z