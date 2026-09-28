# ==========================================
# RAYCAST TO FIND TARGET
# ==========================================

# Check for entity at this position
execute as @e[distance=..2,type=!#minecraft:arrows,type=!item,tag=!redstone_immune,tag=!circuit_caster,limit=1,sort=nearest] run tag @s add circuit_marked

# If found, stop
execute if entity @e[tag=circuit_marked,limit=1] run return 1

# Continue raycast (max 15 blocks)
execute positioned ^ ^ ^0.5 if block ~ ~ ~ #minecraft:air if entity @s[distance=..15] run function gems:redstone/raycast_circuit