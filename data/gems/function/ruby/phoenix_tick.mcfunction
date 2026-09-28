# ==========================================
# THE PHOENIX BURNS ETERNAL
# ==========================================

# MASSIVE fire aura
particle flame ~ ~1 ~ 6 7 6 0.8 200 force
particle soul_fire_flame ~ ~1 ~ 5 6 5 0.6 150 force
particle smoke ~ ~1 ~ 5 6 5 0.3 100 force
particle lava ~ ~1 ~ 4 5 4 0.5 40 force
particle end_rod ~ ~1 ~ 4 5 4 0.2 60 force
particle firework ~ ~1 ~ 4 5 4 0.5 80 force

# Ground fire
particle flame ~ ~0.1 ~ 7 0.1 7 0.3 80 force
particle soul_fire_flame ~ ~0.1 ~ 6 0.1 6 0.2 60 force

# Vertical phoenix wings every 5 seconds
execute if score @s phoenix_timer matches 1190 run particle flame ~ ~1 ~ 0.5 80 0.5 0 1000 force
execute if score @s phoenix_timer matches 1190 run particle soul_fire_flame ~ ~1 ~ 0.5 80 0.5 0 800 force
execute if score @s phoenix_timer matches 1190 run particle lava ~ ~40 ~ 10 10 10 1 100 force
execute if score @s phoenix_timer matches 1190 run playsound entity.blaze.shoot master @a ~ ~ ~ 3 0.5

# Orbital fire rings (phoenix aura)
execute rotated ~ 0 run particle flame ^15 ^3 ^0 0.3 3 0.3 0.3 30 force
execute rotated ~60 0 run particle soul_fire_flame ^15 ^3 ^0 0.3 3 0.3 0.2 25 force
execute rotated ~120 0 run particle flame ^15 ^3 ^0 0.3 3 0.3 0.3 30 force
execute rotated ~180 0 run particle soul_fire_flame ^15 ^3 ^0 0.3 3 0.3 0.2 25 force
execute rotated ~240 0 run particle flame ^15 ^3 ^0 0.3 3 0.3 0.3 30 force
execute rotated ~300 0 run particle soul_fire_flame ^15 ^3 ^0 0.3 3 0.3 0.2 25 force

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..30,tag=!phoenix_immune] unless entity @s[tag=burning_target] run tag @s add burning_target
execute at @s as @e[distance=0.1..30,tag=burning_target] unless score @s burn_stacks matches 0.. run scoreboard players set @s burn_stacks 0

# Burning particles on targets
execute at @s as @e[distance=0.1..30,tag=burning_target] at @s run particle flame ~ ~1 ~ 0.4 0.8 0.4 0.2 15 force
execute at @s as @e[distance=0.1..30,tag=burning_target] at @s run particle soul_fire_flame ~ ~1.5 ~ 0.3 0.6 0.3 0.1 10 force
execute at @s as @e[distance=0.1..30,tag=burning_target] at @s run particle smoke ~ ~1 ~ 0.2 0.5 0.2 0.05 8 force

# IMMOLATION DAMAGE (every 1.5 seconds - 30 ticks)
execute if score @s phoenix_timer matches 1185 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 1155 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 1125 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 1095 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 1065 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 1035 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 1005 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 975 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 945 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 915 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 885 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 855 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 825 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 795 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 765 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 735 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 705 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 675 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 645 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 615 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 585 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 555 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 525 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 495 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 465 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 435 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 405 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 375 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 345 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 315 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 285 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 255 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 225 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 195 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 165 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 135 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 105 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 75 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 45 run function gems:ruby/immolate
execute if score @s phoenix_timer matches 15 run function gems:ruby/immolate

# Keep targets on fire
execute at @s as @e[distance=0.1..30,tag=burning_target] run data merge entity @s {Fire:100s}

# COUNT KILLS
execute at @s as @e[distance=0.1..30,tag=burning_target,nbt={Health:0.0f}] run scoreboard players add @p[tag=phoenix_master] phoenix_kills 1

# Ambient sound
execute if score @s phoenix_timer matches 1100 run playsound block.fire.ambient master @a ~ ~ ~ 1.5 0.5
execute if score @s phoenix_timer matches 600 run playsound entity.blaze.ambient master @a ~ ~ ~ 1.5 0.8