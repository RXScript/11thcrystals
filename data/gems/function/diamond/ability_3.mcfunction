execute unless entity @s[tag=has_diamond] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_diamond] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_diamond] run return fail

# ==========================================
# DIAMOND ADVANCED: "UNBREAKABLE WILL"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Activate RIGHT before being hit
# SUCCESS: Perfect counter → invulnerability + blast
# FAILURE: Mistimed → recoil damage
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ COUNTER READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ COUNTER READY ⬥","color":"aqua","bold":true}]
title @s subtitle {"text":"Hit me if you dare","color":"blue","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @s [{"text":"   ⬥ UNBREAKABLE WILL ⬥","color":"aqua","bold":true}]
tellraw @s [{"text":"  COUNTER WINDOW: 1.5 seconds","color":"yellow"}]
tellraw @s [{"text":"  Get hit to trigger perfect counter!","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle end_rod ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s run particle glow ~ ~1 ~ 2 2 2 0.3 150 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 2 2
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound block.note_block.bell master @a ~ ~ ~ 2 2

# 6. TAG SYSTEM
tag @s add diamond_counter_ready
tag @s add counter_immune
scoreboard players set @s counter_window 30
scoreboard players set @s counter_triggered 0

# 7. VISUAL INDICATOR - Shield particles
execute at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 1 1 1 0 100 force

# 8. SET COOLDOWN (90 seconds = 1800 ticks)
scoreboard players set @s cd_90s 1800