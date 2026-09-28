# ==========================================
# FAILURE - VOLTAGE DISCHARGED!
# ==========================================

# DISCHARGE VISUALS
execute at @s run particle explosion ~ ~1 ~ 2 2 2 0 40 force
execute at @s run particle smoke ~ ~1 ~ 2 2 2 0.3 100 force
execute at @s run particle dust{color:[0.5,0.5,0.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 80 force
execute at @s run particle electric_spark ~ ~1 ~ 1.5 1.5 1.5 0.3 60 force

# Wasted energy
execute at @s run particle dust{color:[0.3,0.0,0.0],scale:2} ~ ~1 ~ 1 1 1 0.3 50 force

# DISCHARGE SOUND
execute at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"⚡ DISCHARGED ⚡","color":"dark_red","bold":true}]
title @s subtitle [{"text":"Energy wasted","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"  ⚡ VOLTAGE FAILED ⚡","color":"dark_red","bold":true}]
tellraw @s [{"text":"  You didn't strike in time!","color":"gray"}]
tellraw @s [{"text":"  Energy discharged!","color":"red"}]
tellraw @s [{"text":"  Debuff: 2 seconds","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# PUNISHMENT DEBUFF (2 seconds - wasted energy)
effect give @s weakness 2 0 true

# Cleanup
tag @s remove voltage_charging
tag @s remove redstone2_immune
tag @e remove voltage_target
scoreboard players reset @s voltage_phase
scoreboard players reset @s voltage_charge_timer
scoreboard players reset @s voltage_window
scoreboard players reset @s voltage_used