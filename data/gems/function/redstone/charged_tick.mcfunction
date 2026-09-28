# ==========================================
# VOLTAGE CHARGED - READY TO STRIKE!
# ==========================================

# Charged energy particles (intense)
particle dust{color:[1.0,1.0,0.0],scale:3} ~ ~1 ~ 1.5 1.5 1.5 0.5 25 force
particle electric_spark ~ ~1 ~ 1.5 1.5 1.5 0.3 20 force
particle flame ~ ~1 ~ 1.2 1.2 1.2 0.2 15 force
particle lava ~ ~1 ~ 0.8 0.8 0.8 0 10 force

# Electric arcs on weapon/hand
particle dust{color:[1.0,1.0,0.0],scale:2} ^0.5 ^1 ^0.5 0.1 0.1 0.1 0 10 force
particle electric_spark ^0.5 ^1 ^0.5 0.2 0.2 0.2 0 8 force

# Energy crackling
particle dust{color:[1.0,0.5,0.0],scale:2} ~ ~1 ~ 1 1 1 0.3 12 force

# Show voltage targets
execute at @s as @e[distance=0.1..18,tag=voltage_target] at @s run particle electric_spark ~ ~1.5 ~ 0.3 0.5 0.3 0 5 force
execute at @s as @e[distance=0.1..18,tag=voltage_target] at @s run particle dust{color:[1.0,1.0,0.0],scale:2} ~ ~1 ~ 0.4 0.7 0.4 0 8 force

# CHECK FOR HIT ENTITIES (FIXED - direct check in tick)
execute if score @s voltage_used matches 0 at @s as @e[distance=0.1..18,tag=voltage_target,nbt={HurtTime:10s}] run function gems:redstone/voltage_hit_detected

# Charging sound
execute if score @s voltage_window matches 30 run playsound block.note_block.pling master @s ~ ~ ~ 1.5 2
execute if score @s voltage_window matches 20 run playsound block.note_block.pling master @s ~ ~ ~ 1.8 2
execute if score @s voltage_window matches 10 run playsound block.note_block.pling master @s ~ ~ ~ 2 2

# Display status
execute if score @s voltage_window matches 20.. run title @s actionbar [{"text":"⚡ STRIKE: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"voltage_window"},"color":"green"},{"text":" ticks","color":"gray"}]
execute if score @s voltage_window matches 10..19 run title @s actionbar [{"text":"⚡ STRIKE: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"voltage_window"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s voltage_window matches ..9 run title @s actionbar [{"text":"⚠ STRIKE: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"voltage_window"},"color":"red"},{"text":" ticks!","color":"gray"}]