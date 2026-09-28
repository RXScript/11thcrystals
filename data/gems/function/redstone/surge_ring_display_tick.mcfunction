# 1. Snap the inner ring to the player's waist level
execute as @a[tag=surge_active] at @s run tp @e[tag=surge_ring_inner,distance=..15] ~ ~1.0 ~

# 2. Snap the outer ring to the player's chest level
execute as @a[tag=surge_active] at @s run tp @e[tag=surge_ring_outer,distance=..15] ~ ~1.3 ~

# 3. Spin the inner ring clockwise by 10 degrees per tick
execute as @e[tag=surge_ring_inner] at @s run tp @s ~ ~ ~ ~10 ~

# 4. Spin the outer ring counter-clockwise by 15 degrees per tick (moves faster for a cool effect)
execute as @e[tag=surge_ring_outer] at @s run tp @s ~ ~ ~ ~-15 ~

tag @e[tag=surge_node] remove circuit_target
tag @e[tag=surge_node] add redstone_immune