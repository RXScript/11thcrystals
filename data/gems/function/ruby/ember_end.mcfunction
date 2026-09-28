# ==========================================
# EMBER HEART ENDS - FLAME FADES
# ==========================================

# FLAME DISSIPATE VISUALS
execute at @s run particle explosion ~ ~1 ~ 2 2 2 0 30 force
execute at @s run particle flame ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s run particle lava ~ ~1 ~ 1.5 1.5 1.5 1 100 force
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 2 2 2 1 150 force
execute at @s run particle smoke ~ ~1 ~ 1.5 1.5 1.5 0.3 100 force

# Phoenix ashes falling
execute at @s run particle smoke ~ ~2 ~ 1 0.1 1 0.1 50 force
execute at @s run particle dust{color:[0.3,0.3,0.3],scale:1.5} ~ ~2 ~ 1 0.1 1 0.1 40 force

# DISSIPATE SOUND
execute at @s run playsound block.fire.extinguish master @a ~ ~ ~ 2 1
execute at @s run playsound entity.blaze.death master @a ~ ~ ~ 2 2

# Messages
title @s title [{"text":"🔥 EMBER FADED 🔥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"The phoenix rests","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   🔥 EMBER COMPLETE 🔥","color":"red","bold":true}]
tellraw @s [{"text":"  Phoenix fire extinguished","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove ember_heart_active
tag @s remove ruby2_immune
tag @e remove ember_target
scoreboard players reset @s ember_timer