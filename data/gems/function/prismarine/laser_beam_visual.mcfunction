# ==========================================
# LASER BEAM VISUAL TO TARGET
# ==========================================

# Draw beam particles from player to target
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:1.5} ^ ^1.6 ^1 0.1 0.1 0.1 0 3 force
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:1.5} ^ ^1.6 ^2 0.1 0.1 0.1 0 3 force
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:1.5} ^ ^1.6 ^3 0.1 0.1 0.1 0 3 force
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:1.5} ^ ^1.6 ^4 0.1 0.1 0.1 0 3 force
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:1.5} ^ ^1.6 ^5 0.1 0.1 0.1 0 3 force

# Electric sparks along beam
execute if score @s focus_charge matches 40.. facing entity @e[tag=laser_target,limit=1] eyes run particle electric_spark ^ ^1.6 ^2 0.1 0.1 0.1 0 2 force
execute if score @s focus_charge matches 40.. facing entity @e[tag=laser_target,limit=1] eyes run particle electric_spark ^ ^1.6 ^4 0.1 0.1 0.1 0 2 force

# Target gets hit indicator
execute as @e[tag=laser_target] at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.4 0.8 0.4 0 5 force
execute if score @s focus_charge matches 60.. as @e[tag=laser_target] at @s run particle electric_spark ~ ~1 ~ 0.5 0.8 0.5 0 8 force