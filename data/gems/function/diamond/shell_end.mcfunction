# ==========================================
# SHELL ENDS - CRYSTALLIZE COMPLETE
# ==========================================

# SHELL SHATTER VISUALS
execute at @s run particle explosion ~ ~1 ~ 2 2 2 0 30 force
execute at @s run particle block{block_state:"minecraft:diamond_block"} ~ ~1 ~ 2 2 2 1 200 force
execute at @s run particle dust{color:[0.0,1.0,1.0],scale:4} ~ ~1 ~ 2 2 2 1 150 force
execute at @s run particle end_rod ~ ~1 ~ 1.5 1.5 1.5 0.3 100 force

# SHATTER SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 2
execute at @s run playsound item.armor.unequip_diamond master @a ~ ~ ~ 2 1

# Messages
title @s title [{"text":"◈ SHELL FADED ◈","color":"dark_aqua","bold":true}]
title @s subtitle [{"text":"Diamond returns to rest","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @s [{"text":"   ◈ SHELL COMPLETE ◈","color":"aqua","bold":true}]
tellraw @s [{"text":"  Total Absorbed: ","color":"gray"},{"score":{"name":"@s","objective":"shell_absorbed"},"color":"yellow"},{"text":" HP","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]

# Cleanup
tag @s remove stone_shell_active
tag @s remove diamond_immune
scoreboard players reset @s shell_timer
scoreboard players reset @s shell_absorbed