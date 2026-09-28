# ==========================================
# EMBER HEART ACTIVE - BURNING BLOOD
# ==========================================

# Burning aura particles
particle flame ~ ~1 ~ 1.2 1.2 1.2 0.2 20 force
particle lava ~ ~1 ~ 0.8 0.8 0.8 0.5 10 force
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 1 1 1 0.3 15 force

# Phoenix fire rising from feet
particle flame ~ ~0.1 ~ 0.5 0.1 0.5 0.1 10 force
particle flame ~ ~0.5 ~ 0.4 0.1 0.4 0.1 8 force
particle flame ~ ~1 ~ 0.3 0.1 0.3 0.1 6 force

# Burning heart visualization
particle dust{color:[1.0,0.2,0.0],scale:2} ~ ~1 ~ 0.2 0.4 0.2 0 8 force
particle lava ~ ~1 ~ 0.15 0.25 0.15 0 5 force

# Mark enemies for fire aspect
execute at @s as @e[distance=0.1..18,type=!#minecraft:arrows,type=!item,tag=!ruby2_immune] run tag @s add ember_target

# Show targets with flame aura
execute at @s as @e[distance=0.1..18,tag=ember_target] at @s run particle flame ~ ~1.5 ~ 0.3 0.4 0.3 0.02 3 force
execute at @s as @e[distance=0.1..18,tag=ember_target] at @s run particle dust{color:[1.0,0.3,0.0],scale:1.5} ~ ~1 ~ 0.4 0.6 0.4 0 5 force

# Burning sound
execute if score @s ember_timer matches 80 run playsound block.fire.ambient master @s ~ ~ ~ 1 2
execute if score @s ember_timer matches 60 run playsound block.fire.ambient master @s ~ ~ ~ 1 2
execute if score @s ember_timer matches 40 run playsound block.fire.ambient master @s ~ ~ ~ 1 2
execute if score @s ember_timer matches 20 run playsound block.fire.ambient master @s ~ ~ ~ 1.5 2

# Display status
execute if score @s ember_timer matches 50.. run title @s actionbar [{"text":"🔥 EMBER: ","color":"red","bold":true},{"score":{"name":"@s","objective":"ember_timer"},"color":"gold"},{"text":" ticks","color":"gray"}]
execute if score @s ember_timer matches 25..49 run title @s actionbar [{"text":"🔥 EMBER: ","color":"red","bold":true},{"score":{"name":"@s","objective":"ember_timer"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s ember_timer matches ..24 run title @s actionbar [{"text":"🔥 EMBER: ","color":"red","bold":true},{"score":{"name":"@s","objective":"ember_timer"},"color":"red"},{"text":" ticks","color":"gray"}]