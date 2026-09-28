# Update gravity display - make it fall and orbit

# Decrease lifetime
scoreboard players remove @s gravity_display_lifetime 1

# Increment angle for orbit rotation (2 degrees per tick)
scoreboard players add @s gravity_display_angle 3
execute if score @s gravity_display_angle matches 360.. run scoreboard players remove @s gravity_display_angle 360

# Apply gravity - decrease height
scoreboard players remove @s gravity_display_height 1

# Check if hit the ground (height <= 0)
execute if score @s gravity_display_height matches ..0 run kill @s

# Check if lifetime expired
execute if score @s gravity_display_lifetime matches ..0 run kill @s

# Update position if still alive
execute if entity @s at @p[tag=gravity_display_user] run function gems:netherite/gravity_display_position

# Add slight glowing effect and interpolation for smooth movement
data merge entity @s {brightness:{sky:15,block:15},interpolation_duration:2}
