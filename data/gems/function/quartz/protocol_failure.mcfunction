# ==========================================
# FAILURE - SYSTEM MALFUNCTION
# ==========================================

# FAILURE VISUALS (system crash)
particle explosion ~ ~1 ~ 4 4 4 1 100 force
particle smoke ~ ~1 ~ 5 5 5 0.5 400 force
particle large_smoke ~ ~1 ~ 4 4 4 0.3 300 force
particle cloud ~ ~1 ~ 3 3 3 0.2 200 force

# HARSH DISCORDANT SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 3 1
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.player.hurt master @s ~ ~ ~ 2 0.5

# PUNISHMENT DEBUFFS (30 seconds) - System lag
effect give @s slowness 30 3 true
effect give @s weakness 30 2 true
effect give @s mining_fatigue 30 3 true
effect give @s unluck 30 0 true

# Messages
execute if score @s protocol_failed matches 1 run title @s title [{"text":"⬥ SYSTEM CRASH ⬥","color":"dark_red","bold":true}]
execute if score @s protocol_failed matches 0 run title @s title [{"text":"⬥ INCOMPLETE PROTOCOL ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"Efficiency failure","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ PROTOCOL FAILURE ⬥","color":"dark_red","bold":true}]
execute if score @s protocol_failed matches 1 run tellraw @s [{"text":"  Reason: ","color":"gray"},{"text":"Duplicate target hit","color":"red"}]
execute if score @s protocol_failed matches 0 run tellraw @s [{"text":"  Targets Hit: ","color":"gray"},{"score":{"name":"@s","objective":"targets_hit_elite"},"color":"yellow"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"efficiency_target_total"},"color":"yellow"}]
execute if score @s protocol_failed matches 0 run tellraw @s [{"text":"  Required: ALL targets exactly once","color":"red"}]
tellraw @s [{"text":"  System Lag: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  • Slowness IV","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness III","color":"dark_red"}]
tellraw @s [{"text":"  • Mining Fatigue IV","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove protocol_active
tag @s remove protocol_immune
tag @e remove efficiency_target
scoreboard players reset @e target_hit_status
scoreboard players reset @s targets_hit_elite
scoreboard players reset @s protocol_failed
scoreboard players reset @s efficiency_target_total