# ==========================================
# WEAK OVERFLOW - < 40% POWER
# ==========================================

# WEAK EXPLOSION
particle explosion ~ ~1 ~ 2 2 2 0 30 force
particle dust{color:[0.0,0.0,1.0],scale:2} ~ ~1 ~ 2 2 2 0.5 100 force
particle smoke ~ ~1 ~ 2 2 2 0.3 80 force

# HARSH SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# WEAK DAMAGE (10 HP)
execute at @s as @e[distance=0.1..18,tag=arcane_target] run damage @s 10 magic by @p[tag=arcane_charging]

# PUNISHMENT DEBUFFS (8 seconds)
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true

# Messages
title @s title [{"text":"⬥ WEAK OVERFLOW ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Released too early!","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ OVERFLOW FAILURE ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Power: ","color":"gray"},{"score":{"name":"@s","objective":"arcane_power"},"color":"yellow"},{"text":"%","color":"gray"}]
tellraw @s [{"text":"  Required: 60%+ for good damage","color":"red"}]
tellraw @s [{"text":"  Weak Damage: 10 HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove arcane_charging
tag @s remove lapis_immune
tag @e remove arcane_target
scoreboard players reset @s arcane_charge_timer
scoreboard players reset @s arcane_power
scoreboard players reset @s overflow_released