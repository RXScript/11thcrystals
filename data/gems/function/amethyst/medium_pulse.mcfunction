# ==========================================
# PARTIAL SUCCESS - MEDIUM PULSE
# ==========================================

# MEDIUM EXPLOSION
particle explosion ~ ~1 ~ 5 5 5 0 80 force
particle dust{color:[0.5,0.0,0.5],scale:3} ~ ~1 ~ 3 3 3 1 300 force
particle sculk_charge{roll:3.0} ~ ~1 ~ 2 2 2 0 150 force

# SOUND
execute at @s run playsound block.amethyst_block.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 2 1.5

# MEDIUM DAMAGE (25 HP)
execute at @s as @e[distance=0.1..20,tag=vibration_source] run damage @s 25 sonic_boom by @p[tag=seismic_sensing]

# Medium knockback
execute at @s as @e[distance=0.1..20,tag=vibration_source] at @s facing entity @p[tag=seismic_sensing] feet run tp @s ^ ^ ^-5

# MINOR BUFFS (6 seconds)
effect give @s strength 6 0 true
effect give @s speed 6 1 true

# Messages
title @s title [{"text":"⬥ MEDIUM PULSE ⬥","color":"yellow","bold":true}]
title @s subtitle [{"text":"Decent vibrations","color":"gold"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"yellow","bold":true}]
tellraw @s [{"text":"   ⬥ PARTIAL SUCCESS ⬥","color":"yellow","bold":true}]
tellraw @s [{"text":"  Vibrations: ","color":"gray"},{"score":{"name":"@s","objective":"vibration_count"},"color":"yellow"},{"text":"/80","color":"gray"}]
tellraw @s [{"text":"  Pulse Damage: 25 HP","color":"red"}]
tellraw @s [{"text":"  Minor buffs applied","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"yellow","bold":true}]

# Cleanup
tag @s remove seismic_sensing
tag @s remove seismic_immune
tag @e remove vibration_source
scoreboard players reset @e entity_last_x
scoreboard players reset @e entity_last_z
scoreboard players reset @s seismic_timer
scoreboard players reset @s vibration_count
scoreboard players reset @s detonated