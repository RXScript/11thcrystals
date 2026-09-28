# ==========================================
# CHECK FOR ENEMIES IN TRAP AREA
# ==========================================

# Get trap center coords
execute store result storage amber check_x double 0.01 run scoreboard players get @s trap_x
execute store result storage amber check_y double 0.01 run scoreboard players get @s trap_y
execute store result storage amber check_z double 0.01 run scoreboard players get @s trap_z

# Check for enemies near trap
function gems:amber/detect_enemies with storage amber