execute unless entity @s[tag=has_amethyst] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amethyst] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amethyst] run return fail

# ==========================================
# AMETHYST ULTIMATE: "RESONANT COLLAPSE"
# 10 Minute Cooldown - 500 Mastery Points
# "The universe screams. You are the echo."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ RESONANCE DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a[distance=0.1..100] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"light_purple","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0.1..100] subtitle {"text":"UNLEASHES THE RESONANCE","color":"#9370DB","bold":true}
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"       ⬥ RESONANT COLLAPSE AWAKENED ⬥","color":"#9370DB","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"          ","color":"gray"},{"selector":"@s","color":"light_purple"},{"text":" shatters reality with sound","color":"gray"}]
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]

# 3. ACTIVATION SEQUENCE - SONIC SINGULARITY
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 10 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 40 force
execute at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle portal ~ ~1 ~ 8 8 8 3 1200 force
execute at @s run particle dragon_breath ~ ~1 ~ 6 6 6 1.5 800 force
execute at @s run particle witch ~ ~1 ~ 8 8 8 1 1000 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 2 600 force
execute at @s run particle enchant ~ ~1 ~ 8 8 8 3 1000 force
execute at @s run particle reverse_portal ~ ~1 ~ 6 6 6 2 800 force

# Vertical sonic beam (visible from afar)
execute at @s run particle portal ~ ~1 ~ 0.5 60 0.5 0 800 force
execute at @s run particle dragon_breath ~ ~1 ~ 0.5 60 0.5 0 600 force
execute at @s run particle sonic_boom ~ ~10 ~ 0 0 0 0 10 force
execute at @s run particle sonic_boom ~ ~20 ~ 0 0 0 0 10 force
execute at @s run particle sonic_boom ~ ~30 ~ 0 0 0 0 10 force

# Expanding sonic rings
execute at @s run particle portal ~ ~1 ~ 12 0.1 12 0 500 force
execute at @s run particle witch ~ ~1 ~ 15 0.1 15 0 600 force

# 4. INITIAL SONIC SHOCKWAVE
execute at @s run particle sweep_attack ~ ~1 ~ 18 0.1 18 1 250 force
execute at @s run particle explosion ~ ~1 ~ 18 0.1 18 1 200 force
execute at @s run particle sonic_boom ~ ~1 ~ 10 1 10 0 50 force

# 5. TAG SYSTEM
tag @s add resonance_master
tag @s add sonic_immune

# 6. MARK AND DAMAGE ALL NEARBY ENTITIES
execute at @s as @e[distance=0.1..35,tag=!sonic_immune] run tag @s add resonance_target
execute at @s as @e[distance=0.1..35,tag=resonance_target] run scoreboard players set @s resonance_stacks 0

# Initial massive damage wave
execute at @s as @e[distance=0.1..35,tag=resonance_target] run damage @s 20 player_attack by @p[tag=resonance_master]

# Massive knockback from epicenter
execute at @s as @e[distance=0.1..35,tag=resonance_target] at @s facing entity @p[tag=resonance_master] feet run tp @s ^ ^ ^-5
execute at @s as @e[distance=0.1..35,tag=resonance_target] run effect give @s levitation 2 2 true

# Visual feedback for marked targets
execute at @s as @e[distance=0.1..35,tag=resonance_target] at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 3 force
execute at @s as @e[distance=0.1..35,tag=resonance_target] at @s run particle portal ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s as @e[distance=0.1..35,tag=resonance_target] at @s run particle dragon_breath ~ ~1 ~ 0.5 1 0.5 0.3 50 force

# 7. CATASTROPHIC SOUND SEQUENCE
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 1.0
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 1.5
execute at @s run playsound entity.ender_dragon.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound block.end_portal.spawn master @a ~ ~ ~ 3 1
execute at @s run playsound item.totem.use master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.respawn_anchor.charge master @a ~ ~ ~ 3 2
execute at @s run playsound entity.warden.heartbeat master @a ~ ~ ~ 3 0.5

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

# 8. GIVE CASTER BUFFS (60 seconds)
effect give @s strength 60 1 true
effect give @s speed 60 2 true
effect give @s resistance 60 2 true
effect give @s absorption 60 9 true
effect give @s regeneration 60 2 true
effect give @s fire_resistance 60 0 true
effect give @s slow_falling 60 0 true

# 9. APPLY RESONANCE TAG
tag @s add resonant_collapse
scoreboard players set @s resonance_timer 1200
scoreboard players set @s total_damage_dealt 0
scoreboard players set @s resonance_kills 0

# 10. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 11. NOTIFY MARKED TARGETS
execute as @e[tag=resonance_target,type=player] run title @s title {"text":"⚠ RESONATING ⚠","color":"dark_purple","bold":true}
execute as @e[tag=resonance_target,type=player] run title @s subtitle {"text":"Your atoms are vibrating apart","color":"light_purple","italic":true}

# 12. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━     ","color":"light_purple","bold":true}]
tellraw @s [{"text":"     ⬥ RESONANT COLLAPSE ⬥","color":"#9370DB","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength IV (massive damage)","color":"light_purple"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• 35-block Resonance Zone","color":"light_purple"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Sonic Pulse: 12 damage every 1.5s","color":"light_purple"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Resonance Stacks: Amplifying damage","color":"light_purple"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Armor Shatter: Reduce enemy protection","color":"light_purple"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Final Crescendo: Catastrophic explosion","color":"red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"The universe screams. You are the echo.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━          ","color":"light_purple","bold":true}]