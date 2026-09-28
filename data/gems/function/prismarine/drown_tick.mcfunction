# DROWNING - Taking water damage
damage @s 3 drown
scoreboard players add @s drowning_damage 3

# Visual feedback - suffocating
particle bubble ~ ~1.5 ~ 0.6 0.8 0.6 0.3 40 force
particle splash ~ ~1 ~ 0.5 1 0.5 0.5 30 force
particle falling_water ~ ~2 ~ 0.4 0.5 0.4 0.2 20 force

# Sound
execute at @s run playsound entity.player.hurt_drown master @s ~ ~ ~ 1 1
execute at @s run playsound block.water.ambient master @s ~ ~ ~ 0.8 0.5