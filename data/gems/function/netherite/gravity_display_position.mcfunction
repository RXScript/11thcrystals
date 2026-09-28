# Position the display at its orbital position around the player

# Store the angle and height
execute store result storage gravity_display:temp angle int 1 run scoreboard players get @s gravity_display_angle
execute store result storage gravity_display:temp height int 1 run scoreboard players get @s gravity_display_height

# Calculate position using angle (Circular orbit at 10 block radius)
execute if score @s gravity_display_angle matches 0..44 positioned ~9.2 ~ ~3.8 run tp @s ~ ~ ~
execute if score @s gravity_display_angle matches 45..89 positioned ~7.1 ~ ~7.1 run tp @s ~ ~ ~
execute if score @s gravity_display_angle matches 90..134 positioned ~3.8 ~ ~9.2 run tp @s ~ ~ ~
execute if score @s gravity_display_angle matches 135..179 positioned ~-3.8 ~ ~9.2 run tp @s ~ ~ ~
execute if score @s gravity_display_angle matches 180..224 positioned ~-9.2 ~ ~3.8 run tp @s ~ ~ ~
execute if score @s gravity_display_angle matches 225..269 positioned ~-7.1 ~ ~-7.1 run tp @s ~ ~ ~
execute if score @s gravity_display_angle matches 270..314 positioned ~-3.8 ~ ~-9.2 run tp @s ~ ~ ~
execute if score @s gravity_display_angle matches 315..359 positioned ~7.1 ~ ~-7.1 run tp @s ~ ~ ~

# Move up based on height score
execute store result storage gravity_display:temp y_offset double 1 run scoreboard players get @s gravity_display_height
execute store result entity @s Pos[1] double 1 run data get entity @s Pos[1]
execute store result score #temp gravity_display_height run data get entity @s Pos[1]
scoreboard players operation #temp gravity_display_height += @s gravity_display_height
execute store result entity @s Pos[1] double 1 run scoreboard players get #temp gravity_display_height
