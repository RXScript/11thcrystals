# ==========================================
# EXCHANGE WINDOW ACTIVE
# ==========================================

# Green life energy swirling
particle happy_villager ~ ~1 ~ 1.5 1.5 1.5 0.5 20 force
particle dust{color:[0.0,1.0,0.0],scale:2} ~ ~1 ~ 1 1 1 0.3 15 force
particle glow ~ ~1 ~ 0.8 0.8 0.8 0.05 10 force

# Pulsing ground circle
execute if score @s exchange_window matches 40.. run particle happy_villager ~ ~0.1 ~ 2 0.1 2 0 15 force
execute if score @s exchange_window matches 20..39 run particle happy_villager ~ ~0.1 ~ 2 0.1 2 0 25 force
execute if score @s exchange_window matches ..19 run particle happy_villager ~ ~0.1 ~ 2 0.1 2 0 35 force

# Show potential enemies
execute at @s as @e[distance=0.1..8,tag=!exchange_immune] at @s run particle dust{color:[0.0,1.0,0.0],scale:1.5} ~ ~1.5 ~ 0.3 0.5 0.3 0 5 force

# Display countdown
title @s actionbar [{"text":"⬥ EXCHANGE: ","color":"green","bold":true},{"score":{"name":"@s","objective":"exchange_window"},"color":"yellow"},{"text":" | Sacrificed: ","color":"gray"},{"score":{"name":"@s","objective":"exchange_sacrificed"},"color":"red"},{"text":" HP","color":"gray"}]

# Sound warnings
execute if score @s exchange_window matches 45 run playsound entity.villager.ambient master @s ~ ~ ~ 1 1.5
execute if score @s exchange_window matches 30 run playsound entity.villager.ambient master @s ~ ~ ~ 1.5 1.5
execute if score @s exchange_window matches 15 run playsound entity.villager.ambient master @s ~ ~ ~ 2 2
execute if score @s exchange_window matches 5 run playsound block.note_block.pling master @s ~ ~ ~ 2 2