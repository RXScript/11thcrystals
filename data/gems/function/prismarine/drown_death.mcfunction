# ==========================================
# FAILURE - DROWNED
# ==========================================

# FAILURE VISUALS (sinking)
particle explosion ~ ~1 ~ 4 4 4 1 100 force
particle splash ~ ~1 ~ 5 5 5 0.8 500 force
particle bubble ~ ~1 ~ 4 4 4 0.5 400 force
particle falling_water ~ ~1 ~ 3 3 3 0.3 300 force

# ADDITIONAL DROWNING DAMAGE (15 HP)
damage @s 15 drown
scoreboard players add @s drowning_damage 15

# HARSH DROWNING SOUND
execute at @s run playsound entity.player.hurt_drown master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.elder_guardian.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound block.water.ambient master @s ~ ~ ~ 3 0.5

# PUNISHMENT DEBUFFS (30 seconds) - Waterlogged
effect give @s slowness 30 2 true
effect give @s weakness 30 2 true
effect give @s mining_fatigue 30 2 true
effect give @s hunger 30 2 true
effect give @s unluck 30 0 true

# Messages
title @s title [{"text":"⬥ DROWNED ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"The debt remains unpaid","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ TIDAL FAILURE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  Debt: ","color":"gray"},{"score":{"name":"@s","objective":"debt_collected"},"color":"yellow"},{"text":"/50","color":"gray"}]
tellraw @s [{"text":"  Required: 50 debt collected","color":"red"}]
tellraw @s [{"text":"  Total Drowned: -","color":"dark_red"},{"score":{"name":"@s","objective":"drowning_damage"},"color":"red"},{"text":" HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  • Slowness III (waterlogged)","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness III","color":"dark_red"}]
tellraw @s [{"text":"  • Mining Fatigue III","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove debt_collector
tag @s remove debt_immune
tag @e remove debt_holder
scoreboard players reset @s debt_collected
scoreboard players reset @s drowning_damage
scoreboard players reset @s debt_holder_count