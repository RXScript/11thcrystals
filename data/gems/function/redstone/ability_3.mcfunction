execute unless entity @s[tag=has_redstone] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_redstone] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_redstone] run return fail

# ==========================================
# REDSTONE ADVANCED: "DEAD CIRCUIT"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Mark target → Hit within 2s
# Desync target from redstone flow → Collapse
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ CIRCUIT READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. FIND NEAREST ENTITY IN FRONT (raycast)
tag @s add circuit_caster
execute anchored eyes positioned ^ ^ ^0.5 run function gems:redstone/raycast_circuit
tag @s remove circuit_caster

# 4. CHECK IF TARGET FOUND
execute unless entity @e[tag=circuit_marked,limit=1] run title @s actionbar {"text":"⚠ No target found!","color":"red","bold":true}
execute unless entity @e[tag=circuit_marked,limit=1] run playsound entity.villager.no master @s ~ ~ ~ 1 0.5
execute unless entity @e[tag=circuit_marked,limit=1] run return fail

# 5. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ DEAD CIRCUIT ⬥","color":"red","bold":true}]
title @s subtitle {"text":"Hit within 2 seconds!","color":"dark_red","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ DEAD CIRCUIT ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  WINDOW: 2 seconds","color":"yellow"}]
tellraw @s [{"text":"  Target desynced from flow!","color":"gray"}]
tellraw @s [{"text":"  Hit = Circuit Collapse","color":"green"}]
tellraw @s [{"text":"  Miss = Backfire","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# 6. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle electric_spark ~ ~1 ~ 2 2 2 0.5 200 force

# Target visuals
execute as @e[tag=circuit_marked,limit=1] at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 8 force
execute as @e[tag=circuit_marked,limit=1] at @s run particle explosion ~ ~1 ~ 1 1 1 0 30 force
execute as @e[tag=circuit_marked,limit=1] at @s run particle dust{color:[1.0,0.0,0.0],scale:4} ~ ~1 ~ 1 1 1 1 200 force
execute as @e[tag=circuit_marked,limit=1] at @s run particle electric_spark ~ ~1 ~ 1 1 1 0.5 150 force

# 7. SOUND SEQUENCE
execute at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 2 2
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 2 2
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 2

# Target sound
execute as @e[tag=circuit_marked,limit=1] at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 2 0.5
execute as @e[tag=circuit_marked,limit=1] at @s run playsound entity.elder_guardian.curse master @a ~ ~ ~ 1.5 1.5

# 8. TAG SYSTEM
tag @s add dead_circuit_active
tag @s add redstone3_immune
scoreboard players set @s circuit_window 40
scoreboard players set @s circuit_triggered 0

# 9. APPLY SLOWNESS TO TARGET (desync effect)
execute as @e[tag=circuit_marked,limit=1] run effect give @s slowness 2 1 true
execute as @e[tag=circuit_marked,limit=1] run effect give @s glowing 2 0 true

# 10. SET COOLDOWN
scoreboard players set @s cd_90s 1800