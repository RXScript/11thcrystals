execute unless entity @s[tag=has_amber] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amber] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amber] run return fail

# ==========================================
# AMBER ELITE: "RESIN REFLECTION"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Don't absorb enough → Crushed by weight
# HIGH REWARD: Store attacks → Release doubled
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ RESIN DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..30] title [{"text":"⬥ ","color":"gold","bold":true},{"selector":"@s","color":"gold","bold":true},{"text":" ⬥","color":"gold","bold":true}]
title @a[distance=0.1..30] subtitle {"text":"BECOMES THE RESIN","color":"yellow","bold":true}
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @a[distance=0.1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"gold"},{"text":" activates RESIN REFLECTION","color":"gray"}]
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle falling_honey ~ ~1 ~ 10 10 10 2 40 force
execute at @s run particle dust{color:[1.0,0.7,0.0],scale:3} ~ ~1 ~ 8 8 8 1.5 1500 force
execute at @s run particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 8 8 8 1 1200 force
execute at @s run particle glow ~ ~1 ~ 6 6 6 0.5 800 force

# Vertical resin pillar
execute at @s run particle falling_honey ~ ~1 ~ 0.5 60 0.5 0 1200 force
execute at @s run particle dust{color:[1.0,0.7,0.0],scale:2} ~ ~1 ~ 0.5 60 0.5 0 1000 force

# Ground resin circle
execute at @s run particle falling_honey ~ ~0.1 ~ 12 0.1 12 0 1000 force
execute at @s run particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~0.1 ~ 10 0.1 10 0 800 force

# 4. SOUND SEQUENCE
execute at @s run playsound block.honey_block.slide master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1
execute at @s run playsound block.stone.break master @a ~ ~ ~ 2 0.5

# 5. TAG SYSTEM
tag @s add resin_tank
tag @s add resin_immune
scoreboard players set @s resin_timer 260
scoreboard players set @s damage_stored 0
scoreboard players set @s amber_weight_count 0

# 6. STORE CURRENT TOTAL HEALTH (Health + Absorption)
execute store result score #init_health damage_stored run data get entity @s Health 1
execute store result score #init_absorption damage_stored run data get entity @s AbsorptionAmount 1
scoreboard players operation @s health_before = #init_health damage_stored
scoreboard players operation @s health_before += #init_absorption damage_stored

# 7. MARK ENEMIES - REFLECTION SOURCES
execute at @s as @e[distance=0.1..20,tag=!resin_immune] run tag @s add resin_source
execute at @s store result score @s resin_source_count if entity @e[distance=0.1..20,tag=resin_source]

# Visual marking
execute at @s as @e[distance=0.1..20,tag=resin_source] at @s run particle falling_honey ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..20,tag=resin_source] at @s run particle dust{color:[1.0,0.7,0.0],scale:2} ~ ~1 ~ 0.5 1 0.5 0.3 60 force

# 8. APPLY TANK BUFFS (8 seconds)
effect give @s resistance 8 2 true
effect give @s absorption 8 9 true
effect give @s slowness 8 1 true

# 9. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 10. NOTIFY MARKED ENEMIES
execute as @e[tag=resin_source,type=player] run title @s title {"text":"⚠ RESIN TARGET ⚠","color":"gold","bold":true}
execute as @e[tag=resin_source,type=player] run title @s subtitle {"text":"Your attacks feed the amber","color":"yellow","italic":true}

# 11. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"   ⬥ RESIN REFLECTION ⬥","color":"gold","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"8 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Marked Enemies: ","color":"gray"},{"score":{"name":"@s","objective":"resin_source_count"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Resistance III + Absorption X","color":"gold"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"TANK RULE: ","color":"red","bold":true},{"text":"GET HIT by marked enemies!","color":"yellow"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Absorb 40+ damage","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Release DOUBLED damage burst","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"< 40 damage absorbed","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Crushed by resin + debuffs","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

execute as @e[tag=resin_tank] at @s run summon block_display ~ ~ ~ {Tags:["amber_fossil"], transformation:{left_rotation:[0f,0f,0f,1f], right_rotation:[0f,0f,0f,1f], translation:[-0.75f,-0.20f,-0.75f], scale:[1.5f,3f,1.5f]}, block_state:{Name:"minecraft:honey_block"}}