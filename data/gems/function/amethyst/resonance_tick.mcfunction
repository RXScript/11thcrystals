# ==========================================
# THE RESONANCE INTENSIFIES
# ==========================================

# MASSIVE purple sonic aura
particle dust{color:[0.5,0.0,1.0],scale:1} ~ ~1 ~ 5 6 5 2 100 force
particle dragon_breath ~ ~1 ~ 4 5 4 0.5 100 force
particle witch ~ ~1 ~ 4 5 4 0.8 80 force
particle sonic_boom ~ ~1 ~ 3 3 3 0 15 force
particle end_rod ~ ~1 ~ 3 4 3 0.2 40 force
particle enchant ~ ~1 ~ 3 4 3 1 60 force
particle reverse_portal ~ ~1 ~ 3 4 3 1 80 force

# Pulsing ground waves
particle portal ~ ~0.1 ~ 6 0.1 6 0.5 50 force
particle dragon_breath ~ ~0.1 ~ 5 0.1 5 0.3 40 force

# Vertical beam every 5 seconds
execute if score @s resonance_timer matches 1190 run particle dust{color:[0.5,0.0,1.0],scale:1} ~ ~1 ~ 0.4 60 0.4 0 150 force
execute if score @s resonance_timer matches 1190 run particle sonic_boom ~ ~20 ~ 0 0 0 0 10 force
execute if score @s resonance_timer matches 1190 run playsound entity.warden.sonic_boom master @a ~ ~ ~ 2 1.5

# Orbital sonic rings (vibration waves)
execute rotated ~ 0 run particle portal ^18 ^3 ^0 0.3 3 0.3 1 20 force
execute rotated ~60 0 run particle portal ^18 ^3 ^0 0.3 3 0.3 1 20 force
execute rotated ~120 0 run particle portal ^18 ^3 ^0 0.3 3 0.3 1 20 force
execute rotated ~180 0 run particle portal ^18 ^3 ^0 0.3 3 0.3 1 20 force
execute rotated ~240 0 run particle portal ^18 ^3 ^0 0.3 3 0.3 1 20 force
execute rotated ~300 0 run particle portal ^18 ^3 ^0 0.3 3 0.3 1 20 force

# MAINTAIN MARKS on entities in range
execute at @s as @e[distance=0.1..35,tag=!sonic_immune] unless entity @s[tag=resonance_target] run tag @s add resonance_target
execute at @s as @e[distance=0.1..35,tag=resonance_target] unless score @s resonance_stacks matches 0.. run scoreboard players set @s resonance_stacks 0

# Vibration particles on marked targets
execute at @s as @e[distance=0.1..35,tag=resonance_target] at @s run particle portal ~ ~1 ~ 0.4 0.8 0.4 0.5 8 force
execute at @s as @e[distance=0.1..35,tag=resonance_target] at @s run particle dragon_breath ~ ~1 ~ 0.3 0.6 0.3 0.1 5 force
execute at @s as @e[distance=0.1..35,tag=resonance_target] at @s run particle witch ~ ~1.5 ~ 0.2 0.4 0.2 0 3 force
# Dripstone 1 - Front (0 degrees) - Longer, wider, deeper
execute at @s as @e[distance=0.1..35,tag=!has_spike,tag=resonance_target,type=!armor_stand,type=!block_display] at @s run summon armor_stand ~ ~ ~ {Tags:["amethyst_spike","has_spike","sonic_immune"],Invisible:1b,NoGravity:1b,Marker:1b,Passengers:[{id:"minecraft:block_display",Tags:["amethyst_spike","has_spike","sonic_immune"],block_state:{Name:"minecraft:pointed_dripstone",Properties:{vertical_direction:"up"}},transformation:{left_rotation:[-0.2588f,0f,0f,0.9659f],right_rotation:[0f,0f,0f,1f],scale:[0.7f,5.0f,0.7f],translation:[-0.35f,-2.5f,0.70f]},brightness:{sky:15,block:15}}]}

# Dripstone 2 - Front-Right (72 degrees) - Longer, wider, deeper
execute at @s as @e[distance=0.1..35,tag=!has_spike,tag=resonance_target,type=!armor_stand,type=!block_display] at @s run summon armor_stand ~ ~ ~ {Tags:["amethyst_spike","has_spike","sonic_immune"],Invisible:1b,NoGravity:1b,Marker:1b,Passengers:[{id:"minecraft:block_display",Tags:["amethyst_spike","has_spike","sonic_immune"],block_state:{Name:"minecraft:pointed_dripstone",Properties:{vertical_direction:"up"}},transformation:{left_rotation:[-0.080f,0f,0.246f,0.9659f],right_rotation:[0f,0f,0f,1f],scale:[0.7f,5.0f,0.7f],translation:[0.64f,-2.5f,-0.03f]},brightness:{sky:15,block:15}}]}

