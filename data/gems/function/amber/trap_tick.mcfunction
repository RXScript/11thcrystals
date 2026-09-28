# ==========================================
# RESIN TRAP ACTIVE
# ==========================================

# Calculate trap center position
scoreboard players operation #trap_center_x trap_x = @s trap_x
scoreboard players operation #trap_center_y trap_y = @s trap_y
scoreboard players operation #trap_center_z trap_z = @s trap_z

# Visual trap area (pulsing honey)
execute store result storage amber temp_x double 0.01 run scoreboard players get @s trap_x
execute store result storage amber temp_y double 0.01 run scoreboard players get @s trap_y
execute store result storage amber temp_z double 0.01 run scoreboard players get @s trap_z
function gems:amber/show_trap_particles with storage amber

# Display trap status
execute if score @s trapped_count matches ..2 if score @s trap_timer matches 60.. run title @s actionbar [{"text":"⬥ TRAP: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"trap_timer"},"color":"yellow"},{"text":" | Trapped: ","color":"gray"},{"score":{"name":"@s","objective":"trapped_count"},"color":"gold"},{"text":"/3","color":"gray"}]
execute if score @s trapped_count matches ..2 if score @s trap_timer matches 40..59 run title @s actionbar [{"text":"⚠ TRAP: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"trap_timer"},"color":"yellow"},{"text":" | Trapped: ","color":"gray"},{"score":{"name":"@s","objective":"trapped_count"},"color":"gold"},{"text":"/3","color":"gray"}]
execute if score @s trapped_count matches ..2 if score @s trap_timer matches ..39 run title @s actionbar [{"text":"⚠ DISSOLVING: ","color":"red","bold":true},{"score":{"name":"@s","objective":"trap_timer"},"color":"red"},{"text":" | Trapped: ","color":"gray"},{"score":{"name":"@s","objective":"trapped_count"},"color":"gold"},{"text":"/3","color":"gray"}]
execute if score @s trapped_count matches 3.. run title @s actionbar [{"text":"✓ DETONATE READY: ","color":"green","bold":true},{"score":{"name":"@s","objective":"trapped_count"},"color":"gold"},{"text":" trapped!","color":"gray"}]

# Sound warnings
execute if score @s trap_timer matches 60 run playsound block.honey_block.step master @s ~ ~ ~ 1 1
execute if score @s trap_timer matches 40 run playsound block.honey_block.step master @s ~ ~ ~ 1.5 1
execute if score @s trap_timer matches 20 run playsound block.honey_block.break master @s ~ ~ ~ 2 1