# Passive life drain - harvest life force from marked entities
execute as @e[distance=0.1..30,tag=life_source] run damage @s 6 player_attack by @p[tag=harvest_master]

# Track total life stolen
scoreboard players add @s life_stolen 6

# Heal the harvester for each entity drained
execute as @e[distance=0.1..30,tag=life_source] run effect give @p[tag=harvest_master] instant_health 1 0 true

# Visual feedback - life energy flowing to harvester
execute as @e[distance=0.1..30,tag=life_source] at @s facing entity @p[tag=harvest_master] feet run particle happy_villager ^ ^1 ^1 0 0 0 0.5 10 force
execute as @e[distance=0.1..30,tag=life_source] at @s facing entity @p[tag=harvest_master] feet run particle damage_indicator ^ ^1 ^0.5 0 0 0 0.3 5 force

# Sound
execute at @s run playsound entity.player.hurt master @a ~ ~ ~ 0.8 0.5
execute at @s run playsound block.grass.break master @a ~ ~ ~ 0.5 1.5
execute at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 0.8 2

# Display total stolen
title @s actionbar [{"text":"💚 LIFE HARVESTED: ","color":"green","bold":true},{"score":{"name":"@s","objective":"life_stolen"},"color":"yellow"},{"text":" HP","color":"gray"}]