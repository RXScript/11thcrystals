# Initialize a newly spawned gravity display

# Set lifetime (how long before it despawns) - random between 60-120 ticks
scoreboard players set @s gravity_display_lifetime 100
execute store result score @s gravity_display_lifetime run random value 60..120

# Set random angle for orbit (0-359 degrees)
execute store result score @s gravity_display_angle run random value 0..359

# Set random starting height (5-25 blocks above player)
execute store result score @s gravity_display_height run random value 5..25

# Position at the calculated angle and height around the nearest player
execute at @p[tag=gravity_display_user] run function gems:netherite/gravity_display_position

# Remove the new tag
tag @s remove gravity_display_new