# Dripstone 3 - Back-Right (144 degrees) - Longer, wider, deeper
execute at @s as @e[distance=0.1..35,tag=!has_spike,tag=resonance_target,type=!armor_stand,type=!block_display] at @s run summon armor_stand ~ ~ ~ {Tags:["amethyst_spike","has_spike","sonic_immune"],Invisible:1b,NoGravity:1b,Marker:1b,Passengers:[{id:"minecraft:block_display",Tags:["amethyst_spike","has_spike","sonic_immune"],block_state:{Name:"minecraft:pointed_dripstone",Properties:{vertical_direction:"up"}},transformation:{left_rotation:[0.209f,0f,0.152f,0.9659f],right_rotation:[0f,0f,0f,1f],scale:[0.7f,5.0f,0.7f],translation:[0.27f,-2.5f,-1.20f]},brightness:{sky:15,block:15}}]}

# Amethyst 1 - Back-Left (216 degrees) - Longer, wider, deeper
execute at @s as @e[distance=0.1..35,tag=!has_spike,tag=resonance_target,type=!armor_stand,type=!block_display] at @s run summon armor_stand ~ ~ ~ {Tags:["amethyst_spike","has_spike","sonic_immune"],Invisible:1b,NoGravity:1b,Marker:1b,Passengers:[{id:"minecraft:block_display",Tags:["amethyst_spike","has_spike","sonic_immune"],block_state:{Name:"minecraft:amethyst_cluster",Properties:{facing:"up"}},transformation:{left_rotation:[0.209f,0f,-0.152f,0.9659f],right_rotation:[0f,0f,0f,1f],scale:[0.9f,4.5f,0.9f],translation:[-1.07f,-2.5f,-1.30f]},brightness:{sky:15,block:15}}]}

# Amethyst 2 - Front-Left (288 degrees) - Longer, wider, deeper
execute at @s as @e[distance=0.1..35,tag=!has_spike,tag=resonance_target,type=!armor_stand,type=!block_display] at @s run summon armor_stand ~ ~ ~ {Tags:["amethyst_spike","has_spike","sonic_immune"],Invisible:1b,NoGravity:1b,Marker:1b,Passengers:[{id:"minecraft:block_display",Tags:["amethyst_spike","has_spike","sonic_immune"],block_state:{Name:"minecraft:amethyst_cluster",Properties:{facing:"up"}},transformation:{left_rotation:[-0.080f,0f,-0.246f,0.9659f],right_rotation:[0f,0f,0f,1f],scale:[0.9f,4.5f,0.9f],translation:[-1.44f,-2.5f,-0.13f]},brightness:{sky:15,block:15}}]}
execute at @s as @e[distance=0.1..35,tag=resonance_target,tag=!has_spike] at @s run tag @s add has_spike
# 1. Individual Following: Each target "pulls" the nearest amber fossil to its location
# This prevents clumping because each mob only teleports the single closest block display
execute as @e[tag=resonance_target,tag=has_spike] at @s run tp @e[type=armor_stand,tag=amethyst_spike,sort=nearest,limit=5] ~ ~1.8 ~

tag @e[tag=amethyst_spike] add sonic_immune
tag @e[tag=amethyst_spike] remove resonance_target

# SONIC PULSE DAMAGE (every 1.5 seconds - 30 ticks)
execute if score @s resonance_timer matches 1185 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 1155 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 1125 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 1095 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 1065 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 1035 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 1005 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 975 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 945 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 915 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 885 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 855 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 825 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 795 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 765 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 735 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 705 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 675 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 645 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 615 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 585 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 555 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 525 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 495 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 465 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 435 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 405 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 375 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 345 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 315 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 285 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 255 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 225 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 195 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 165 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 135 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 105 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 75 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 45 run function gems:amethyst/sonic_pulse
execute if score @s resonance_timer matches 15 run function gems:amethyst/sonic_pulse

# ARMOR SHATTER (every 5 seconds)
execute if score @s resonance_timer matches 1175 run function gems:amethyst/armor_shatter
execute if score @s resonance_timer matches 975 run function gems:amethyst/armor_shatter
execute if score @s resonance_timer matches 775 run function gems:amethyst/armor_shatter
execute if score @s resonance_timer matches 575 run function gems:amethyst/armor_shatter
execute if score @s resonance_timer matches 375 run function gems:amethyst/armor_shatter
execute if score @s resonance_timer matches 175 run function gems:amethyst/armor_shatter

# COUNT KILLS
execute at @s as @e[distance=0.1..35,tag=resonance_target,nbt={Health:0.0f}] run scoreboard players add @p[tag=resonance_master] resonance_kills 1

# Ambient sound (constant low frequency hum)
execute if score @s resonance_timer matches 1100 run playsound block.respawn_anchor.ambient master @a ~ ~ ~ 1 0.5
execute if score @s resonance_timer matches 600 run playsound entity.warden.heartbeat master @a ~ ~ ~ 1.5 0.8