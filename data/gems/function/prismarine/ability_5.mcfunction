execute unless entity @s[tag=has_prismarine] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_prismarine] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_prismarine] run return fail

# ==========================================
# PRISMARINE ULTIMATE: "ABYSSAL DOMINION"
# 10 Minute Cooldown - 500 Mastery Points
# "The ocean never forgets. You are the debt collector."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ OCEAN DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a[distance=0.1..100] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"dark_aqua","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0.1..100] subtitle {"text":"SUMMONS THE ABYSS","color":"#00CED1","bold":true}
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"       ⬥ ABYSSAL DOMINION AWAKENED ⬥","color":"#00CED1","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"          ","color":"gray"},{"selector":"@s","color":"dark_aqua"},{"text":" becomes the ocean's wrath","color":"gray"}]
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]

# 3. ACTIVATION SEQUENCE - OCEAN RISING
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 70 force
execute at @s run particle splash ~ ~1 ~ 12 12 12 2 2000 force
execute at @s run particle falling_water ~ ~5 ~ 10 10 10 1.5 1500 force
execute at @s run particle bubble ~ ~1 ~ 10 10 10 1 1200 force
execute at @s run particle glow ~ ~1 ~ 10 10 10 0.8 1000 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 2 800 force
execute at @s run particle rain ~ ~1 ~ 10 10 10 1 800 force

# Vertical water pillar (ocean rising from depths)
execute at @s run particle falling_water ~ ~1 ~ 0.5 80 0.5 0 1500 force
execute at @s run particle splash ~ ~1 ~ 0.5 80 0.5 0 1200 force
execute at @s run particle bubble ~ ~1 ~ 0.5 80 0.5 0 1000 force

# Tidal wave on ground
execute at @s run particle splash ~ ~0.1 ~ 15 0.1 15 1 1000 force
execute at @s run particle falling_water ~ ~0.1 ~ 12 0.1 12 0.8 800 force
execute at @s run particle bubble ~ ~0.1 ~ 10 0.1 10 0.5 600 force

# 4. INITIAL CRUSHING WAVE
execute at @s run particle sweep_attack ~ ~1 ~ 20 0.1 20 1 350 force
execute at @s run particle explosion ~ ~1 ~ 20 0.1 20 1 300 force
execute at @s run particle splash ~ ~1 ~ 15 5 15 2 1500 force

# 5. TAG SYSTEM
tag @s add abyssal_master
tag @s add abyssal_immune

# 6. MARK ALL NEARBY ENTITIES - DROWNING TARGETS
execute at @s as @e[distance=0.1..30,tag=!abyssal_immune] run tag @s add drowning_target
execute at @s as @e[distance=0.1..30,tag=drowning_target] run scoreboard players set @s pressure_damage 0

# Initial massive damage wave
execute at @s as @e[distance=0.1..30,tag=drowning_target] run damage @s 25 player_attack by @p[tag=abyssal_master]

# Apply drowning effects
execute at @s as @e[distance=0.1..30,tag=drowning_target] run effect give @s slowness 60 2 true
execute at @s as @e[distance=0.1..30,tag=drowning_target] run effect give @s mining_fatigue 60 2 true
execute at @s as @e[distance=0.1..30,tag=drowning_target] run effect give @s weakness 60 1 true

# Knockback
execute at @s as @e[distance=0.1..30,tag=drowning_target] at @s facing entity @p[tag=abyssal_master] feet run tp @s ^ ^ ^-4

# Visual feedback
execute at @s as @e[distance=0.1..30,tag=drowning_target] at @s run particle splash ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s as @e[distance=0.1..30,tag=drowning_target] at @s run particle bubble ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..30,tag=drowning_target] at @s run particle falling_water ~ ~2 ~ 0.5 1 0.5 0.5 60 force

# 7. OCEANIC SOUND SEQUENCE
execute at @s run playsound entity.elder_guardian.curse master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.player.splash.high_speed master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.conduit.activate master @a ~ ~ ~ 3 1
execute at @s run playsound block.water.ambient master @a ~ ~ ~ 3 1
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.guardian.death master @a ~ ~ ~ 3 0.5

# 8. GIVE ABYSSAL GUARDIAN BUFFS (60 seconds)
effect give @s resistance 60 3 true
effect give @s absorption 60 14 true
effect give @s strength 60 2 true
effect give @s regeneration 60 2 true
effect give @s water_breathing 60 0 true
effect give @s dolphins_grace 60 0 true
effect give @s night_vision 60 0 true

# 9. APPLY ABYSSAL TAG
tag @s add abyssal_dominion
scoreboard players set @s abyssal_timer 1200
scoreboard players set @s damage_reflected 0
scoreboard players set @s abyssal_kills 0

# 10. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 11. NOTIFY MARKED TARGETS
execute as @e[tag=drowning_target,type=player] run title @s title {"text":"⚠ DROWNING ⚠","color":"dark_aqua","bold":true}
execute as @e[tag=drowning_target,type=player] run title @s subtitle {"text":"The ocean claims you","color":"aqua","italic":true}

# 12. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━     ","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"     ⬥ ABYSSAL DOMINION ⬥","color":"#00CED1","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Resistance IV (massive defense)","color":"dark_aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Absorption XV (30 extra hearts)","color":"dark_aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• 30-block Ocean Domain","color":"dark_aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Crushing Pressure: 6 damage/2s","color":"dark_aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Guardian Beam: 10 damage/4s","color":"dark_aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Damage Reflection: 50% returned","color":"dark_aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Tsunami: Final crushing wave","color":"red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"The ocean never forgets. You collect.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━           ","color":"dark_aqua","bold":true}]