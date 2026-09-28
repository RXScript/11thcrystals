# ==========================================
# MOVEMENT DETECTED - FOCUS BROKEN!
# ==========================================

# Mark as broken
scoreboard players set @s focus_broken 1

# Stop charging
scoreboard players set @s focus_charge 0

# ERROR VISUALS
particle smoke ~ ~1 ~ 1 1 1 0.3 80 force
particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 1 1 1 0.5 60 force
particle electric_spark ~ ~1 ~ 1 1 1 0.3 40 force

# HARSH SOUND
execute at @s run playsound entity.guardian.hurt master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"⚠ FOCUS BROKEN ⚠","color":"red","bold":true}]
title @s subtitle [{"text":"You moved!","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"  ⚠ MOVEMENT DETECTED ⚠","color":"red","bold":true}]
tellraw @s [{"text":"  You broke the channel!","color":"gray"}]
tellraw @s [{"text":"  Beam will fail...","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

effect give @s slowness 4 0 true

# Cleanup
tag @s remove guardian_focusing
tag @s remove prismarine_immune
tag @e remove laser_target
scoreboard players reset @s focus_timer
scoreboard players reset @s focus_charge
scoreboard players reset @s focus_broken
scoreboard players reset @s focus_pos_x
scoreboard players reset @s focus_pos_y
scoreboard players reset @s focus_pos_z