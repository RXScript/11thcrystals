execute unless entity @s[tag=has_prismarine] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_prismarine] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_prismarine] run return fail

# ==========================================
# PRISMARINE TACTICAL: "GUARDIAN'S REPRISAL"
# 30 Second Cooldown - 50 Mastery Points
# Tactical counter - Enter guardian stance
# Get hit = devastating counter-attack
# Miss window = fail with debuff
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ REPRISAL READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":"s","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ GUARDIAN'S REPRISAL ⬥","color":"dark_aqua","bold":true}]
title @s subtitle [{"text":"Stance ready","color":"aqua","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"   ⬥ GUARDIAN'S REPRISAL ⬥","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"  STANCE: 2 seconds","color":"yellow"}]
tellraw @s [{"text":"  Get hit = counter!","color":"gray"}]
tellraw @s [{"text":"  Counter: 14 HP + stun","color":"red"}]
tellraw @s [{"text":"  Miss = debuff","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[0.0,0.5,0.5],scale:3} ~ ~1 ~ 2 2 2 1 400 force
execute at @s run particle falling_water ~ ~2 ~ 1.5 1.5 1.5 1 300 force
execute at @s run particle block{block_state:"minecraft:prismarine"} ~ ~1 ~ 1 1 1 1 200 force

# Guardian stance effect - protective sphere
execute at @s run particle dust{color:[0.0,0.8,0.8],scale:2} ~1.5 ~1 ~ 0.1 0.8 0.1 0 30 force
execute at @s run particle dust{color:[0.0,0.8,0.8],scale:2} ~-1.5 ~1 ~ 0.1 0.8 0.1 0 30 force
execute at @s run particle dust{color:[0.0,0.8,0.8],scale:2} ~ ~1 ~1.5 0.1 0.8 0.1 0 30 force
execute at @s run particle dust{color:[0.0,0.8,0.8],scale:2} ~ ~1 ~-1.5 0.1 0.8 0.1 0 30 force

# Ocean pressure waves
execute at @s run particle dust{color:[0.0,0.5,1.0],scale:3} ~ ~1 ~ 1 0.1 1 0 40 force
execute at @s run particle dust{color:[0.0,0.5,1.0],scale:3} ~ ~1 ~ 2 0.1 2 0 60 force

# 5. SOUND SEQUENCE
execute at @s run playsound entity.guardian.ambient master @a ~ ~ ~ 2 2
execute at @s run playsound block.conduit.activate master @a ~ ~ ~ 2 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2

# 6. TAG SYSTEM
tag @s add reprisal_stance
tag @s add prismarine2_immune
scoreboard players set @s reprisal_window 40
scoreboard players set @s reprisal_triggered 0

# 7. APPLY RESISTANCE (guardian armor - 60% reduction)
effect give @s resistance 2 2 true
effect give @s slowness 2 0 true

# 8. SET COOLDOWN
scoreboard players set @s cd_30s 600