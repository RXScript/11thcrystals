# ==========================================
# PARTIAL - PARTIAL BATCH (5-7 TASKS)
# ==========================================

# GOOD PROCESSING
particle explosion ~ ~1 ~ 5 5 5 0 80 force
particle dust{color:[1.0,1.0,1.0],scale:3} ~ ~1 ~ 3 3 3 1 300 force
particle crit ~ ~1 ~ 3 3 3 0.3 150 force

# SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 2 1.5
execute at @s run playsound block.note_block.pling master @a ~ ~ ~ 2 1.5

# DAMAGE (24 HP)
execute at @s as @e[distance=0.1..18,tag=queue_target] run damage @s 24 player_attack by @p[tag=queue_active]

# Medium knockback
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s facing entity @p[tag=queue_active] feet run tp @s ^ ^ ^-5

# Visuals on targets
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s run particle explosion ~ ~1 ~ 2 2 2 0 25 force
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s run particle crit ~ ~1 ~ 1.5 1.5 1.5 0.3 100 force

# MINOR BUFFS (8 seconds)
effect give @s haste 8 1 true
effect give @s speed 8 0 true

# Messages
title @s title [{"text":"⬥ PARTIAL BATCH ⬥","color":"yellow","bold":true}]
title @s subtitle [{"text":"Good processing","color":"gold"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"yellow","bold":true}]
tellraw @s [{"text":"   ⬥ PARTIAL BATCH ⬥","color":"yellow","bold":true}]
tellraw @s [{"text":"  Tasks: ","color":"gray"},{"score":{"name":"@s","objective":"tasks_queued"},"color":"yellow"},{"text":"/8","color":"gray"}]
tellraw @s [{"text":"  Batch Damage: 24 HP","color":"red"}]
tellraw @s [{"text":"  Minor buffs applied","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"yellow","bold":true}]

# Cleanup
tag @s remove queue_active
tag @s remove quartz_immune
tag @e remove queue_target
scoreboard players reset @s queue_timer
scoreboard players reset @s tasks_queued