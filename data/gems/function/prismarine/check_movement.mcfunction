# ==========================================
# CHECK IF PLAYER MOVED - BREAKS FOCUS
# ==========================================

# Only check if not already broken
execute if score @s focus_broken matches 1 run return fail

# Get current position
execute store result score #current_x focus_pos_x run data get entity @s Pos[0] 100
execute store result score #current_y focus_pos_y run data get entity @s Pos[1] 100
execute store result score #current_z focus_pos_z run data get entity @s Pos[2] 100

# Compare positions (if moved more than 0.05 blocks)
execute unless score #current_x focus_pos_x = @s focus_pos_x run function gems:prismarine/movement_detected
execute unless score #current_y focus_pos_y = @s focus_pos_y run function gems:prismarine/movement_detected
execute unless score #current_z focus_pos_z = @s focus_pos_z run function gems:prismarine/movement_detected