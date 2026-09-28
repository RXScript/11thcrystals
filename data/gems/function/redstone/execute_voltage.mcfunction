# ==========================================
# SUCCESS - VOLTAGE STRIKE EXECUTED!
# ==========================================

# Mark as used
scoreboard players set @s voltage_used 1

# MASSIVE ELECTRIC EXPLOSION
execute at @e[tag=voltage_victim,limit=1] run particle explosion_emitter ~ ~1 ~ 0 0 0 0 30 force
execute at @e[tag=voltage_victim,limit=1] run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @e[tag=voltage_victim,limit=1] run particle dust{color:[1.0,1.0,0.0],scale:4} ~ ~1 ~ 0 0 0 3 1000 force
execute at @e[tag=voltage_victim,limit=1] run particle electric_spark ~ ~1 ~ 0 0 0 5 800 force
execute at @e[tag=voltage_victim,limit=1] run particle flame ~ ~1 ~ 0 0 0 10 600 force
execute at @e[tag=voltage_victim,limit=1] run particle lava ~ ~1 ~ 3 3 3 1 400 force

# Lightning bolts
execute at @e[tag=voltage_victim,limit=1] run particle dust{color:[1.0,1.0,0.0],scale:4} ~ ~4 ~ 0.2 0.2 0.2 0 50 force
execute at @e[tag=voltage_victim,limit=1] run particle electric_spark ~ ~4 ~ 0.3 0.3 0.3 0 40 force
execute at @e[tag=voltage_victim,limit=1] run particle dust{color:[1.0,1.0,0.0],scale:4} ~ ~3 ~ 0.2 0.2 0.2 0 40 force
execute at @e[tag=voltage_victim,limit=1] run particle electric_spark ~ ~3 ~ 0.3 0.3 0.3 0 30 force
execute at @e[tag=voltage_victim,limit=1] run particle dust{color:[1.0,1.0,0.0],scale:4} ~ ~2 ~ 0.2 0.2 0.2 0 30 force
execute at @e[tag=voltage_victim,limit=1] run particle electric_spark ~ ~2 ~ 0.3 0.3 0.3 0 20 force

# VOLTAGE SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute at @s run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 3 2
execute at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⚡ VOLTAGE! ⚡","color":"gold","bold":true}]
title @s subtitle [{"text":"Electric strike","color":"yellow"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"   ⚡ VOLTAGE EXECUTED ⚡","color":"gold","bold":true}]
tellraw @s [{"text":"  Bonus Damage: +12 HP","color":"red"}]
tellraw @s [{"text":"  Electric Stun: 1.5s","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# BONUS DAMAGE (12 HP electric strike)
execute as @e[tag=voltage_victim,limit=1] run damage @s 12 lightning_bolt by @p[tag=voltage_charging]

# ELECTRIC STUN (1.5 seconds = 30 ticks)
execute as @e[tag=voltage_victim,limit=1] run effect give @s slowness 2 3 true
execute as @e[tag=voltage_victim,limit=1] run effect give @s weakness 2 1 true
execute as @e[tag=voltage_victim,limit=1] run effect give @s glowing 2 0 true

# Electric shock particles on victim
execute as @e[tag=voltage_victim,limit=1] at @s run particle electric_spark ~ ~1 ~ 0.8 0.8 0.8 0.5 100 force
execute as @e[tag=voltage_victim,limit=1] at @s run particle dust{color:[1.0,1.0,0.0],scale:3} ~ ~1 ~ 0.8 0.8 0.8 0.5 80 force
execute as @e[tag=voltage_victim,limit=1] at @s run particle flame ~ ~1 ~ 0.8 0.8 0.8 0.3 60 force

# Electric arcs around victim
execute as @e[tag=voltage_victim,limit=1] at @s run particle dust{color:[1.0,1.0,0.0],scale:2} ~ ~2 ~ 0.5 0.3 0.5 0 40 force
execute as @e[tag=voltage_victim,limit=1] at @s run particle electric_spark ~ ~1.5 ~ 0.6 0.5 0.6 0 30 force

# KNOCKBACK
execute as @e[tag=voltage_victim,limit=1] at @s facing entity @p[tag=voltage_charging] feet run tp @s ^ ^ ^-3

# Cleanup
tag @s remove voltage_charging
tag @s remove redstone2_immune
tag @e remove voltage_target
tag @e remove voltage_victim
scoreboard players reset @s voltage_phase
scoreboard players reset @s voltage_charge_timer
scoreboard players reset @s voltage_window
scoreboard players reset @s voltage_used