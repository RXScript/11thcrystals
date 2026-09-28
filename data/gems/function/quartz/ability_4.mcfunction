execute unless entity @s[tag=has_quartz] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_quartz] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_quartz] run return fail

# ==========================================
# QUARTZ ELITE: "EFFICIENCY PROTOCOL"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Duplicate hit OR miss target = system failure
# HIGH REWARD: Perfect execution = devastating efficiency
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ PROTOCOL OFFLINE: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..30] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"white","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0.1..30] subtitle {"text":"INITIATES PROTOCOL","color":"gray","bold":true}
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @a[distance=0.1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"white"},{"text":" activates EFFICIENCY PROTOCOL","color":"gray"}]
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle firework ~ ~1 ~ 10 10 10 2 2000 force
execute at @s run particle end_rod ~ ~1 ~ 8 8 8 1 1500 force
execute at @s run particle electric_spark ~ ~1 ~ 8 8 8 1.5 1200 force
execute at @s run particle glow ~ ~1 ~ 6 6 6 0.5 800 force

# Vertical precision beam
execute at @s run particle firework ~ ~1 ~ 0.5 60 0.5 0 1200 force
execute at @s run particle end_rod ~ ~1 ~ 0.5 60 0.5 0 1000 force

# Ground targeting grid
execute at @s run particle firework ~ ~0.1 ~ 12 0.1 12 0 1000 force
execute at @s run particle electric_spark ~ ~0.1 ~ 10 0.1 10 0 800 force

# 4. SOUND SEQUENCE
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute at @s run playsound block.conduit.activate master @a ~ ~ ~ 3 1
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1
execute at @s run playsound block.respawn_anchor.charge master @a ~ ~ ~ 2 1.5

# 5. TAG SYSTEM
tag @s add protocol_active
tag @s add protocol_immune
scoreboard players set @s protocol_timer 260
scoreboard players set @s targets_hit_elite 0
scoreboard players set @s protocol_failed 0
scoreboard players set @s efficiency_target_total 8

# 6. MARK ENEMIES - EFFICIENCY TARGETS (each must be hit EXACTLY once)
execute at @s as @e[distance=0.1..20,tag=!protocol_immune] run tag @s add efficiency_target
execute at @s as @e[distance=0.1..20,tag=efficiency_target] run scoreboard players set @s target_hit_status 0
execute at @s store result score @s efficiency_target_total if entity @e[distance=0.1..20,tag=efficiency_target]

# Visual marking - target lock
execute at @s as @e[distance=0.1..20,tag=efficiency_target] at @s run particle firework ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..20,tag=efficiency_target] at @s run particle electric_spark ~ ~1 ~ 0.5 1 0.5 0.3 60 force
execute at @s as @e[distance=0.1..20,tag=efficiency_target] at @s run particle end_rod ~ ~2 ~ 0.3 0.3 0.3 0.1 40 force

# 7. APPLY TEMPORARY BUFFS (6 seconds)
effect give @s strength 6 2 true
effect give @s speed 10 3 true
effect give @s haste 10 2 true

# 8. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 9. NOTIFY MARKED TARGETS
execute as @e[tag=efficiency_target,type=player] run title @s title {"text":"⚠ TARGET LOCKED ⚠","color":"white","bold":true}
execute as @e[tag=efficiency_target,type=player] run title @s subtitle {"text":"You are in the protocol","color":"gray","italic":true}

# 10. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @s [{"text":"   ⬥ EFFICIENCY PROTOCOL ⬥","color":"white","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"6 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Locked Targets: ","color":"gray"},{"score":{"name":"@s","objective":"efficiency_target_total"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength III + Speed IV + Haste III","color":"white"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"PROTOCOL: ","color":"red","bold":true},{"text":"Hit each target ONCE only!","color":"yellow"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Hit ALL targets perfectly","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Precision burst + speed buffs","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"Duplicate OR missed target","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → System failure + severe debuffs","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]