# ==========================================
# VERDANT GRASP ACTIVE - LIFE FLOWS
# ==========================================

# Green life energy particles around player
particle dust{color:[0.0,1.0,0.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 20 force
particle happy_villager ~ ~1 ~ 1.2 1.2 1.2 0.3 15 force
particle block{block_state:"minecraft:emerald_block"} ~ ~1 ~ 1 1 1 0.5 10 force

# Living green aura
particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~0.5 ~ 1 0.5 1 0.3 10 force
particle dust{color:[0.0,1.0,0.0],scale:2} ~ ~1.5 ~ 0.8 0.5 0.8 0.2 8 force

# Vine tendrils reaching out
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:1.5} ~1 ~1 ~ 0.2 0.5 0.2 0 3 force
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:1.5} ~-1 ~1 ~ 0.2 0.5 0.2 0 3 force
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:1.5} ~ ~1 ~1 0.2 0.5 0.2 0 3 force
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:1.5} ~ ~1 ~-1 0.2 0.5 0.2 0 3 force

# Mark potential victims with green glow
execute at @s as @e[distance=0.1..18,tag=grasp_victim] at @s run particle happy_villager ~ ~1.5 ~ 0.3 0.4 0.3 0 5 force
execute at @s as @e[distance=0.1..18,tag=grasp_victim] at @s run particle dust{color:[0.0,1.0,0.0],scale:1.5} ~ ~1 ~ 0.4 0.6 0.4 0 8 force

# Pulsing sound
execute if score @s grasp_timer matches 60 run playsound block.grass.break master @s ~ ~ ~ 1 2
execute if score @s grasp_timer matches 40 run playsound block.grass.break master @s ~ ~ ~ 1 2
execute if score @s grasp_timer matches 20 run playsound block.grass.break master @s ~ ~ ~ 1.5 2

# Display status
execute if score @s grasp_timer matches 40.. run title @s actionbar [{"text":"☘ GRASP: ","color":"green","bold":true},{"score":{"name":"@s","objective":"grasp_timer"},"color":"green"},{"text":" ticks | Healed: ","color":"gray"},{"score":{"name":"@s","objective":"grasp_healed"},"color":"yellow"},{"text":" HP","color":"gray"}]
execute if score @s grasp_timer matches 20..39 run title @s actionbar [{"text":"☘ GRASP: ","color":"green","bold":true},{"score":{"name":"@s","objective":"grasp_timer"},"color":"yellow"},{"text":" ticks | Healed: ","color":"gray"},{"score":{"name":"@s","objective":"grasp_healed"},"color":"yellow"},{"text":" HP","color":"gray"}]
execute if score @s grasp_timer matches ..19 run title @s actionbar [{"text":"☘ GRASP: ","color":"green","bold":true},{"score":{"name":"@s","objective":"grasp_timer"},"color":"red"},{"text":" ticks | Healed: ","color":"gray"},{"score":{"name":"@s","objective":"grasp_healed"},"color":"yellow"},{"text":" HP","color":"gray"}]