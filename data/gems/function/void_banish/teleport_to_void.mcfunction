# Teleport player to the Null dimension
# Called when player reaches y=-75 or timer expires

# Store current dimension 
execute store result score #temp_dim void_banish_timer run data get entity @s Dimension

# Add void_banished tag (permanent marker)
tag @s add void_banished

# Trigger cleanup for ALL puddle markers (execute in their dimension)
execute in minecraft:overworld as @e[type=marker,tag=void_puddle_marker,scores={void_puddle_timer=..-1}] run scoreboard players set @s void_puddle_timer 60

# Teleport to the Null dimension
execute in gems:void run tp @s[tag=void_banished] 0 75 0

# Clear active banishment tag
tag @s remove void_banish_active

# Remove the void_banish_start tag (keep void_banish)
tag @s remove void_banish_start

# Reset timer
scoreboard players set @s void_banish_timer 0

# Final dramatic effects for the player
effect give @s blindness 5 5 true
effect give @s darkness 5 0 true
effect give @s resistance 5 4 true
effect clear @s slowness

# Arrival sound in the void
playsound minecraft:entity.warden.roar ambient @s ~ ~ ~ 2 0.5
playsound minecraft:block.portal.travel ambient @s ~ ~ ~ 1 0.3

# Particles at arrival location
particle minecraft:portal ~ ~1 ~ 1 1 1 2 100 force
particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force
particle minecraft:soul ~ ~1 ~ 1 1 1 0.1 50 force