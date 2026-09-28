# ==========================================
# MAXIMUM EFFICIENCY MAINTAINED
# ==========================================

# MASSIVE mechanical/energy aura
particle firework ~ ~1 ~ 6 7 6 1 150 force
particle end_rod ~ ~1 ~ 5 6 5 0.5 100 force
particle electric_spark ~ ~1 ~ 5 6 5 1 120 force
particle glow ~ ~1 ~ 4 5 4 0.5 80 force
particle cloud ~ ~1 ~ 3 4 3 0.2 60 force

# Speed lines (motion blur effect)
particle firework ~ ~1 ~ 10 0.5 10 0.5 40 force
particle end_rod ~ ~1 ~ 8 0.5 8 0.3 30 force

# Vertical energy pillar every 5 seconds
execute if score @s overclock_timer matches 1190 run particle firework ~ ~1 ~ 0.5 90 0.5 0 1500 force
execute if score @s overclock_timer matches 1190 run particle electric_spark ~ ~1 ~ 0.5 90 0.5 0 1000 force
execute if score @s overclock_timer matches 1190 run playsound block.beacon.power_select master @a ~ ~ ~ 2 2

# Orbital energy cores (machine precision)
execute rotated ~ 0 run particle firework ^15 ^3 ^0 0.2 3 0.2 0.3 20 force
execute rotated ~30 0 run particle electric_spark ^15 ^3 ^0 0.2 3 0.2 0.5 15 force
execute rotated ~60 0 run particle end_rod ^15 ^3 ^0 0.2 3 0.2 0.2 10 force
execute rotated ~90 0 run particle firework ^15 ^3 ^0 0.2 3 0.2 0.3 20 force
execute rotated ~120 0 run particle electric_spark ^15 ^3 ^0 0.2 3 0.2 0.5 15 force
execute rotated ~150 0 run particle end_rod ^15 ^3 ^0 0.2 3 0.2 0.2 10 force
execute rotated ~180 0 run particle firework ^15 ^3 ^0 0.2 3 0.2 0.3 20 force
execute rotated ~210 0 run particle electric_spark ^15 ^3 ^0 0.2 3 0.2 0.5 15 force
execute rotated ~240 0 run particle end_rod ^15 ^3 ^0 0.2 3 0.2 0.2 10 force
execute rotated ~270 0 run particle firework ^15 ^3 ^0 0.2 3 0.2 0.3 20 force
execute rotated ~300 0 run particle electric_spark ^15 ^3 ^0 0.2 3 0.2 0.5 15 force
execute rotated ~330 0 run particle end_rod ^15 ^3 ^0 0.2 3 0.2 0.2 10 force

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..30,tag=!overclock_immune] unless entity @s[tag=time_slowed] run tag @s add time_slowed
execute at @s as @e[distance=0.1..30,tag=time_slowed] unless score @s overclock_hits matches 0.. run scoreboard players set @s overclock_hits 0

# Slowed effect particles
execute at @s as @e[distance=0.1..30,tag=time_slowed] at @s run particle firework ~ ~1 ~ 0.3 0.8 0.3 0.2 8 force
execute at @s as @e[distance=0.1..30,tag=time_slowed] at @s run particle electric_spark ~ ~1.5 ~ 0.2 0.6 0.2 0.3 6 force
execute at @s as @e[distance=0.1..30,tag=time_slowed] at @s run particle cloud ~ ~1 ~ 0.2 0.5 0.2 0.05 5 force

# RAPID STRIKE DAMAGE (every 0.5 seconds - 10 ticks)
# This creates 120 damage instances over 60 seconds
execute if score @s overclock_timer matches 1195 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1185 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1175 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1165 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1155 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1145 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1135 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1125 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1115 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1105 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1095 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1085 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1075 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1065 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1055 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1045 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1035 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1025 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1015 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 1005 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 995 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 985 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 975 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 965 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 955 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 945 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 935 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 925 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 915 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 905 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 895 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 885 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 875 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 865 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 855 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 845 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 835 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 825 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 815 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 805 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 795 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 785 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 775 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 765 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 755 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 745 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 735 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 725 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 715 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 705 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 695 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 685 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 675 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 665 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 655 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 645 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 635 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 625 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 615 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 605 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 595 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 585 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 575 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 565 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 555 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 545 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 535 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 525 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 515 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 505 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 495 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 485 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 475 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 465 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 455 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 445 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 435 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 425 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 415 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 405 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 395 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 385 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 375 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 365 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 355 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 345 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 335 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 325 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 315 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 305 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 295 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 285 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 275 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 265 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 255 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 245 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 235 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 225 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 215 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 205 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 195 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 185 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 175 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 165 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 155 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 145 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 135 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 125 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 115 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 105 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 95 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 85 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 75 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 65 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 55 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 45 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 35 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 25 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 15 run function gems:quartz/rapid_strike
execute if score @s overclock_timer matches 5 run function gems:quartz/rapid_strike

# MAINTAIN TIME DILATION
execute at @s as @e[distance=0.1..30,tag=time_slowed] run effect give @s slowness 2 4 true
execute at @s as @e[distance=0.1..30,tag=time_slowed] run effect give @s mining_fatigue 2 4 true
execute at @s as @e[distance=0.1..30,tag=time_slowed] run effect give @s weakness 2 2 true
execute at @s as @e[distance=0.1..30,tag=time_slowed] run effect give @s jump_boost 2 250 true

# COUNT KILLS
execute at @s as @e[distance=0.1..30,tag=time_slowed,nbt={Health:0.0f}] run scoreboard players add @p[tag=overclock_master] overclock_kills 1

# Ambient sound (machine hum)
execute if score @s overclock_timer matches 1100 run playsound block.beacon.ambient master @a ~ ~ ~ 1.5 2
execute if score @s overclock_timer matches 600 run playsound block.conduit.ambient master @a ~ ~ ~ 1.5 2