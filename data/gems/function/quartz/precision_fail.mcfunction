# ==========================================
# FAILURE - MISSED PRECISION WINDOW!
# ==========================================

# DISSIPATE VISUALS
execute at @s run particle smoke ~ ~1 ~ 2 2 2 0.3 80 force
execute at @s run particle dust{color:[0.5,0.5,0.5],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 60 force

# DISSIPATE SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"◈ PRECISION FADED ◈","color":"gray","bold":true}]
title @s subtitle [{"text":"Calculation expired","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gray","bold":true}]
tellraw @s [{"text":"  ◈ PRECISION LOST ◈","color":"gray","bold":true}]
tellraw @s [{"text":"  You didn't strike in time!","color":"dark_gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gray","bold":true}]

# Cleanup
tag @s remove precision_charged
tag @s remove quartz2_immune
tag @e remove precision_target
tag @e remove precision_victim
tag @e remove precision_kill_check
scoreboard players reset @s precision_window
scoreboard players reset @s precision_used
scoreboard players reset @s precision_kill_timer