# ==========================================
# PULL ENTITY TOWARD ANCHOR
# ==========================================

# Pull entity toward anchor point player
execute facing entity @p[tag=anchor_point] feet run tp @s ^ ^ ^0.5

# Slow down the entity
effect give @s slowness 1 2 true

# Check if pulled close enough (within 3 blocks)
execute if entity @p[tag=anchor_point,distance=..3] run function gems:netherite/entity_pulled