# ==========================================
# LIGHTNING SPEED ACTIVE
# ==========================================

# MASSIVE redstone/electric aura
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 8 9 8 1.5 140 force
particle electric_spark ~ ~1 ~ 7 8 7 1.5 120 force
particle end_rod ~ ~1 ~ 6 7 6 0.5 75 force
particle glow ~ ~1 ~ 5 6 5 0.5 100 force
particle firework ~ ~1 ~ 5 6 5 0.8 120 force

# Speed trail effect
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 10 0.5 10 0.8 80 force
particle electric_spark ~ ~1 ~ 8 0.5 8 0.5 60 force

# Vertical energy beam every 5 seconds
execute if score @s overclock_timer matches 1190 run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.5 100 0.5 0 1500 force
execute if score @s overclock_timer matches 1190 run particle electric_spark ~ ~1 ~ 0.5 100 0.5 0 1200 force
execute if score @s overclock_timer matches 1190 run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 2 2

# Orbital energy nodes (circuit pattern)
execute rotated ~ 0 run particle dust{color:[1.0,0.0,0.0],scale:2} ^15 ^3 ^0 0.3 3 0.3 0.5 30 force
execute rotated ~60 0 run particle electric_spark ^15 ^3 ^0 0.3 3 0.3 0.8 25 force
execute rotated ~120 0 run particle dust{color:[1.0,0.0,0.0],scale:2} ^15 ^3 ^0 0.3 3 0.3 0.5 30 force
execute rotated ~180 0 run particle electric_spark ^15 ^3 ^0 0.3 3 0.3 0.8 25 force
execute rotated ~240 0 run particle dust{color:[1.0,0.0,0.0],scale:2} ^15 ^3 ^0 0.3 3 0.3 0.5 30 force
execute rotated ~300 0 run particle electric_spark ^15 ^3 ^0 0.3 3 0.3 0.8 25 force

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..30,tag=!redstone_immune] unless entity @s[tag=circuit_target] run tag @s add circuit_target
execute at @s as @e[distance=0.1..30,tag=circuit_target] unless score @s circuit_hits matches 0.. run scoreboard players set @s circuit_hits 0

# Circuit disruption particles on targets
execute at @s as @e[distance=0.1..30,tag=circuit_target] at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.4 0.8 0.4 0.5 15 force
execute at @s as @e[distance=0.1..30,tag=circuit_target] at @s run particle electric_spark ~ ~1.5 ~ 0.3 0.6 0.3 0.3 12 force

# RAPID PULSE (every 0.5 seconds - 10 ticks) - 120 instances
execute if score @s overclock_timer matches 1195 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1185 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1175 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1165 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1155 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1145 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1135 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1125 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1115 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1105 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1095 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1085 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1075 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1065 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1055 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1045 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1035 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1025 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1015 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 1005 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 995 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 985 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 975 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 965 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 955 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 945 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 935 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 925 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 915 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 905 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 895 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 885 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 875 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 865 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 855 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 845 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 835 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 825 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 815 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 805 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 795 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 785 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 775 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 765 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 755 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 745 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 735 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 725 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 715 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 705 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 695 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 685 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 675 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 665 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 655 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 645 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 635 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 625 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 615 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 605 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 595 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 585 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 575 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 565 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 555 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 545 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 535 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 525 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 515 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 505 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 495 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 485 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 475 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 465 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 455 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 445 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 435 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 425 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 415 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 405 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 395 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 385 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 375 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 365 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 355 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 345 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 335 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 325 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 315 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 305 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 295 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 285 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 275 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 265 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 255 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 245 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 235 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 225 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 215 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 205 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 195 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 185 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 175 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 165 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 155 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 145 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 135 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 125 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 115 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 105 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 95 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 85 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 75 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 65 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 55 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 45 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 35 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 25 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 15 run function gems:redstone/rapid_pulse
execute if score @s overclock_timer matches 5 run function gems:redstone/rapid_pulse

# REDSTONE SURGE (every 3 seconds - 60 ticks) - 20 instances
execute if score @s overclock_timer matches 1180 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 1120 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 1060 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 1000 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 940 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 880 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 820 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 760 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 700 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 640 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 580 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 520 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 460 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 400 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 340 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 280 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 220 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 160 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 100 run function gems:redstone/redstone_surge
execute if score @s overclock_timer matches 40 run function gems:redstone/redstone_surge

execute if score @s overclock_timer matches 1200 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 1100 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 1000 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 900 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 800 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 700 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 600 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 500 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 400 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 300 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 200 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~
execute if score @s overclock_timer matches 100 run execute as @e[distance=0.1..30,tag=circuit_target] at @s run summon lightning_bolt ~ ~ ~

# MAINTAIN CIRCUIT DISRUPTION
execute at @s as @e[distance=0.1..30,tag=circuit_target] run effect give @s slowness 3 4 true
execute at @s as @e[distance=0.1..30,tag=circuit_target] run effect give @s mining_fatigue 3 3 true
execute at @s as @e[distance=0.1..30,tag=circuit_target] run effect give @s weakness 3 2 true

# COUNT KILLS
execute at @s as @e[distance=0.1..30,tag=circuit_target,nbt={Health:0.0f}] run scoreboard players add @p[tag=redstone_master] overclock_kills 1

# Ambient sound (electric hum)
execute if score @s overclock_timer matches 1100 run playsound block.redstone_torch.burnout master @a ~ ~ ~ 1 2
execute if score @s overclock_timer matches 600 run playsound entity.creeper.primed master @a ~ ~ ~ 1.5 2