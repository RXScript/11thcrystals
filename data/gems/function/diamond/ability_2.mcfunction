execute unless entity @s[tag=has_diamond] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_diamond] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_diamond] run return fail

# ==========================================
# DIAMOND TACTICAL: "STONE SHELL"
# 30 Second Cooldown - 50 Mastery Points
# Tactical shield - 60% damage reduction for 4s
# Absorb damage → Convert to absorption hearts
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ SHELL READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ STONE SHELL ⬥","color":"aqua","bold":true}]
title @s subtitle [{"text":"Crystalline defense","color":"dark_aqua","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @s [{"text":"   ⬥ STONE SHELL ⬥","color":"aqua","bold":true}]
tellraw @s [{"text":"  DURATION: 4 seconds","color":"yellow"}]
tellraw @s [{"text":"  60% damage reduction","color":"green"}]
tellraw @s [{"text":"  Damage → Absorption hearts","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[0.0,1.0,1.0],scale:3} ~ ~1 ~ 2 2 2 1 400 force
execute at @s run particle end_rod ~ ~1 ~ 1.5 1.5 1.5 0.3 200 force
execute at @s run particle block{block_state:"minecraft:diamond_block"} ~ ~1 ~ 1 1 1 1 300 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 2
execute at @s run playsound item.armor.equip_diamond master @a ~ ~ ~ 2 1

# 6. TAG SYSTEM
tag @s add stone_shell_active
tag @s add diamond_immune
scoreboard players set @s shell_timer 80
scoreboard players set @s shell_absorbed 0

# 7. APPLY RESISTANCE (60% reduction = Resistance III)
effect give @s resistance 4 2 true
effect give @s slowness 4 0 true

# 9. SET COOLDOWN
scoreboard players set @s cd_30s 600