# Remove the active tag from the player
tag @s remove surge_active

# Play a power-down sound
execute at @s run playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 1 1.5

# Create a final burst of redstone dust and a bright flash to signify the effect ending
execute at @s run particle minecraft:flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1
execute at @s run particle minecraft:dust{color:[1.0, 0.0, 0.0], scale:2.0} ~ ~1 ~ 1.5 1 1.5 0.1 200

# Destroy the orbiting block displays around the player
kill @e[tag=surge_node,distance=..15]