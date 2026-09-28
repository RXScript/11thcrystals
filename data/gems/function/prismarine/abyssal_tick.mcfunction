# ==========================================
# THE ABYSS SURROUNDS YOU
# ==========================================

# MASSIVE ocean aura
particle splash ~ ~1 ~ 7 8 7 1.5 75 force
particle entity_effect{color:[0.0,0.7,1.0,1]} ~ ~1 ~ 6 7 6 1 30 force
particle bubble ~ ~1 ~ 6 7 6 0.8 120 force
particle glow ~ ~1 ~ 5 6 5 0.5 80 force
particle dust{color:[0.0,0.7,1.0],scale:2} ~ ~1 ~ 5 6 5 0.8 100 force
particle end_rod ~ ~1 ~ 4 5 4 0.2 60 force

# Ocean floor
particle splash ~ ~0.1 ~ 8 0.1 8 0.5 80 force
particle bubble ~ ~0.1 ~ 7 0.1 7 0.3 60 force

# Vertical water column every 5 seconds
execute if score @s abyssal_timer matches 1190 run particle falling_water ~ ~1 ~ 0.5 80 0.5 0 1200 force
execute if score @s abyssal_timer matches 1190 run particle splash ~ ~1 ~ 0.5 80 0.5 0 1000 force
execute if score @s abyssal_timer matches 1190 run playsound block.water.ambient master @a ~ ~ ~ 2 0.5

# Orbital water currents (ocean circulation)
execute rotated ~ 0 run particle splash ^15 ^3 ^0 0.3 3 0.3 0.8 30 force
execute rotated ~60 0 run particle bubble ^15 ^3 ^0 0.3 3 0.3 0.5 25 force
execute rotated ~120 0 run particle falling_water ^15 ^3 ^0 0.3 3 0.3 0.5 20 force
execute rotated ~180 0 run particle splash ^15 ^3 ^0 0.3 3 0.3 0.8 30 force
execute rotated ~240 0 run particle bubble ^15 ^3 ^0 0.3 3 0.3 0.5 25 force
execute rotated ~300 0 run particle falling_water ^15 ^3 ^0 0.3 3 0.3 0.5 20 force

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..30,tag=!abyssal_immune] unless entity @s[tag=drowning_target] run tag @s add drowning_target
execute at @s as @e[distance=0.1..30,tag=drowning_target] unless score @s pressure_damage matches 0.. run scoreboard players set @s pressure_damage 0

# Drowning particles on targets
execute at @s as @e[distance=0.1..30,tag=drowning_target] at @s run particle splash ~ ~1 ~ 0.4 0.8 0.4 0.5 15 force
execute at @s as @e[distance=0.1..30,tag=drowning_target] at @s run particle bubble ~ ~1.5 ~ 0.3 0.6 0.3 0.3 12 force
execute at @s as @e[distance=0.1..30,tag=drowning_target] at @s run particle falling_water ~ ~2 ~ 0.3 0.5 0.3 0.2 10 force

# CRUSHING PRESSURE (every 2 seconds - 40 ticks)
execute if score @s abyssal_timer matches 1180 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 1140 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 1100 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 1060 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 1020 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 980 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 940 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 900 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 860 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 820 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 780 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 740 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 700 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 660 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 620 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 580 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 540 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 500 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 460 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 420 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 380 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 340 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 300 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 260 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 220 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 180 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 140 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 100 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 60 run function gems:prismarine/crushing_pressure
execute if score @s abyssal_timer matches 20 run function gems:prismarine/crushing_pressure

# GUARDIAN BEAM (every 4 seconds - 80 ticks)
execute if score @s abyssal_timer matches 1176 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 1096 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 1016 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 936 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 856 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 776 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 696 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 616 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 536 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 456 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 376 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 296 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 216 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 136 run function gems:prismarine/guardian_beam
execute if score @s abyssal_timer matches 56 run function gems:prismarine/guardian_beam

# MAINTAIN DROWNING DEBUFFS
execute at @s as @e[distance=0.1..30,tag=drowning_target] run effect give @s slowness 3 2 true
execute at @s as @e[distance=0.1..30,tag=drowning_target] run effect give @s mining_fatigue 3 2 true
execute at @s as @e[distance=0.1..30,tag=drowning_target] run effect give @s weakness 3 1 true

# COUNT KILLS
execute at @s as @e[distance=0.1..30,tag=drowning_target,nbt={Health:0.0f}] run scoreboard players add @p[tag=abyssal_master] abyssal_kills 1

# Ambient sound (ocean depths)
execute if score @s abyssal_timer matches 1100 run playsound block.water.ambient master @a ~ ~ ~ 1.5 0.5
execute if score @s abyssal_timer matches 600 run playsound entity.guardian.ambient master @a ~ ~ ~ 1.5 0.8