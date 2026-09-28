# ==========================================
# GRASP ENDS - VERDANT RELEASE
# ==========================================

# RELEASE VISUALS
execute at @s run particle explosion ~ ~1 ~ 2 2 2 0 30 force
execute at @s run particle happy_villager ~ ~1 ~ 2 2 2 0.8 200 force
execute at @s run particle dust{color:[0.0,1.0,0.0],scale:3} ~ ~1 ~ 2 2 2 1 150 force
execute at @s run particle block{block_state:"minecraft:emerald_block"} ~ ~1 ~ 1.5 1.5 1.5 1 100 force

# Vines retract
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~1.5 ~ 0.5 0.1 0.5 0 15 force
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~1 ~ 0.6 0.1 0.6 0 20 force
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~0.5 ~ 0.7 0.1 0.7 0 25 force
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~0.1 ~ 0.8 0.1 0.8 0 30 force

# RELEASE SOUND
execute at @s run playsound block.grass.break master @a ~ ~ ~ 2 1
execute at @s run playsound block.grass.break master @a ~ ~ ~ 2 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 1.5

# Messages
title @s title [{"text":"☘ GRASP FADED ☘","color":"dark_green","bold":true}]
title @s subtitle [{"text":"The living green recedes","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @s [{"text":"   ☘ GRASP COMPLETE ☘","color":"green","bold":true}]
tellraw @s [{"text":"  Life Drained: ","color":"gray"},{"score":{"name":"@s","objective":"grasp_healed"},"color":"yellow"},{"text":" HP","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# Cleanup
tag @s remove verdant_grasping
tag @s remove emerald_immune
tag @e remove grasp_victim
scoreboard players reset @s grasp_timer
scoreboard players reset @s grasp_healed