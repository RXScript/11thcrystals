# ==========================================
# TIME REMAINS FROZEN
# ==========================================

# 2. For every target that doesn't have a display yet, summon the fossil at their feet
execute as @e[tag=time_frozen,tag=!has_display] at @s run summon block_display ~ ~ ~ {Tags:["amber_fossil"], transformation:{left_rotation:[0f,0f,0f,1f], right_rotation:[0f,0f,0f,1f], translation:[-0.75f,-0.20f,-0.75f], scale:[1.5f,3f,1.5f]}, block_state:{Name:"minecraft:honey_block"}}

# 3. Mark the target so we don't accidentally summon a second block on them
tag @e[tag=time_frozen,tag=!has_display] add has_display

# MASSIVE amber dome aura
particle dripping_dripstone_lava ~ ~1 ~ 3 4 3 0.5 80 force
particle dust{color:[1.0,0.7,0.0],scale:2} ~ ~5 ~ 4 4 4 0.3 60 force
particle glow ~ ~1 ~ 3 4 3 0.2 20 force
particle end_rod ~ ~1 ~ 2 3 2 0.1 10 force
particle enchant ~ ~1 ~ 2.5 3.5 2.5 0.5 30 force

# Golden particles rising (time suspended)
particle glow ~ ~0.1 ~ 3 0.1 3 0.5 10 force
particle end_rod ~ ~0.1 ~ 2.5 0.1 2.5 0.3 15 force

# Vertical beam every 5 seconds
execute if score @s eternity_timer matches 1190 run particle dust{color:[1.0,0.7,0.0],scale:3} ~ ~1 ~ 0.3 50 0.3 0 300 force
execute if score @s eternity_timer matches 1190 run particle end_rod ~ ~1 ~ 0.3 50 0.3 0 200 force
execute if score @s eternity_timer matches 1190 run playsound block.beacon.ambient master @a ~ ~ ~ 1.5 2

# Circular amber prison walls (orbital)
execute rotated ~ 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~30 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~60 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~90 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~120 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~150 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~180 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~210 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~240 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~270 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~300 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force
execute rotated ~330 0 run particle dust{color:[1.0,0.7,0.0],scale:1} ^12 ^3 ^0 0.3 3 0.3 0.2 15 force

# MAINTAIN FREEZE on all entities in range
execute at @s as @e[distance=0.1..25,tag=!time_immune,type=!block_display] unless entity @s[tag=time_frozen] run tag @s add time_frozen
execute at @s as @e[distance=0.1..25,tag=time_frozen] run effect give @s slowness 2 255 true
execute at @s as @e[distance=0.1..25,tag=time_frozen] run effect give @s mining_fatigue 2 255 true
execute at @s as @e[distance=0.1..25,tag=time_frozen] run effect give @s weakness 2 255 true
execute at @s as @e[distance=0.1..25,tag=time_frozen] run attribute @s minecraft:attack_speed base set -100
execute at @s as @e[distance=0.1..25,tag=time_frozen] run attribute @s minecraft:movement_speed base set 0
execute at @s as @e[distance=0.1..25,tag=time_frozen] run attribute @s minecraft:jump_strength base set 0
execute at @s as @e[distance=0.1..25,tag=time_frozen] run attribute @s minecraft:gravity base set 100

# Amber coating particles on frozen targets
execute at @s as @e[distance=0.1..25,tag=time_frozen] at @s run particle dust{color:[1.0,0.7,0.0],scale:2} ~ ~1 ~ 0.3 0.8 0.3 0.1 5 force
execute at @s as @e[distance=0.1..25,tag=time_frozen] at @s run particle dust{color:[1.0,0.7,0.0],scale:2} ~ ~1.5 ~ 0.2 0.5 0.2 0 3 force
execute at @s as @e[distance=0.1..25,tag=time_frozen] at @s run particle glow ~ ~1 ~ 0.2 0.5 0.2 0 2 force


