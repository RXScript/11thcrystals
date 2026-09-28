execute unless entity @s[tag=has_redstone] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_redstone] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_redstone] run return fail

# ==========================================
# REDSTONE TACTICAL: "VOLTAGE STRIKE"
# 30 Second Cooldown - 50 Mastery Points
# Tactical attack - Charge electricity
# Next attack: bonus damage + shock stun
# Miss window = discharge fail
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ VOLTAGE READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ VOLTAGE STRIKE ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Charging energy...","color":"gold","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ VOLTAGE STRIKE ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  CHARGING: 1 second","color":"yellow"}]
tellraw @s [{"text":"  WINDOW: 2 seconds","color":"gold"}]
tellraw @s [{"text":"  Bonus Damage: +12 HP","color":"red"}]
tellraw @s [{"text":"  Electric Stun: 1.5s","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# 4. ACTIVATION VISUALS - START CHARGING
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 2 2 2 1 300 force
execute at @s run particle electric_spark ~ ~1 ~ 1.5 1.5 1.5 0.5 200 force
execute at @s run particle flame ~ ~1 ~ 1.5 1.5 1.5 0.3 150 force

# Electric buildup
execute at @s run particle dust{color:[1.0,1.0,0.0],scale:2} ~ ~1 ~ 1 1 1 0.5 100 force
execute at @s run particle dust{color:[1.0,0.5,0.0],scale:2} ~ ~0.5 ~ 0.8 0.8 0.8 0.3 80 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 2 2
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 1.5 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 2

# 6. TAG SYSTEM
tag @s add voltage_charging
tag @s add redstone2_immune
scoreboard players set @s voltage_charge_timer 20
scoreboard players set @s voltage_phase 0
scoreboard players set @s voltage_window 0
scoreboard players set @s voltage_used 0

# 7. SET COOLDOWN
scoreboard players set @s cd_30s 600