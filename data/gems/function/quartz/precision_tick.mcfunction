# ==========================================
# PRECISION STRIKE CHARGED - CALCULATING
# ==========================================

# White energy particles (cold calculation)
particle dust{color:[1.0,1.0,1.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 20 force
particle crit ~ ~1 ~ 1.2 1.2 1.2 0.3 15 force
particle end_rod ~ ~1 ~ 1 1 1 0.1 12 force
particle electric_spark ~ ~1 ~ 1 1 1 0.2 10 force

# Calculation grid on weapon/hand
particle dust{color:[1.0,1.0,1.0],scale:2} ^0.5 ^1 ^0.5 0.1 0.1 0.1 0 8 force
particle crit ^0.5 ^1 ^0.5 0.1 0.1 0.1 0 5 force

# Targeting reticle effect
execute at @s run particle dust{color:[0.8,0.8,0.8],scale:1.5} ~ ~1 ~ 2 0.1 2 0 15 force
execute at @s run particle end_rod ~ ~1 ~ 1.8 0.1 1.8 0 8 force

# Show precision targets
execute at @s as @e[distance=0.1..18,tag=precision_target] at @s run particle crit ~ ~1.5 ~ 0.3 0.5 0.3 0 5 force
execute at @s as @e[distance=0.1..18,tag=precision_target] at @s run particle dust{color:[1.0,1.0,1.0],scale:2} ~ ~1 ~ 0.4 0.7 0.4 0 8 force
execute at @s as @e[distance=0.1..18,tag=precision_target] at @s run particle electric_spark ~ ~1 ~ 0.3 0.5 0.3 0 3 force

# CHECK FOR HIT ENTITIES (FIXED - direct check in tick)
execute at @s as @e[distance=0.1..18,tag=precision_target,nbt={HurtTime:10s}] run function gems:quartz/precision_hit_detected

# Calculation sound
execute if score @s precision_window matches 50 run playsound block.note_block.pling master @s ~ ~ ~ 1 2
execute if score @s precision_window matches 40 run playsound block.note_block.pling master @s ~ ~ ~ 1.2 2
execute if score @s precision_window matches 30 run playsound block.note_block.pling master @s ~ ~ ~ 1.5 2
execute if score @s precision_window matches 20 run playsound block.note_block.pling master @s ~ ~ ~ 1.8 2
execute if score @s precision_window matches 10 run playsound block.note_block.pling master @s ~ ~ ~ 2 2

# Display status
execute if score @s precision_window matches 30.. run title @s actionbar [{"text":"◈ PRECISION: ","color":"white","bold":true},{"score":{"name":"@s","objective":"precision_window"},"color":"green"},{"text":" ticks","color":"gray"}]
execute if score @s precision_window matches 15..29 run title @s actionbar [{"text":"◈ PRECISION: ","color":"white","bold":true},{"score":{"name":"@s","objective":"precision_window"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s precision_window matches ..14 run title @s actionbar [{"text":"⚠ PRECISION: ","color":"white","bold":true},{"score":{"name":"@s","objective":"precision_window"},"color":"red"},{"text":" ticks!","color":"gray"}]