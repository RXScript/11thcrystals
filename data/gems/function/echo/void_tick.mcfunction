# ==========================================
# THE VOID CONSUMES
# ==========================================

# MASSIVE darkness aura
particle sculk_soul ~ ~1 ~ 7 8 7 1.5 200 force
particle soul_fire_flame ~ ~1 ~ 6 7 6 1 150 force
particle smoke ~ ~1 ~ 6 7 6 0.5 120 force
particle reverse_portal ~ ~1 ~ 5 6 5 1 100 force
particle dragon_breath ~ ~1 ~ 4 5 4 0.5 80 force

# Darkness spreading on ground
particle sculk_soul ~ ~0.1 ~ 8 0.1 8 0.5 80 force
particle soul_fire_flame ~ ~0.1 ~ 7 0.1 7 0.3 60 force
particle smoke ~ ~0.1 ~ 6 0.1 6 0.2 40 force

# Vertical void tear every 5 seconds
execute if score @s void_timer matches 1190 run particle sculk_soul ~ ~1 ~ 0.5 90 0.5 0 1200 force
execute if score @s void_timer matches 1190 run particle sonic_boom ~ ~30 ~ 0 0 0 0 15 force
execute if score @s void_timer matches 1190 run playsound entity.warden.heartbeat master @a ~ ~ ~ 2 0.5

# Orbital void rifts (tears in reality)
execute rotated ~ 0 run particle sculk_soul ^15 ^3 ^0 0.3 3 0.3 1 30 force
execute rotated ~45 0 run particle reverse_portal ^15 ^3 ^0 0.3 3 0.3 0.8 25 force
execute rotated ~90 0 run particle smoke ^15 ^3 ^0 0.3 3 0.3 0.5 20 force
execute rotated ~135 0 run particle sculk_soul ^15 ^3 ^0 0.3 3 0.3 1 30 force
execute rotated ~180 0 run particle reverse_portal ^15 ^3 ^0 0.3 3 0.3 0.8 25 force
execute rotated ~225 0 run particle smoke ^15 ^3 ^0 0.3 3 0.3 0.5 20 force
execute rotated ~270 0 run particle sculk_soul ^15 ^3 ^0 0.3 3 0.3 1 30 force
execute rotated ~315 0 run particle reverse_portal ^15 ^3 ^0 0.3 3 0.3 0.8 25 force

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..30,tag=!void_immune] unless entity @s[tag=sculk_infected] run tag @s add sculk_infected
execute at @s as @e[distance=0.1..30,tag=sculk_infected] unless score @s void_damage matches 0.. run scoreboard players set @s void_damage 0

# Sculk infection particles
execute at @s as @e[distance=0.1..30,tag=sculk_infected] at @s run particle sculk_soul ~ ~1 ~ 0.4 0.8 0.4 0.5 12 force
execute at @s as @e[distance=0.1..30,tag=sculk_infected] at @s run particle soul_fire_flame ~ ~1.5 ~ 0.3 0.6 0.3 0.3 10 force
execute at @s as @e[distance=0.1..30,tag=sculk_infected] at @s run particle smoke ~ ~1 ~ 0.2 0.5 0.2 0.1 8 force

