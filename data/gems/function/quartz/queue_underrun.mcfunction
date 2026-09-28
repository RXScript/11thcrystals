# ==========================================
# FAILURE - QUEUE UNDERRUN
# ==========================================

# WEAK PROCESSING
particle explosion ~ ~1 ~ 2 2 2 0 30 force
particle smoke ~ ~1 ~ 2 2 2 0.3 80 force
particle dust{color:[0.5,0.5,0.5],scale:2} ~ ~1 ~ 2 2 2 0.5 100 force

# HARSH SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 2 0.5

# WEAK DAMAGE (11 HP)
execute at @s as @e[distance=0.1..18,tag=queue_target] run damage @s 11 player_attack by @p[tag=queue_active]

# PUNISHMENT DEBUFFS (8 seconds)
effect give @s slowness 8 1 true
effect give @s mining_fatigue 8 1 true
effect give @s weakness 8 1 true

# Messages
title @s title [{"text":"⬥ QUEUE UNDERRUN ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Not enough tasks","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ QUEUE UNDERRUN ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Tasks: ","color":"gray"},{"score":{"name":"@s","objective":"tasks_queued"},"color":"yellow"},{"text":"/8","color":"gray"}]
tellraw @s [{"text":"  Required: 8+ tasks queued","color":"red"}]
tellraw @s [{"text":"  Weak Damage: 11 HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Mining Fatigue II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove queue_active
tag @s remove quartz_immune
tag @e remove queue_target
scoreboard players reset @s queue_timer
scoreboard players reset @s tasks_queued