execute at @s as @e[distance=0.1..25,tag=time_frozen,tag=!has_display,type=!block_display] at @s run summon block_display ~ ~ ~ {Tags:["amber_fossil"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.5f,3f,1.5f],translation:[-0.6f,-0.1f,-0.6f]},block_state:{Name:"minecraft:honey_block"}}
execute at @s as @e[distance=0.1..25,tag=time_frozen,tag=!has_display] at @s run tag @s add has_display
# 1. Individual Following: Each target "pulls" the nearest amber fossil to its location
# This prevents clumping because each mob only teleports the single closest block display
execute as @e[tag=time_frozen,tag=has_display] at @s run tp @e[type=block_display,tag=amber_fossil,distance=..2,sort=nearest,limit=1] ~ ~ ~

tag @e[tag=amber_fossil] add time_immune
tag @e[tag=amber_fossil] remove time_frozen

# 2. Progress the timer for every active fossil
scoreboard players add @e[tag=amber_fossil] fossil_timer 1


# SUFFOCATION DAMAGE (every 2 seconds)
execute if score @s eternity_timer matches 1180 run function gems:amber/suffocate
execute if score @s eternity_timer matches 1140 run function gems:amber/suffocate
execute if score @s eternity_timer matches 1100 run function gems:amber/suffocate
execute if score @s eternity_timer matches 1060 run function gems:amber/suffocate
execute if score @s eternity_timer matches 1020 run function gems:amber/suffocate
execute if score @s eternity_timer matches 980 run function gems:amber/suffocate
execute if score @s eternity_timer matches 940 run function gems:amber/suffocate
execute if score @s eternity_timer matches 900 run function gems:amber/suffocate
execute if score @s eternity_timer matches 860 run function gems:amber/suffocate
execute if score @s eternity_timer matches 820 run function gems:amber/suffocate
execute if score @s eternity_timer matches 780 run function gems:amber/suffocate
execute if score @s eternity_timer matches 740 run function gems:amber/suffocate
execute if score @s eternity_timer matches 700 run function gems:amber/suffocate
execute if score @s eternity_timer matches 660 run function gems:amber/suffocate
execute if score @s eternity_timer matches 620 run function gems:amber/suffocate
execute if score @s eternity_timer matches 580 run function gems:amber/suffocate
execute if score @s eternity_timer matches 540 run function gems:amber/suffocate
execute if score @s eternity_timer matches 500 run function gems:amber/suffocate
execute if score @s eternity_timer matches 460 run function gems:amber/suffocate
execute if score @s eternity_timer matches 420 run function gems:amber/suffocate
execute if score @s eternity_timer matches 380 run function gems:amber/suffocate
execute if score @s eternity_timer matches 340 run function gems:amber/suffocate
execute if score @s eternity_timer matches 300 run function gems:amber/suffocate
execute if score @s eternity_timer matches 260 run function gems:amber/suffocate
execute if score @s eternity_timer matches 220 run function gems:amber/suffocate
execute if score @s eternity_timer matches 180 run function gems:amber/suffocate
execute if score @s eternity_timer matches 140 run function gems:amber/suffocate
execute if score @s eternity_timer matches 100 run function gems:amber/suffocate
execute if score @s eternity_timer matches 60 run function gems:amber/suffocate
execute if score @s eternity_timer matches 20 run function gems:amber/suffocate

# COUNT KILLS (track how many died in time stop)
execute at @s as @e[distance=0.1..25,tag=time_frozen,nbt={Health:0.0f}] run scoreboard players add @p[tag=amber_master] amber_kills 1

# Ambient sound
execute if score @s eternity_timer matches 1100 run playsound block.honey_block.slide master @a ~ ~ ~ 0.8 0.5
execute if score @s eternity_timer matches 600 run playsound entity.elder_guardian.curse master @a ~ ~ ~ 1 0.8
