# ==========================================
# SHATTER FREQUENCY CHARGED - RESONATING
# ==========================================

# Purple resonant energy around player
particle dust{color:[0.5,0.0,1.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 20 force
particle end_rod ~ ~1 ~ 1.2 1.2 1.2 0.1 15 force
particle block{block_state:"minecraft:amethyst_block"} ~ ~1 ~ 1 1 1 0.5 10 force

# Vibration waves on weapon/hand
particle dust{color:[0.5,0.0,1.0],scale:2} ^0.5 ^1 ^0.5 0.1 0.1 0.1 0 5 force
particle dust{color:[0.5,0.0,1.0],scale:2} ^-0.5 ^1 ^0.5 0.1 0.1 0.1 0 5 force

# Sound waves expanding
execute at @s run particle dust{color:[0.3,0.0,0.6],scale:1.5} ~ ~1 ~ 1.5 0.1 1.5 0 15 force
execute at @s run particle dust{color:[0.3,0.0,0.6],scale:1.5} ~ ~1 ~ 2 0.1 2 0 10 force

# Resonant hum sound
execute if score @s frequency_window matches 50 run playsound block.amethyst_block.chime master @s ~ ~ ~ 1 2
execute if score @s frequency_window matches 40 run playsound block.amethyst_block.chime master @s ~ ~ ~ 1.2 2
execute if score @s frequency_window matches 30 run playsound block.amethyst_block.chime master @s ~ ~ ~ 1.5 2
execute if score @s frequency_window matches 20 run playsound block.amethyst_block.chime master @s ~ ~ ~ 1.8 2
execute if score @s frequency_window matches 10 run playsound block.amethyst_block.chime master @s ~ ~ ~ 2 2

# Display status
execute if score @s frequency_window matches 30.. run title @s actionbar [{"text":"♪ CHARGED: ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"frequency_window"},"color":"green"},{"text":" ticks","color":"gray"}]
execute if score @s frequency_window matches 15..29 run title @s actionbar [{"text":"♪ CHARGED: ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"frequency_window"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s frequency_window matches ..14 run title @s actionbar [{"text":"⚠ CHARGED: ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"frequency_window"},"color":"red"},{"text":" ticks!","color":"gray"}]