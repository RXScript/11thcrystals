# Main tick function for gravity display effect
# Add this to your tick.json or call it from your main tick function

# Process each player with the effect active
execute as @a[tag=gravity_display_user,scores={gravity_display_active=1}] at @s run function gems:netherite/gravity_display_spawn_check

# Update all existing gravity displays
execute as @e[type=block_display,tag=gravity_display_block] at @s run function gems:netherite/gravity_display_update
