# ==========================================
# AMBER WEIGHT - Resin becomes heavy
# ==========================================

# Increment weight counter
scoreboard players add @s amber_weight_count 1

# Damage increases with weight (3, 5, 7, 9 HP per application)
execute if score @s amber_weight_count matches 1 run damage @s 3 cramming
execute if score @s amber_weight_count matches 2 run damage @s 5 cramming
execute if score @s amber_weight_count matches 3 run damage @s 7 cramming
execute if score @s amber_weight_count matches 4 run damage @s 9 cramming

# Visual feedback
particle falling_honey ~ ~1 ~ 1 1.5 1 0.3 40 force
particle dust{color:[1.0,0.7,0.0],scale:2} ~ ~1 ~ 0.8 1.2 0.8 0.2 30 force

# Sound
execute at @s run playsound block.honey_block.break master @s ~ ~ ~ 1 0.5
execute at @s run playsound entity.player.hurt master @s ~ ~ ~ 0.8 1

# Update health tracker after weight damage
execute store result score @s health_before run data get entity @s Health 1