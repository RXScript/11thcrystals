# ==========================================
# THE INEVITABLE STANDS ETERNAL
# ==========================================

# MASSIVE gravity/weight aura
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 8 9 8 1.5 250 force
particle smoke ~ ~1 ~ 7 8 7 1 180 force
particle cloud ~ ~1 ~ 6 7 6 0.8 150 force
particle explosion ~ ~1 ~ 5 6 5 0 20 force

# Ground weight particles (crushing earth)
particle block{block_state:{Name:"minecraft:stone"}} ~ ~0.1 ~ 9 0.1 9 1 100 force
particle cloud ~ ~0.1 ~ 8 0.1 8 0.5 80 force

# Vertical anchor every 5 seconds
execute if score @s inevitable_timer matches 1190 run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 100 0.5 0 1500 force
execute if score @s inevitable_timer matches 1190 run particle smoke ~ ~1 ~ 0.5 100 0.5 0 1000 force
execute if score @s inevitable_timer matches 1190 run playsound block.anvil.land master @a ~ ~ ~ 2 0.5

# Orbital weight masses (gravity field)
execute rotated ~ 0 run particle block{block_state:{Name:"minecraft:netherite_block"}} ^17 ^3 ^0 0.3 3 0.3 0.5 40 force
execute rotated ~60 0 run particle smoke ^17 ^3 ^0 0.3 3 0.3 0.3 30 force
execute rotated ~120 0 run particle cloud ^17 ^3 ^0 0.3 3 0.3 0.2 25 force
execute rotated ~180 0 run particle block{block_state:{Name:"minecraft:netherite_block"}} ^17 ^3 ^0 0.3 3 0.3 0.5 40 force
execute rotated ~240 0 run particle smoke ^17 ^3 ^0 0.3 3 0.3 0.3 30 force
execute rotated ~300 0 run particle cloud ^17 ^3 ^0 0.3 3 0.3 0.2 25 force

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..35,tag=!gravity_immune] unless entity @s[tag=gravity_target] run tag @s add gravity_target
execute at @s as @e[distance=0.1..35,tag=gravity_target] unless score @s gravity_damage matches 0.. run scoreboard players set @s gravity_damage 0

# Gravity pull particles on targets
execute at @s as @e[distance=0.1..35,tag=gravity_target] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.4 0.8 0.4 0.5 15 force
execute at @s as @e[distance=0.1..35,tag=gravity_target] at @s run particle cloud ~ ~1.5 ~ 0.3 0.6 0.3 0.3 12 force
execute at @s as @e[distance=0.1..35,tag=gravity_target] at @s run particle smoke ~ ~1 ~ 0.2 0.5 0.2 0.1 10 force

# CRUSHING GRAVITY (every 2 seconds - 40 ticks)
execute if score @s inevitable_timer matches 1180 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 1140 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 1100 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 1060 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 1020 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 980 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 940 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 900 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 860 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 820 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 780 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 740 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 700 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 660 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 620 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 580 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 540 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 500 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 460 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 420 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 380 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 340 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 300 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 260 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 220 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 180 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 140 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 100 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 60 run function gems:netherite/crushing_gravity
execute if score @s inevitable_timer matches 20 run function gems:netherite/crushing_gravity

# GRAVITY SLAM (every 4 seconds - 80 ticks)
execute if score @s inevitable_timer matches 1176 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 1096 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 1016 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 936 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 856 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 776 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 696 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 616 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 536 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 456 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 376 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 296 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 216 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 136 run function gems:netherite/gravity_slam
execute if score @s inevitable_timer matches 56 run function gems:netherite/gravity_slam

# GRAVITY PULL - Constantly pull enemies toward center
execute at @s as @e[distance=0.1..35,tag=gravity_target] facing entity @p[tag=netherite_master] feet run tp @s ^ ^ ^0.15

# MAINTAIN CRUSHING DEBUFFS
execute at @s as @e[distance=0.1..35,tag=gravity_target] run effect give @s slowness 3 3 true
execute at @s as @e[distance=0.1..35,tag=gravity_target] run effect give @s weakness 3 2 true
execute at @s as @e[distance=0.1..35,tag=gravity_target] run effect give @s mining_fatigue 3 3 true

# UNSTOPPABLE - Cannot be moved
effect give @s slowness 2 4 true
effect give @s jump_boost 2 1 true
effect clear @s levitation
effect clear @s slow_falling

# COUNT KILLS
execute at @s as @e[distance=0.1..35,tag=gravity_target,nbt={Health:0.0f}] run scoreboard players add @p[tag=netherite_master] inevitable_kills 1

# Ambient sound (deep rumbling)
execute if score @s inevitable_timer matches 1100 run playsound block.anvil.land master @a ~ ~ ~ 1 0.5
execute if score @s inevitable_timer matches 600 run playsound entity.warden.heartbeat master @a ~ ~ ~ 1.5 0.5

execute at @s run tp @s @s