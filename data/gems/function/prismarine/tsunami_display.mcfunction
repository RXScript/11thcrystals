# Ensure the timer objective exists
scoreboard objectives add wave_age dummy

# Reset the loop counter
scoreboard players set #wave_count wave_age 0

# Summon a temporary invisible marker at the player's location
execute at @s run summon marker ~ ~1 ~ {Tags:["tsunami_spawner"]}

# Trigger the loop to spawn the ring of block displays
execute as @e[type=marker,tag=tsunami_spawner] at @s run function gems:prismarine/tsunami_display_loop

# Clean up the marker instantly
kill @e[type=marker,tag=tsunami_spawner]