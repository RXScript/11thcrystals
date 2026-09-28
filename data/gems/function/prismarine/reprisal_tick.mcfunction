# ==========================================
# GUARDIAN'S REPRISAL STANCE - READY
# ==========================================

# Guardian aura particles (shifting prismarine colors)
particle dust{color:[0.0,0.5,0.5],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 15 force
particle dust{color:[0.0,0.7,0.7],scale:2} ~ ~1 ~ 1.3 1.3 1.3 0.4 12 force
particle dust{color:[0.0,0.9,0.9],scale:2} ~ ~1 ~ 1.1 1.1 1.1 0.3 10 force
particle falling_water ~ ~2 ~ 1.2 1.2 1.2 0.5 15 force

# Protective sphere
particle dust{color:[0.0,0.8,0.8],scale:2} ~1.5 ~1 ~ 0.1 0.8 0.1 0 8 force
particle dust{color:[0.0,0.8,0.8],scale:2} ~-1.5 ~1 ~ 0.1 0.8 0.1 0 8 force
particle dust{color:[0.0,0.8,0.8],scale:2} ~ ~1 ~1.5 0.1 0.8 0.1 0 8 force
particle dust{color:[0.0,0.8,0.8],scale:2} ~ ~1 ~-1.5 0.1 0.8 0.1 0 8 force

# Ocean pressure at feet
particle dust{color:[0.0,0.5,1.0],scale:3} ~ ~0.1 ~ 1.2 0.1 1.2 0 20 force
particle falling_water ~ ~0.5 ~ 1 0.3 1 0 10 force

# Prismarine shimmer
particle block{block_state:"minecraft:prismarine"} ~ ~1 ~ 1 1 1 0.5 8 force

# Guardian stance sound
execute if score @s reprisal_window matches 30 run playsound entity.guardian.ambient master @s ~ ~ ~ 1.5 2
execute if score @s reprisal_window matches 20 run playsound entity.guardian.ambient master @s ~ ~ ~ 1.8 2
execute if score @s reprisal_window matches 10 run playsound entity.guardian.ambient master @s ~ ~ ~ 2 2

# Display status
execute if score @s reprisal_window matches 20.. run title @s actionbar [{"text":"⛉ STANCE: ","color":"dark_aqua","bold":true},{"score":{"name":"@s","objective":"reprisal_window"},"color":"green"},{"text":" ticks","color":"gray"}]
execute if score @s reprisal_window matches 10..19 run title @s actionbar [{"text":"⛉ STANCE: ","color":"dark_aqua","bold":true},{"score":{"name":"@s","objective":"reprisal_window"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s reprisal_window matches ..9 run title @s actionbar [{"text":"⚠ STANCE: ","color":"dark_aqua","bold":true},{"score":{"name":"@s","objective":"reprisal_window"},"color":"red"},{"text":" ticks!","color":"gray"}]