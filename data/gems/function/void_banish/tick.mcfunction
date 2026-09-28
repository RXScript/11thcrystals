# Main tick function for void banishment system
# Run this from your main tick function

# Initialize players who just got the void_banish_start tag
execute as @a[tag=void_banish_start,tag=!void_banish_active] at @s run function gems:void_banish/initialize

# Pull down players who are being banished
execute as @a[tag=void_banish_active,scores={void_banish_timer=1..}] at @s run function gems:void_banish/pull_down

# Handle the puddle shrinking animation IN THE OVERWORLD
execute in minecraft:overworld as @e[type=marker,tag=void_puddle_marker,scores={void_puddle_timer=0..}] at @s run function gems:void_banish/puddle_animate

effect give @e[tag=void_banish_active] regeneration 1 5 true
effect give @e[tag=void_banish_active] resistance 1 5 true
effect give @e[tag=void_banish_active] instant_health 1 5 true