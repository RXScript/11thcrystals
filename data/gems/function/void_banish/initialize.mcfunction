# Initialize the void banishment effect
# Called when a player first gets the void_banish_start tag

# Mark player as actively being banished
tag @s add void_banish_active

# Create marker at player's feet for puddle anchor IN THE DIMENSION THE PLAYER IS IN
summon marker ~ ~ ~ {Tags:["void_puddle_marker","void_puddle_new"]}

# Initialize timers
scoreboard players set @s void_banish_timer 100
scoreboard players set @e[type=marker,tag=void_puddle_new,limit=1,sort=nearest] void_puddle_timer -1

# Spawn crying obsidian puddle block displays (3x3 grid)
execute as @e[type=marker,tag=void_puddle_new,limit=1,sort=nearest] at @s run function gems:void_banish/spawn_puddle

# Remove new tag
tag @e[type=marker,tag=void_puddle_new] remove void_puddle_new

# Initial sound effect
playsound minecraft:block.portal.trigger ambient @a ~ ~ ~ 2 0.5
playsound minecraft:entity.elder_guardian.curse ambient @a ~ ~ ~ 1 0.8

# Apply initial blindness
effect give @s blindness 10 0 true
effect give @s slowness 10 4 true