# ==========================================
# THE HARVEST CONTINUES
# ==========================================

# MASSIVE green aura (visible from afar)
particle happy_villager ~ ~1 ~ 8 10 8 1 80 force
particle composter ~ ~1 ~ 3 4 3 0.8 80 force
particle glow ~ ~1 ~ 3 4 3 0.3 60 force
particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~2 ~ 2 3 2 0.5 30 force
particle end_rod ~ ~1 ~ 2 3 2 0.1 20 force
particle enchant ~ ~1 ~ 2.5 3.5 2.5 0.5 40 force

# Growing vines/roots effect
particle composter ~ ~0.1 ~ 4 0.1 4 0.3 30 force
particle happy_villager ~ ~0.1 ~ 3.5 0.1 3.5 0.2 20 force

# Vertical beam every 5 seconds
execute if score @s harvest_timer matches 1190 run particle happy_villager ~ ~1 ~ 0.4 50 0.4 0 300 force
execute if score @s harvest_timer matches 1190 run particle composter ~ ~1 ~ 0.4 50 0.4 0 200 force
execute if score @s harvest_timer matches 1190 run playsound block.grass.break master @a ~ ~ ~ 2 2

# Orbital emerald energy (rotating growth)
execute rotated ~ 0 run particle glow ^15 ^3 ^0 0.2 3 0.2 0.1 10 force
execute rotated ~60 0 run particle glow ^15 ^3 ^0 0.2 3 0.2 0.1 10 force
execute rotated ~120 0 run particle glow ^15 ^3 ^0 0.2 3 0.2 0.1 10 force
execute rotated ~180 0 run particle glow ^15 ^3 ^0 0.2 3 0.2 0.1 10 force
execute rotated ~240 0 run particle glow ^15 ^3 ^0 0.2 3 0.2 0.1 10 force
execute rotated ~300 0 run particle glow ^15 ^3 ^0 0.2 3 0.2 0.1 10 force

# MAINTAIN MARKS on entities in range
execute at @s as @e[distance=0.1..30,tag=!harvest_immune] unless entity @s[tag=life_source] run tag @s add life_source
execute at @s as @e[distance=0.1..30,tag=life_source] run effect give @s glowing 2 0 true

# Draining particles on marked targets
execute at @s as @e[distance=0.1..30,tag=life_source] at @s run particle happy_villager ~ ~1 ~ 0.3 0.8 0.3 0.1 5 force
execute at @s as @e[distance=0.1..30,tag=life_source] at @s run particle composter ~ ~1.5 ~ 0.2 0.5 0.2 0 3 force
execute at @s as @e[distance=0.1..30,tag=life_source] at @s run particle damage_indicator ~ ~1 ~ 0.2 0.5 0.2 0 2 force

execute as @e[tag=life_source,tag=!is_entangled] at @s run function gems:emerald/entangled_display

# PASSIVE LIFE DRAIN (every 2 seconds - 40 ticks)
execute if score @s harvest_timer matches 1180 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 1140 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 1100 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 1060 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 1020 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 980 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 940 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 900 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 860 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 820 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 780 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 740 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 700 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 660 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 620 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 580 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 540 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 500 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 460 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 420 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 380 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 340 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 300 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 260 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 220 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 180 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 140 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 100 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 60 run function gems:emerald/drain_life
execute if score @s harvest_timer matches 20 run function gems:emerald/drain_life

# EFFECT THEFT (every 5 seconds - steal beneficial effects)
execute if score @s harvest_timer matches 1175 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 1075 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 975 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 875 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 775 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 675 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 575 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 475 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 375 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 275 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 175 run function gems:emerald/steal_effects
execute if score @s harvest_timer matches 75 run function gems:emerald/steal_effects

# LIFE DRAIN ON DAMAGE DEALT (when you hurt someone, heal yourself)
execute if entity @s[nbt={HurtTime:1s}] run function gems:emerald/on_hit_heal

# COUNT KILLS
execute at @s as @e[distance=0.1..30,tag=life_source,nbt={Health:0.0f}] run scoreboard players add @p[tag=harvest_master] harvest_kills 1

# Ambient sound
execute if score @s harvest_timer matches 1100 run playsound entity.villager.ambient master @a ~ ~ ~ 0.8 0.5
execute if score @s harvest_timer matches 600 run playsound block.composter.fill_success master @a ~ ~ ~ 1 0.8