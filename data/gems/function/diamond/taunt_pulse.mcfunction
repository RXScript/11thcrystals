# TAUNT - Pull enemy players toward the mountain
particle angry_villager ~ ~2 ~ 5 2 5 0 30 force
particle sweep_attack ~ ~1 ~ 5 0.1 5 0.3 20 force

# Pull other players closer (not self)
execute at @s as @a[distance=0.1..20,tag=mountain_enemy] facing entity @p[tag=mountain_user] feet run tp @s ^ ^ ^0.5

# Apply glowing and slow to enemies
execute at @s as @a[distance=0.1..20,tag=mountain_enemy] run effect give @s glowing 4 0 true
execute at @s as @a[distance=0.1..20,tag=mountain_enemy] run effect give @s slowness 4 1 true

# Sound
execute at @s run playsound entity.ravager.roar master @a ~ ~ ~ 1.5 0.5
execute at @s run playsound block.beacon.ambient master @a ~ ~ ~ 0.5 2