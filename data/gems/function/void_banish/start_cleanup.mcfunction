# Start the puddle cleanup animation
# Called when player is about to be teleported

# Start cleanup timer (wait a few seconds before shrinking)
scoreboard players set @s void_puddle_timer 60

# Tag for cleanup
tag @s add void_puddle_cleanup