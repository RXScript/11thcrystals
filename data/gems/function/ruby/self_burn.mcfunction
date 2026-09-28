# BURN YOURSELF - Taking fire damage
damage @s 3 on_fire
scoreboard players add @s self_burn_damage 3

# Visual feedback
particle flame ~ ~1 ~ 0.8 1 0.8 0.5 50 force
particle soul_fire_flame ~ ~1 ~ 0.6 0.8 0.6 0.3 40 force
particle smoke ~ ~1 ~ 0.5 0.6 0.5 0.2 30 force

# Sound
execute at @s run playsound entity.generic.burn master @s ~ ~ ~ 1 1
execute at @s run playsound entity.blaze.hurt master @s ~ ~ ~ 0.8 1.5