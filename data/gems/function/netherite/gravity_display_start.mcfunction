# Start the gravity display effect
# Run this command: /function <namespace>:gravity_display_start

# Create scoreboards if they don't exist
scoreboard objectives add gravity_display_active dummy
scoreboard objectives add gravity_display_timer dummy
scoreboard objectives add gravity_display_lifetime dummy
scoreboard objectives add gravity_display_angle dummy
scoreboard objectives add gravity_display_height dummy

# Set the effect as active for the player
scoreboard players set @s gravity_display_active 1

# Initialize spawn timer
scoreboard players set @s gravity_display_timer 0

# Tag the player
tag @s add gravity_display_user
