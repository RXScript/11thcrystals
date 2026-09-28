# ==========================================
# FAILURE - WEAK TREMOR
# ==========================================

# WEAK EXPLOSION
particle explosion ~ ~1 ~ 2 2 2 0 30 force
particle dust{color:[0.5,0.0,0.5],scale:2} ~ ~1 ~ 2 2 2 0.5 100 force
particle smoke ~ ~1 ~ 2 2 2 0.3 80 force

# HARSH SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# WEAK DAMAGE (10 HP)
execute at @s as @e[distance=0.1..20,tag=vibration_source] run damage @s 10 sonic_boom by @p[tag=seismic_sensing]

# PUNISHMENT DEBUFFS (8 seconds)
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true

# Messages
title @s title [{"text":"⬥ WEAK TREMOR ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Not enough vibrations","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ SENSE FAILURE ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Vibrations: ","color":"gray"},{"score":{"name":"@s","objective":"vibration_count"},"color":"yellow"},{"text":"/80","color":"gray"}]
tellraw @s [{"text":"  Required: 80+ vibrations","color":"red"}]
tellraw @s [{"text":"  Weak Damage: 10 HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove seismic_sensing
tag @s remove seismic_immune
tag @e remove vibration_source
scoreboard players reset @e entity_last_x
scoreboard players reset @e entity_last_z
scoreboard players reset @s seismic_timer
scoreboard players reset @s vibration_count
scoreboard players reset @s detonated