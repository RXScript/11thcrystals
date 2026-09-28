# ==========================================
# SEISMIC SENSE ACTIVE - ABSORBING VIBRATIONS
# ==========================================

# Purple vibration particles
particle dust{color:[0.5,0.0,0.5],scale:2} ~ ~1 ~ 2 2 2 0.5 20 force
particle sculk_charge{roll:0.0} ~ ~1 ~ 1.5 1.5 1.5 0 15 force
particle end_rod ~ ~1 ~ 1 1 1 0.1 10 force

# Ground pulse rings
particle dust{color:[0.5,0.0,0.5],scale:3} ~ ~0.1 ~ 3 0.1 3 0 25 force
particle sculk_charge{roll:1.0} ~ ~0.1 ~ 2.5 0.1 2.5 0 20 force

# Show vibration sources
execute at @s as @e[distance=0.1..20,tag=vibration_source] at @s run particle sculk_charge{roll:1.0} ~ ~0.5 ~ 0.2 0.2 0.2 0 3 force
execute at @s as @e[distance=0.1..20,tag=vibration_source] at @s run particle dust{color:[0.5,0.0,0.5],scale:1} ~ ~1 ~ 0.3 0.6 0.3 0 5 force

# Display vibration count with color coding
execute if score @s vibration_count matches ..39 run title @s actionbar [{"text":"⬥ VIBRATIONS: ","color":"red","bold":true},{"score":{"name":"@s","objective":"vibration_count"},"color":"yellow"},{"text":"/80 | ","color":"gray"},{"score":{"name":"@s","objective":"seismic_timer"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s vibration_count matches 40..79 run title @s actionbar [{"text":"⬥ VIBRATIONS: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"vibration_count"},"color":"yellow"},{"text":"/80 | ","color":"gray"},{"score":{"name":"@s","objective":"seismic_timer"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s vibration_count matches 80.. run title @s actionbar [{"text":"⬥ PEAK VIBRATIONS: ","color":"green","bold":true},{"score":{"name":"@s","objective":"vibration_count"},"color":"gold"},{"text":" | DETONATE!","color":"green","bold":true}]

# Sound feedback at thresholds
execute if score @s vibration_count matches 20 run playsound block.amethyst_block.step master @s ~ ~ ~ 1 1
execute if score @s vibration_count matches 40 run playsound block.amethyst_block.step master @s ~ ~ ~ 1.5 1.2
execute if score @s vibration_count matches 60 run playsound block.amethyst_block.step master @s ~ ~ ~ 2 1.4
execute if score @s vibration_count matches 80 run playsound block.amethyst_block.chime master @s ~ ~ ~ 2 2
execute if score @s vibration_count matches 80 run playsound block.note_block.bell master @s ~ ~ ~ 2 2

# Pulse sound
execute if score @s seismic_timer matches 80 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 1 1.5
execute if score @s seismic_timer matches 60 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 1.5 1.5
execute if score @s seismic_timer matches 40 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 2 2
execute if score @s seismic_timer matches 20 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 2.5 2

execute if score @s vibration_count matches 80.. run effect give @s instant_health 1 1 true