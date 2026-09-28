# ==========================================
# HIT DURING STANCE - EXECUTE COUNTER!
# ==========================================

# Check if already triggered
execute if score @s reprisal_triggered matches 1 run return fail

# Mark as triggered
scoreboard players set @s reprisal_triggered 1

# Find attacker (nearest entity that could have hit us)
execute at @s as @e[distance=0.1..6,type=!#minecraft:arrows,type=!item,tag=!prismarine2_immune,limit=1,sort=nearest] run tag @s add reprisal_attacker

# MASSIVE GUARDIAN COUNTER EXPLOSION
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 30 force
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[0.0,1.0,1.0],scale:4} ~ ~1 ~ 0 0 0 3 1000 force
execute at @s run particle falling_water ~ ~1 ~ 0 0 0 5 800 force
execute at @s run particle block{block_state:"minecraft:prismarine"} ~ ~1 ~ 0 0 0 3 600 force
execute at @s run particle glow ~ ~1 ~ 3 3 3 1 400 force

# Ocean pressure wave
execute at @s run particle dust{color:[0.0,0.5,1.0],scale:4} ~ ~1 ~ 1 0.1 1 0 100 force
execute at @s run particle dust{color:[0.0,0.5,1.0],scale:4} ~ ~1 ~ 2 0.1 2 0 150 force
execute at @s run particle dust{color:[0.0,0.5,1.0],scale:4} ~ ~1 ~ 3 0.1 3 0 200 force
execute at @s run particle dust{color:[0.0,0.5,1.0],scale:4} ~ ~1 ~ 4 0.1 4 0 250 force

# Guardian laser effect to attacker
execute at @s facing entity @e[tag=reprisal_attacker,limit=1] eyes run particle dust{color:[0.0,1.0,1.0],scale:3} ^ ^1 ^1 0.1 0.1 0.1 0 30 force
execute at @s facing entity @e[tag=reprisal_attacker,limit=1] eyes run particle dust{color:[0.0,1.0,1.0],scale:3} ^ ^1 ^2 0.1 0.1 0.1 0 30 force
execute at @s facing entity @e[tag=reprisal_attacker,limit=1] eyes run particle dust{color:[0.0,1.0,1.0],scale:3} ^ ^1 ^3 0.1 0.1 0.1 0 30 force
execute at @s facing entity @e[tag=reprisal_attacker,limit=1] eyes run particle falling_water ^ ^1 ^1.5 0.2 0.2 0.2 0 40 force

# COUNTER SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound entity.guardian.attack master @a ~ ~ ~ 3 2
execute at @s run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 3 2
execute at @s run playsound block.conduit.attack.target master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⛉ COUNTER! ⛉","color":"aqua","bold":true}]
title @s subtitle [{"text":"Guardian's retribution","color":"dark_aqua"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"   ⛉ REPRISAL EXECUTED ⛉","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"  Counter Damage: 14 HP","color":"red"}]
tellraw @s [{"text":"  Attacker stunned: 2s","color":"gold"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]

# COUNTER DAMAGE (14 HP)
execute as @e[tag=reprisal_attacker,limit=1] run damage @s 14 thorns by @p[tag=reprisal_stance]

# Damage visuals on attacker
execute as @e[tag=reprisal_attacker,limit=1] at @s run particle explosion ~ ~1 ~ 2 2 2 0 30 force
execute as @e[tag=reprisal_attacker,limit=1] at @s run particle dust{color:[0.0,1.0,1.0],scale:4} ~ ~1 ~ 2 2 2 1 300 force
execute as @e[tag=reprisal_attacker,limit=1] at @s run particle falling_water ~ ~1 ~ 1.5 1.5 1.5 1 200 force
execute as @e[tag=reprisal_attacker,limit=1] at @s run particle block{block_state:"minecraft:prismarine"} ~ ~1 ~ 1.5 1.5 1.5 1 150 force

# STUN ATTACKER (2 seconds)
execute as @e[tag=reprisal_attacker,limit=1] run effect give @s slowness 2 4 true
execute as @e[tag=reprisal_attacker,limit=1] run effect give @s jump_boost 2 250 true
execute as @e[tag=reprisal_attacker,limit=1] run effect give @s mining_fatigue 2 3 true
execute as @e[tag=reprisal_attacker,limit=1] run effect give @s weakness 2 2 true
execute as @e[tag=reprisal_attacker,limit=1] run effect give @s glowing 2 0 true

# Ocean pressure on attacker (crushing)
execute as @e[tag=reprisal_attacker,limit=1] at @s run particle dust{color:[0.0,0.3,0.5],scale:3} ~ ~2 ~ 0.8 0.3 0.8 0 60 force
execute as @e[tag=reprisal_attacker,limit=1] at @s run particle falling_water ~ ~2.5 ~ 0.6 0.2 0.6 0.5 40 force

# KNOCKBACK ATTACKER
execute as @e[tag=reprisal_attacker,limit=1] at @s facing entity @p[tag=reprisal_stance] feet run tp @s ^ ^ ^-5
execute as @e[tag=reprisal_attacker,limit=1] run effect give @s levitation 2 2 true

# Cleanup
tag @s remove reprisal_stance
tag @s remove prismarine2_immune
tag @e remove reprisal_attacker
scoreboard players reset @s reprisal_window
scoreboard players reset @s reprisal_triggered