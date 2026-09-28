# 1. Remove the active entanglement tag
tag @s remove is_entangled

# 3. Kill the visual block displays attached to this specific entity
execute at @s run kill @e[type=block_display,tag=entangle_visual]