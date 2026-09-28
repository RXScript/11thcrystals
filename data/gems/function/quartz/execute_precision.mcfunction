# ==========================================
# SUCCESS - PRECISION STRIKE EXECUTED!
# ==========================================

# Mark as used
scoreboard players set @s precision_used 1

# MASSIVE PRECISION STRIKE VISUALS
execute at @e[tag=precision_victim,limit=1] run particle explosion_emitter ~ ~1 ~ 0 0 0 0 20 force
execute at @e[tag=precision_victim,limit=1] run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 10 force
execute at @e[tag=precision_victim,limit=1] run particle dust{color:[1.0,1.0,1.0],scale:4} ~ ~1 ~ 0 0 0 3 800 force
execute at @e[tag=precision_victim,limit=1] run particle crit ~ ~1 ~ 0 0 0 5 1000 force
execute at @e[tag=precision_victim,limit=1] run particle end_rod ~ ~1 ~ 0 0 0 3 600 force
execute at @e[tag=precision_victim,limit=1] run particle electric_spark ~ ~1 ~ 0 0 0 5 500 force

# Calculation lines converging
execute at @e[tag=precision_victim,limit=1] run particle dust{color:[1.0,1.0,1.0],scale:3} ~2 ~1 ~ 0.1 0.1 0.1 0 30 force
execute at @e[tag=precision_victim,limit=1] run particle dust{color:[1.0,1.0,1.0],scale:3} ~-2 ~1 ~ 0.1 0.1 0.1 0 30 force
execute at @e[tag=precision_victim,limit=1] run particle dust{color:[1.0,1.0,1.0],scale:3} ~ ~1 ~2 0.1 0.1 0.1 0 30 force
execute at @e[tag=precision_victim,limit=1] run particle dust{color:[1.0,1.0,1.0],scale:3} ~ ~1 ~-2 0.1 0.1 0.1 0 30 force

# PRECISION SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 3 2
execute at @s run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 3 2
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"◈ PRECISION! ◈","color":"white","bold":true}]
title @s subtitle [{"text":"Perfect calculation","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @s [{"text":"   ◈ PRECISION EXECUTED ◈","color":"white","bold":true}]
tellraw @s [{"text":"  Bonus Damage: +10 HP","color":"red"}]
tellraw @s [{"text":"  Guaranteed Critical","color":"gold"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]

# BONUS DAMAGE (10 HP calculated strike)
execute as @e[tag=precision_victim,limit=1] run damage @s 10 player_attack by @p[tag=precision_charged]

# CRITICAL HIT EFFECT (additional damage from guaranteed crit)
execute as @e[tag=precision_victim,limit=1] run damage @s 5 player_attack by @p[tag=precision_charged]

# KNOCKBACK
execute as @e[tag=precision_victim,limit=1] at @s facing entity @p[tag=precision_charged] feet run tp @s ^ ^ ^-4

# Tag victim for kill check
execute as @e[tag=precision_victim,limit=1] run tag @s add precision_kill_check

# Schedule kill check (5 ticks after damage)
scoreboard players set @s precision_kill_timer 5