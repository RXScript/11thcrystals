execute unless entity @s[tag=has_prismarine] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_prismarine] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_prismarine] run return fail

# ==========================================
# PRISMARINE ELITE: "TIDAL DEBT"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Don't collect debt → Drown
# HIGH REWARD: Collect enough → Tidal devastation
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ TIDE DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..30] title [{"text":"⬥ ","color":"dark_aqua","bold":true},{"selector":"@s","color":"dark_aqua","bold":true},{"text":" ⬥","color":"dark_aqua","bold":true}]
title @a[distance=0.1..30] subtitle {"text":"COLLECTS THE DEBT","color":"aqua","bold":true}
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @a[distance=0.1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"dark_aqua"},{"text":" activates TIDAL DEBT","color":"gray"}]
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle splash ~ ~1 ~ 10 10 10 2 2000 force
execute at @s run particle falling_water ~ ~1 ~ 8 8 8 1.5 1500 force
execute at @s run particle bubble ~ ~1 ~ 8 8 8 1 1200 force
execute at @s run particle glow ~ ~1 ~ 6 6 6 0.5 800 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 1 600 force

# Vertical water pillar
execute at @s run particle falling_water ~ ~1 ~ 0.5 60 0.5 0 1200 force
execute at @s run particle splash ~ ~1 ~ 0.5 60 0.5 0 1000 force

# Ground ocean circle
execute at @s run particle splash ~ ~0.1 ~ 12 0.1 12 0 1000 force
execute at @s run particle bubble ~ ~0.1 ~ 10 0.1 10 0 800 force

# 4. SOUND SEQUENCE
execute at @s run playsound entity.elder_guardian.curse master @a ~ ~ ~ 3 1
execute at @s run playsound entity.player.splash.high_speed master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.conduit.activate master @a ~ ~ ~ 3 1
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1

# 5. TAG SYSTEM
tag @s add debt_collector
tag @s add debt_immune
scoreboard players set @s debt_timer 600
scoreboard players set @s debt_collected 0
scoreboard players set @s drowning_damage 0

# 6. MARK ENEMIES - DEBT HOLDERS
execute at @s as @e[distance=0.1..20,tag=!debt_immune] run tag @s add debt_holder
execute at @s store result score @s debt_holder_count if entity @e[distance=0.1..20,tag=debt_holder]

# Visual marking - oceanic binding
execute at @s as @e[distance=0.1..20,tag=debt_holder] at @s run particle splash ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..20,tag=debt_holder] at @s run particle bubble ~ ~1 ~ 0.5 1 0.5 0.3 60 force
execute at @s as @e[distance=0.1..20,tag=debt_holder] at @s run particle falling_water ~ ~2 ~ 0.3 0.3 0.3 0.1 40 force

# 7. APPLY TEMPORARY BUFFS (6 seconds)
effect give @s strength 6 2 true
effect give @s speed 6 1 true
effect give @s water_breathing 6 0 true
effect give @s speed 15 1 true
effect give @s haste 15 1 true

# 8. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 9. NOTIFY MARKED DEBT HOLDERS
execute as @e[tag=debt_holder,type=player] run title @s title {"text":"⚠ DEBT MARKED ⚠","color":"dark_aqua","bold":true}
execute as @e[tag=debt_holder,type=player] run title @s subtitle {"text":"The ocean demands payment","color":"aqua","italic":true}

# 10. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"   ⬥ TIDAL DEBT ⬥","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"6 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Debt Holders: ","color":"gray"},{"score":{"name":"@s","objective":"debt_holder_count"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength III + Speed II","color":"dark_aqua"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"WARNING: ","color":"red","bold":true},{"text":"You are DROWNING!","color":"aqua"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Collect 30+ debt","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Tidal wave + heal drowning","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"< 30 debt collected","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Drown + severe debuffs","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray","italic":true},{"text":"Damage ALL marked enemies to collect!","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]