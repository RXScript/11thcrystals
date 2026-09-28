# ==========================================
# RAYCAST TO FIND TARGET TO GRAB
# ==========================================

# Check for entity at this position
execute as @e[distance=..2,type=!#minecraft:arrows,type=!item,tag=!netherite2_immune,tag=!grasp_caster,limit=1,sort=nearest] run tag @s add grasp_victim

# If found, stop
execute if entity @e[tag=grasp_victim,limit=1] run return 1

# Continue raycast (max 10 blocks)
execute positioned ^ ^ ^0.5 if block ~ ~ ~ #minecraft:air if entity @s[distance=..10] run function gems:netherite/raycast_grasp