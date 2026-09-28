# Stop the gravity display effect
# Run this command: /function <namespace>:gravity_display_end

# Deactivate the effect
scoreboard players set @s gravity_display_active 0

# Remove user tag
tag @s remove gravity_display_user

execute as @e[type=block_display,tag=gravity_display_block] at @s run particle dust{color:[0.2,0.2,0.2],scale:2} ~ ~1 ~ 1 1 1 0 20 force

# Kill all existing gravity displays
execute as @e[type=block_display,tag=gravity_display_block] run kill @s

# Reset timer
scoreboard players reset @s gravity_display_timer

