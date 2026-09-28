# Detect and trap enemies in area
# $execute as @e[tag=!amber_immune,dx=5,dy=2,dz=5] positioned $(check_x) $(check_y) $(check_z) if entity @s[distance=..2.5] unless entity @s[tag=resin_trapped] run function gems:amber/trap_enemy
$execute positioned $(check_x) $(check_y) $(check_z) as @e[distance=..2.5,tag=!amber_immune,tag=!resin_trapped] run function gems:amber/trap_enemy