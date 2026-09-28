# ==========================================
# STEALTH BROKEN - VOID COLLAPSE!
# ==========================================

# Check if already broken
execute if score @s void_broken matches 1 run return fail

# Mark as broken
scoreboard players set @s void_broken 1

# VOID COLLAPSE EXPLOSION
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 30 force
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[0.1,0.0,0.2],scale:4} ~ ~1 ~ 0 0 0 3 1000 force
execute at @s run particle portal ~ ~1 ~ 0 0 0 10 800 force
execute at @s run particle sculk_charge_pop ~ ~1 ~ 0 0 0 3 600 force
execute at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 10 force

# Void implosion waves
execute at @s run particle dust{color:[0.0,0.0,0.0],scale:4} ~ ~1 ~ 1 0.1 1 0 100 force
execute at @s run particle dust{color:[0.0,0.0,0.0],scale:4} ~ ~1 ~ 2 0.1 2 0 150 force
execute at @s run particle dust{color:[0.0,0.0,0.0],scale:4} ~ ~1 ~ 3 0.1 3 0 200 force
execute at @s run particle dust{color:[0.0,0.0,0.0],scale:4} ~ ~1 ~ 4 0.1 4 0 250 force

# Sculk spread
execute at @s run particle sculk_soul ~ ~1 ~ 3 3 3 1 300 force

# VOID BREAK SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 3 2
execute at @s run playsound block.sculk_shrieker.shriek master @a ~ ~ ~ 3 2
execute at @s run playsound entity.enderman.scream master @a ~ ~ ~ 3 0.5

# Messages
title @s title [{"text":"◈ VOID BREAK! ◈","color":"dark_purple","bold":true}]
title @s subtitle [{"text":"Silent scream","color":"dark_gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]
tellraw @s [{"text":"   ◈ VOID COLLAPSE ◈","color":"dark_purple","bold":true}]
tellraw @s [{"text":"  Pulse Damage: 12 HP","color":"red"}]
tellraw @s [{"text":"  Radius: 5 blocks","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]

# VOID PULSE DAMAGE (12 HP to nearby enemies)
execute at @s as @e[distance=0.1..5,type=!#minecraft:arrows,type=!item,tag=!echo2_immune] run damage @s 12 sonic_boom by @p[tag=void_stepping]

# Pulse visuals on hit enemies
execute at @s as @e[distance=0.1..5,tag=!echo2_immune] at @s run particle explosion ~ ~1 ~ 1 1 1 0 15 force
execute at @s as @e[distance=0.1..5,tag=!echo2_immune] at @s run particle dust{color:[0.1,0.0,0.2],scale:3} ~ ~1 ~ 1 1 1 0.5 80 force
execute at @s as @e[distance=0.1..5,tag=!echo2_immune] at @s run particle portal ~ ~1 ~ 1 1 1 2 100 force
execute at @s as @e[distance=0.1..5,tag=!echo2_immune] at @s run particle sculk_soul ~ ~1 ~ 0.8 0.8 0.8 0.5 60 force

# Void debuff to hit enemies (2 seconds)
execute at @s as @e[distance=0.1..5,tag=!echo2_immune] run effect give @s darkness 2 0 true
execute at @s as @e[distance=0.1..5,tag=!echo2_immune] run effect give @s slowness 2 1 true
execute at @s as @e[distance=0.1..5,tag=!echo2_immune] run effect give @s glowing 2 0 true

# Cleanup
tag @s remove void_stepping
tag @s remove echo2_immune
tag @e remove void_target
tag @e remove void_pulse_victim
scoreboard players reset @s void2_timer
scoreboard players reset @s void_broken