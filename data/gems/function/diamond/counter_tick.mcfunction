# ==========================================
# COUNTER WINDOW ACTIVE
# ==========================================

# Shield visuals (spinning)
particle block{block_state:{Name:"minecraft:diamond_block"}} ~1 ~1 ~ 0.2 0.5 0.2 0 5 force
particle block{block_state:{Name:"minecraft:diamond_block"}} ~-1 ~1 ~ 0.2 0.5 0.2 0 5 force
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~1 0.2 0.5 0.2 0 5 force
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~-1 0.2 0.5 0.2 0 5 force
particle end_rod ~ ~1 ~ 1 1 1 0.1 10 force
particle glow ~ ~1 ~ 0.8 0.8 0.8 0.05 8 force

# Pulsing circle
execute if score @s counter_window matches 20.. run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~0.1 ~ 2 0.1 2 0 20 force
execute if score @s counter_window matches ..19 run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~0.1 ~ 2 0.1 2 0 30 force

# Display countdown
title @s actionbar [{"text":"⬥ COUNTER: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"counter_window"},"color":"yellow"},{"text":" ticks | HIT ME!","color":"gray"}]

# Sound warnings
execute if score @s counter_window matches 30 run playsound block.note_block.bell master @s ~ ~ ~ 1 2
execute if score @s counter_window matches 20 run playsound block.note_block.bell master @s ~ ~ ~ 1.5 2
execute if score @s counter_window matches 10 run playsound block.note_block.bell master @s ~ ~ ~ 2 2
execute if score @s counter_window matches 5 run playsound block.note_block.pling master @s ~ ~ ~ 2 2