# ==========================================
# SUCCESS - CIRCUIT COLLAPSE!
# ==========================================

# Mark as triggered
scoreboard players set @s circuit_triggered 1

# Get position of marked target for AoE
execute as @e[tag=circuit_marked,limit=1] at @s run tag @s add collapse_center

# MASSIVE CIRCUIT COLLAPSE EXPLOSION
execute at @e[tag=collapse_center,limit=1] run particle explosion_emitter ~ ~1 ~ 0 0 0 0 50 force
execute at @e[tag=collapse_center,limit=1] run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @e[tag=collapse_center,limit=1] run particle dust{color:[1.0,0.0,0.0],scale:4} ~ ~1 ~ 0 0 0 3 800 force
execute at @e[tag=collapse_center,limit=1] run particle electric_spark ~ ~1 ~ 0 0 0 5 600 force
execute at @e[tag=collapse_center,limit=1] run particle flame ~ ~1 ~ 0 0 0 10 500 force
execute at @e[tag=collapse_center,limit=1] run particle lava ~ ~1 ~ 3 3 3 2 300 force

# Circuit breaking visuals
execute at @e[tag=collapse_center,limit=1] run particle smoke ~ ~1 ~ 5 5 5 0.5 200 force
execute at @e[tag=collapse_center,limit=1] run particle dust{color:[0.3,0.0,0.0],scale:4} ~ ~1 ~ 4 4 4 1 400 force

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 1.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 1.5
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 1

# Messages
title @s title [{"text":"⬥ CIRCUIT COLLAPSE ⬥","color":"gold","bold":true}]
title @s subtitle [{"text":"Perfect timing!","color":"yellow"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"   ⬥ CIRCUIT COLLAPSE ⬥","color":"gold","bold":true}]
tellraw @s [{"text":"  Direct Damage: 24 HP","color":"red"}]
tellraw @s [{"text":"  AoE Pulse: 11 HP","color":"dark_red"}]
tellraw @s [{"text":"  • Haste II (10s)","color":"green"}]
tellraw @s [{"text":"  • Speed II (10s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# PRIMARY DAMAGE TO MARKED TARGET (24 HP)
execute as @e[tag=circuit_marked,limit=1] run damage @s 24 lightning_bolt by @p[tag=dead_circuit_active]

# AOE PULSE DAMAGE (11 HP to nearby enemies within 6 blocks)
execute at @e[tag=collapse_center,limit=1] as @e[distance=0.1..6,type=!#minecraft:arrows,type=!item,tag=!redstone_immune] run damage @s 11 explosion by @p[tag=dead_circuit_active]

# AoE visuals
execute at @e[tag=collapse_center,limit=1] as @e[distance=0.1..6,tag=!redstone_immune] at @s run particle explosion ~ ~1 ~ 1 1 1 0 15 force
execute at @e[tag=collapse_center,limit=1] as @e[distance=0.1..6,tag=!redstone_immune] at @s run particle electric_spark ~ ~1 ~ 1 1 1 0.5 80 force

# SHORT DEBUFFS TO PRIMARY TARGET (3 seconds)
execute as @e[tag=circuit_marked,limit=1] run effect give @s slowness 3 2 true
execute as @e[tag=circuit_marked,limit=1] run effect give @s weakness 3 1 true
execute as @e[tag=circuit_marked,limit=1] run effect give @s glowing 3 0 true

# KNOCKBACK
execute as @e[tag=circuit_marked,limit=1] at @s facing entity @p[tag=dead_circuit_active] feet run tp @s ^ ^ ^-6
execute as @e[tag=circuit_marked,limit=1] run effect give @s levitation 2 2 true

# BUFFS FOR PLAYER (10 seconds)
effect give @s haste 10 1 true
effect give @s speed 10 1 true
effect give @s strength 10 0 true
effect give @s regeneration 10 0 true

# Cleanup
tag @s remove dead_circuit_active
tag @s remove redstone3_immune
tag @e remove circuit_marked
tag @e remove collapse_center
scoreboard players reset @s circuit_window
scoreboard players reset @s circuit_triggered