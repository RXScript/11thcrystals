# ==========================================
# CHAIN IGNITION ACTIVE - SPRINT TO IGNITE
# ==========================================

# Fire trail behind player
particle flame ~ ~0.5 ~ 0.5 0.5 0.5 0.05 15 force
particle dust{color:[1.0,0.3,0.0],scale:2} ~ ~1 ~ 0.8 0.8 0.8 0.2 10 force
particle lava ~ ~0.5 ~ 0.3 0.3 0.3 0 5 force

# Show sparks on unignited enemies
execute at @s as @e[distance=0.1..20,tag=spark_marked,scores={spark_ignited=0}] at @s run particle flame ~ ~2 ~ 0.3 0.5 0.3 0.02 5 force
execute at @s as @e[distance=0.1..20,tag=spark_marked,scores={spark_ignited=0}] at @s run particle lava ~ ~2 ~ 0.2 0.3 0.2 0 3 force

# Show ignited sparks (burning)
execute at @s as @e[distance=0.1..20,tag=spark_marked,scores={spark_ignited=1}] at @s run particle flame ~ ~1 ~ 0.4 0.8 0.4 0.1 10 force
execute at @s as @e[distance=0.1..20,tag=spark_marked,scores={spark_ignited=1}] at @s run particle smoke ~ ~1 ~ 0.3 0.6 0.3 0.05 8 force

# Display ignition progress
execute if score @s sparks_ignited matches ..5 run title @s actionbar [{"text":"🔥 IGNITING: ","color":"red","bold":true},{"score":{"name":"@s","objective":"sparks_ignited"},"color":"yellow"},{"text":"/6 | ","color":"gray"},{"score":{"name":"@s","objective":"ignition_timer"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s sparks_ignited matches 6.. run title @s actionbar [{"text":"✓ CHAIN READY: ","color":"green","bold":true},{"score":{"name":"@s","objective":"sparks_ignited"},"color":"gold"},{"text":" sparks!","color":"gray"}]

# Sound warnings
execute if score @s ignition_timer matches 50 run playsound block.fire.ambient master @s ~ ~ ~ 1 1.5
execute if score @s ignition_timer matches 40 run playsound block.fire.ambient master @s ~ ~ ~ 1.5 1.5
execute if score @s ignition_timer matches 30 run playsound block.fire.ambient master @s ~ ~ ~ 2 2
execute if score @s ignition_timer matches 20 run playsound entity.blaze.hurt master @s ~ ~ ~ 2 2
execute if score @s ignition_timer matches 10 run playsound entity.blaze.hurt master @s ~ ~ ~ 2.5 2