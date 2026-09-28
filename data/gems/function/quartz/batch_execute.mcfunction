# ==========================================
# SUCCESS - BATCH EXECUTE!
# ==========================================

# MASSIVE PROCESSING EXPLOSION
particle explosion_emitter ~ ~1 ~ 10 10 10 0 200 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 30 force
particle dust{color:[1.0,1.0,1.0],scale:4} ~ ~1 ~ 0 0 0 3 2000 force
particle crit ~ ~1 ~ 0 0 0 5 1500 force
particle end_rod ~ ~1 ~ 0 0 0 2 1000 force
particle glow ~ ~1 ~ 10 10 10 2 1000 force

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ BATCH EXECUTED ⬥","color":"white","bold":true}]
title @s subtitle [{"text":"All tasks processed!","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @s [{"text":"   ⬥ BATCH EXECUTE ⬥","color":"white","bold":true}]
tellraw @s [{"text":"  Tasks: ","color":"gray"},{"score":{"name":"@s","objective":"tasks_queued"},"color":"gold"}]
tellraw @s [{"text":"  Batch Damage: 38 HP","color":"red"}]
tellraw @s [{"text":"  • Haste III (10s)","color":"green"}]
tellraw @s [{"text":"  • Speed II (10s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]

# MASSIVE DAMAGE (38 HP - all queued damage releases)
execute at @s as @e[distance=0.1..18,tag=queue_target] run damage @s 38 player_attack by @p[tag=queue_active]

# KNOCKBACK
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s facing entity @p[tag=queue_active] feet run tp @s ^ ^ ^-7
execute at @s as @e[distance=0.1..18,tag=queue_target] run effect give @s levitation 1 28 true

# Processing effects on targets
execute at @s as @e[distance=0.1..18,tag=queue_target] run effect give @s slowness 6 2 true
execute at @s as @e[distance=0.1..18,tag=queue_target] run effect give @s glowing 6 0 true

# Visuals on targets
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s run particle explosion ~ ~1 ~ 3 3 3 0 40 force
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s run particle crit ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s run particle dust{color:[1.0,1.0,1.0],scale:3} ~ ~1 ~ 2 2 2 1 300 force

# BUFFS (optimized state)
effect give @s haste 10 2 true
effect give @s speed 10 1 true
effect give @s strength 10 1 true
effect give @s regeneration 10 0 true

# Cleanup
tag @s remove queue_active
tag @s remove quartz_immune
tag @e remove queue_target
scoreboard players reset @s queue_timer
scoreboard players reset @s tasks_queued