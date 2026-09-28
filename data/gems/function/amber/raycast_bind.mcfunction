# ==========================================
# RAYCAST TO FIND TARGET TO BIND
# ==========================================

# Check for entity at this position
execute as @e[distance=..2,type=!#minecraft:arrows,type=!item,tag=!amber2_immune,tag=!resin_caster,limit=1,sort=nearest] run tag @s add resin_bound

# If found, stop
execute if entity @e[tag=resin_bound,limit=1] run return 1

# Continue raycast (max 12 blocks)
execute positioned ^ ^ ^0.5 if block ~ ~ ~ #minecraft:air if entity @s[distance=..12] run function gems:amber/raycast_bind