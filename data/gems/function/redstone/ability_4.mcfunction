execute unless entity @s[tag=has_redstone] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_redstone] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_redstone] run return fail

# ==========================================
# REDSTONE ELITE: "ELECTRICAL DISCHARGE"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Don't discharge enough → Electrical burnout
# HIGH REWARD: Discharge into enemies → Chain lightning
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ CIRCUIT OFFLINE: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..30] title [{"text":"⬥ ","color":"dark_red","bold":true},{"selector":"@s","color":"dark_red","bold":true},{"text":" ⬥","color":"dark_red","bold":true}]
title @a[distance=0.1..30] subtitle {"text":"OVERCHARGES","color":"red","bold":true}
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @a[distance=0.1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"dark_red"},{"text":" activates ELECTRICAL DISCHARGE","color":"gray"}]
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle electric_spark ~ ~1 ~ 10 10 10 3 3000 force
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 8 8 8 2 2000 force
execute at @s run particle flame ~ ~1 ~ 8 8 8 1 1500 force
execute at @s run particle glow ~ ~1 ~ 6 6 6 1 1000 force
execute at @s run particle end_rod ~ ~1 ~ 6 6 6 0.5 800 force

# Vertical lightning pillar
execute at @s run particle electric_spark ~ ~1 ~ 0.5 60 0.5 0 1500 force
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.5 60 0.5 0 1200 force

# Ground redstone circle
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~0.1 ~ 12 0.1 12 0 1200 force
execute at @s run particle electric_spark ~ ~0.1 ~ 10 0.1 10 0 1000 force

# 4. SOUND SEQUENCE
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 3 1
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1
execute at @s run playsound block.note_block.pling master @a ~ ~ ~ 2 2

# 5. TAG SYSTEM
tag @s add overcharged
tag @s add redstone4_immune
scoreboard players set @s overcharge_timer 260
scoreboard players set @s discharge_hits 0
scoreboard players set @s overload_damage 0

# 6. MARK ENEMIES - DISCHARGE TARGETS
execute at @s as @e[distance=0.1..20,tag=!redstone4_immune] run tag @s add discharge_target
execute at @s as @e[distance=0.1..20,tag=discharge_target] run scoreboard players set @s target_discharged 0
execute at @s store result score @s discharge_target_count if entity @e[distance=0.1..20,tag=discharge_target]

# Visual marking - electrical binding
execute at @s as @e[distance=0.1..20,tag=discharge_target] at @s run particle electric_spark ~ ~1 ~ 0.5 1 0.5 0.5 100 force
execute at @s as @e[distance=0.1..20,tag=discharge_target] at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.5 1 0.5 0.3 80 force
execute at @s as @e[distance=0.1..20,tag=discharge_target] at @s run particle flame ~ ~2 ~ 0.3 0.3 0.3 0.1 40 force

# 7. APPLY OVERCHARGE STATE (6 seconds) - Maximum speed
effect give @s speed 6 4 true
effect give @s haste 6 2 true
effect give @s jump_boost 6 1 true

# 8. INITIAL OVERLOAD DAMAGE (5 hearts to start)
execute at @s run damage @s 10 lightning_bolt
scoreboard players add @s overload_damage 10

# 9. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 10. NOTIFY MARKED TARGETS
execute as @e[tag=discharge_target,type=player] run title @s title {"text":"⚠ ELECTRICAL TARGET ⚠","color":"dark_red","bold":true}
execute as @e[tag=discharge_target,type=player] run title @s subtitle {"text":"Lightning seeks you","color":"red","italic":true}

# 11. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ ELECTRICAL DISCHARGE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"6 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Marked Targets: ","color":"gray"},{"score":{"name":"@s","objective":"discharge_target_count"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Speed V + Haste III + Jump II","color":"red"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"WARNING: ","color":"red","bold":true},{"text":"OVERLOADING!","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Discharge into 7+ enemies","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Chain lightning + speed buffs","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"< 7 discharges","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Electrical burnout + debuffs","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]