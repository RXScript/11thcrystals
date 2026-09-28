# Check if it's time to spawn new gravity displays

# Increment timer
scoreboard players add @s gravity_display_timer 1

# Spawn displays every 2-4 ticks (randomized)
execute if score @s gravity_display_timer matches 2.. run function gems:netherite/gravity_display_spawn_wave

# Reset timer after spawning
execute if score @s gravity_display_timer matches 2.. run scoreboard players set @s gravity_display_timer 0
