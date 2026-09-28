execute unless entity @s[tag=has_amber] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amber] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amber] run return fail

# ==========================================
# AMBER ULTIMATE: "FOSSILIZED ETERNITY"
# 10 Minute Cooldown - 500 Mastery Points
# "Time stops. You remain. They are preserved."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ TIME FLOWS AGAIN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a[distance=0.1..100] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"gold","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0.1..100] subtitle {"text":"HAS FROZEN TIME ITSELF","color":"#FFD700","bold":true}
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"       ⬥ FOSSILIZED ETERNITY AWAKENED ⬥","color":"#FFD700","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"          ","color":"gray"},{"selector":"@s","color":"gold"},{"text":" halts the flow of time","color":"gray"}]
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# 3. ACTIVATION SEQUENCE - TIME STOPS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 8 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 30 force
execute at @s run particle dripping_honey ~ ~5 ~ 10 10 10 1 1000 force
execute at @s run particle falling_honey ~ ~5 ~ 8 8 8 1 800 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 1.5 500 force
execute at @s run particle enchant ~ ~1 ~ 6 6 6 2 800 force
execute at @s run particle firework ~ ~1 ~ 5 5 5 0.5 400 force
execute at @s run particle glow ~ ~1 ~ 6 6 6 0.3 600 force

# Amber dome appearance (visual prison)
execute at @s run particle falling_honey ~ ~1 ~ 0 10 0 0.5 500 force
execute at @s run particle falling_honey ~ ~1 ~ 10 5 0 0.5 300 force
execute at @s run particle falling_honey ~ ~1 ~ -10 5 0 0.5 300 force
execute at @s run particle falling_honey ~ ~1 ~ 0 5 10 0.5 300 force
execute at @s run particle falling_honey ~ ~1 ~ 0 5 -10 0.5 300 force

# Vertical pillars of amber
execute at @s run particle falling_honey ~ ~1 ~ 0.5 50 0.5 0 400 force
execute at @s run particle dripping_honey ~ ~30 ~ 8 5 8 0.5 800 force

# 4. MASSIVE TIME STOP WAVE
execute at @s run particle sweep_attack ~ ~1 ~ 15 0.1 15 1 200 force
execute at @s run particle cloud ~ ~0.1 ~ 15 0.1 15 0.8 500 force
execute at @s run particle explosion ~ ~1 ~ 15 0.1 15 1 150 force
execute at @s run particle end_rod ~ ~1 ~ 12 8 12 0.5 600 force

# 5. TAG SYSTEM (prevent self-freeze)
tag @s add amber_master
tag @s add time_immune

# 6. FREEZE ALL ENTITIES AND PLAYERS (except caster)
execute at @s as @e[distance=0.1..25,tag=!time_immune,type=!block_display] run tag @s add time_frozen
execute at @s as @e[distance=0.1..25,tag=time_frozen] run effect give @s slowness 60 255 true
execute at @s as @e[distance=0.1..25,tag=time_frozen] run effect give @s jump_boost 60 250 true
execute at @s as @e[distance=0.1..25,tag=time_frozen] run effect give @s mining_fatigue 60 255 true
execute at @s as @e[distance=0.1..25,tag=time_frozen] run effect give @s weakness 60 255 true
execute at @s as @e[distance=0.1..25,tag=time_frozen] run effect give @s levitation 3 1 true

# Visual feedback for frozen entities
execute at @s as @e[distance=0.1..25,tag=time_frozen] at @s run particle falling_honey ~ ~2 ~ 0.5 1 0.5 0.5 50 force
execute at @s as @e[distance=0.1..25,tag=time_frozen] at @s run particle dripping_honey ~ ~2 ~ 0.5 1 0.5 0 30 force
execute at @s as @e[distance=0.1..25,tag=time_frozen] at @s run particle glow ~ ~1 ~ 0.3 0.8 0.3 0 20 force

execute at @s as @e[distance=0.1..25,tag=time_frozen] at @s run summon block_display ~ ~ ~ {Tags:["amber_fossil"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.5f,3f,1.5f],translation:[-0.6f,-0.1f,-0.6f]},block_state:{Name:"minecraft:honey_block"}}
execute at @s as @e[distance=0.1..25,tag=time_frozen,tag=!has_display] at @s run tag @s add has_display

# 7. EPIC SOUND SEQUENCE
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.conduit.activate master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.elder_guardian.curse master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 2 2
execute at @s run playsound entity.warden.heartbeat master @a ~ ~ ~ 2 0.5
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 0.8
execute at @s run playsound block.honey_block.place master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.evoker.prepare_summon master @a ~ ~ ~ 2 0.8

# 8. GIVE CASTER BUFFS (60 seconds)
effect give @s speed 60 2 true
effect give @s strength 60 3 true
effect give @s resistance 60 2 true
effect give @s regeneration 60 2 true
effect give @s absorption 60 9 true
effect give @s fire_resistance 60 0 true
effect give @s night_vision 60 0 true

# 9. APPLY ETERNITY TAG
tag @s add fossilized_eternity
scoreboard players set @s eternity_timer 1200
scoreboard players set @s amber_kills 0

# 10. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 11. NOTIFY FROZEN TARGETS
execute as @e[tag=time_frozen,type=player] run title @s title {"text":"⏸ FROZEN IN TIME ⏸","color":"gold","bold":true}
execute as @e[tag=time_frozen,type=player] run title @s subtitle {"text":"You are preserved in amber","color":"#FFD700","italic":true}

# 12. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━     ","color":"gold","bold":true}]
tellraw @s [{"text":"     ⬥ FOSSILIZED ETERNITY ⬥","color":"#FFD700","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• 25-block Time Stop radius","color":"gold"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• All enemies completely frozen","color":"gold"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength IV while time is stopped","color":"gold"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Speed III to move freely","color":"gold"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Suffocation damage every 2 seconds","color":"gold"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Final Shatter on expiration","color":"red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"Time belongs to you. They are fossils.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━          ","color":"gold","bold":true}]