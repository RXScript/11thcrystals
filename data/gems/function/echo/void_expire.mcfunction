# ==========================================
# VOID STEP EXPIRES - RETURN TO REALITY
# ==========================================

# RETURN VISUALS
execute at @s run particle explosion ~ ~1 ~ 2 2 2 0 30 force
execute at @s run particle dust{color:[0.1,0.0,0.2],scale:3} ~ ~1 ~ 2 2 2 1 200 force
execute at @s run particle portal ~ ~1 ~ 1.5 1.5 1.5 2 150 force
execute at @s run particle sculk_charge_pop ~ ~1 ~ 1 1 1 0 100 force
execute at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 3 force

# Void fades
execute at @s run particle dust{color:[0.0,0.0,0.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 80 force
execute at @s run particle sculk_soul ~ ~1 ~ 1 1 1 0.3 60 force

# RETURN SOUND
execute at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.sculk_sensor.clicking master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.warden.heartbeat master @a ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"◈ VOID FADED ◈","color":"dark_gray","bold":true}]
title @s subtitle [{"text":"Return to reality","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]
tellraw @s [{"text":"   ◈ VOID COMPLETE ◈","color":"dark_purple","bold":true}]
tellraw @s [{"text":"  Stealth duration ended","color":"gray"}]
tellraw @s [{"text":"  No damage dealt","color":"dark_gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]

# Cleanup
tag @s remove void_stepping
tag @s remove echo2_immune
tag @e remove void_target
tag @e remove void_pulse_victim
scoreboard players reset @s void2_timer
scoreboard players reset @s void_broken