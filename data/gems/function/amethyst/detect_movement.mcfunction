# ==========================================
# DETECT ENEMY MOVEMENT - Create vibrations
# ==========================================

# Get current position
execute store result score #current_x entity_last_x run data get entity @s Pos[0] 100
execute store result score #current_z entity_last_z run data get entity @s Pos[2] 100

# Calculate movement (difference from last position)
scoreboard players operation #moved_x entity_last_x = #current_x entity_last_x
scoreboard players operation #moved_x entity_last_x -= @s entity_last_x

scoreboard players operation #moved_z entity_last_z = #current_z entity_last_z
scoreboard players operation #moved_z entity_last_z -= @s entity_last_z

# If moved significantly (abs value check)
execute if score #moved_x entity_last_x matches ..-10 run function gems:amethyst/add_vibration
execute if score #moved_x entity_last_x matches 10.. run function gems:amethyst/add_vibration
execute if score #moved_z entity_last_z matches ..-10 run function gems:amethyst/add_vibration
execute if score #moved_z entity_last_z matches 10.. run function gems:amethyst/add_vibration

# Update last position
scoreboard players operation @s entity_last_x = #current_x entity_last_x
scoreboard players operation @s entity_last_z = #current_z entity_last_z