# VOID DECAY (every 1.5 seconds - 30 ticks)
execute if score @s void_timer matches 1185 run function gems:echo/void_decay
execute if score @s void_timer matches 1155 run function gems:echo/void_decay
execute if score @s void_timer matches 1125 run function gems:echo/void_decay
execute if score @s void_timer matches 1095 run function gems:echo/void_decay
execute if score @s void_timer matches 1065 run function gems:echo/void_decay
execute if score @s void_timer matches 1035 run function gems:echo/void_decay
execute if score @s void_timer matches 1005 run function gems:echo/void_decay
execute if score @s void_timer matches 975 run function gems:echo/void_decay
execute if score @s void_timer matches 945 run function gems:echo/void_decay
execute if score @s void_timer matches 915 run function gems:echo/void_decay
execute if score @s void_timer matches 885 run function gems:echo/void_decay
execute if score @s void_timer matches 855 run function gems:echo/void_decay
execute if score @s void_timer matches 825 run function gems:echo/void_decay
execute if score @s void_timer matches 795 run function gems:echo/void_decay
execute if score @s void_timer matches 765 run function gems:echo/void_decay
execute if score @s void_timer matches 735 run function gems:echo/void_decay
execute if score @s void_timer matches 705 run function gems:echo/void_decay
execute if score @s void_timer matches 675 run function gems:echo/void_decay
execute if score @s void_timer matches 645 run function gems:echo/void_decay
execute if score @s void_timer matches 615 run function gems:echo/void_decay
execute if score @s void_timer matches 585 run function gems:echo/void_decay
execute if score @s void_timer matches 555 run function gems:echo/void_decay
execute if score @s void_timer matches 525 run function gems:echo/void_decay
execute if score @s void_timer matches 495 run function gems:echo/void_decay
execute if score @s void_timer matches 465 run function gems:echo/void_decay
execute if score @s void_timer matches 435 run function gems:echo/void_decay
execute if score @s void_timer matches 405 run function gems:echo/void_decay
execute if score @s void_timer matches 375 run function gems:echo/void_decay
execute if score @s void_timer matches 345 run function gems:echo/void_decay
execute if score @s void_timer matches 315 run function gems:echo/void_decay
execute if score @s void_timer matches 285 run function gems:echo/void_decay
execute if score @s void_timer matches 255 run function gems:echo/void_decay
execute if score @s void_timer matches 225 run function gems:echo/void_decay
execute if score @s void_timer matches 195 run function gems:echo/void_decay
execute if score @s void_timer matches 165 run function gems:echo/void_decay
execute if score @s void_timer matches 135 run function gems:echo/void_decay
execute if score @s void_timer matches 105 run function gems:echo/void_decay
execute if score @s void_timer matches 75 run function gems:echo/void_decay
execute if score @s void_timer matches 45 run function gems:echo/void_decay
execute if score @s void_timer matches 15 run function gems:echo/void_decay

# SONIC SCREAM (every 3 seconds - 60 ticks)
execute if score @s void_timer matches 1180 run function gems:echo/sonic_scream
execute if score @s void_timer matches 1120 run function gems:echo/sonic_scream
execute if score @s void_timer matches 1060 run function gems:echo/sonic_scream
execute if score @s void_timer matches 1000 run function gems:echo/sonic_scream
execute if score @s void_timer matches 940 run function gems:echo/sonic_scream
execute if score @s void_timer matches 880 run function gems:echo/sonic_scream
execute if score @s void_timer matches 820 run function gems:echo/sonic_scream
execute if score @s void_timer matches 760 run function gems:echo/sonic_scream
execute if score @s void_timer matches 700 run function gems:echo/sonic_scream
execute if score @s void_timer matches 640 run function gems:echo/sonic_scream
execute if score @s void_timer matches 580 run function gems:echo/sonic_scream
execute if score @s void_timer matches 520 run function gems:echo/sonic_scream
execute if score @s void_timer matches 460 run function gems:echo/sonic_scream
execute if score @s void_timer matches 400 run function gems:echo/sonic_scream
execute if score @s void_timer matches 340 run function gems:echo/sonic_scream
execute if score @s void_timer matches 280 run function gems:echo/sonic_scream
execute if score @s void_timer matches 220 run function gems:echo/sonic_scream
execute if score @s void_timer matches 160 run function gems:echo/sonic_scream
execute if score @s void_timer matches 100 run function gems:echo/sonic_scream
execute if score @s void_timer matches 40 run function gems:echo/sonic_scream

# MAINTAIN SCULK INFECTION
execute at @s as @e[distance=0.1..30,tag=sculk_infected] run effect give @s darkness 3 0 true
execute at @s as @e[distance=0.1..30,tag=sculk_infected] run effect give @s slowness 3 1 true
execute at @s as @e[distance=0.1..30,tag=sculk_infected] run effect give @s weakness 3 1 true

# COUNT KILLS
execute at @s as @e[distance=0.1..30,tag=sculk_infected,nbt={Health:0.0f}] run scoreboard players add @p[tag=void_master] void_kills 1

# Ambient sound (void whispers)
execute if score @s void_timer matches 1100 run playsound entity.warden.heartbeat master @a ~ ~ ~ 1 0.5
execute if score @s void_timer matches 600 run playsound block.sculk.charge master @a ~ ~ ~ 1.5 0.5

tag @s remove scream_marked