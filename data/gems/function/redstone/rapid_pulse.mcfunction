# RAPID PULSE - Lightning-fast strikes
particle electric_spark ~ ~1 ~ 10 2 10 1 80 force
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 8 2 8 0.8 60 force

# Base damage: 3 per 0.5s
execute as @e[distance=0.1..30,tag=circuit_target] run damage @s 3 player_attack by @p[tag=redstone_master]

# Increase hit counter
execute as @e[distance=0.1..30,tag=circuit_target] run scoreboard players add @s circuit_hits 1

# Track total
scoreboard players add @s total_circuit_damage 3

# Visual feedback
execute as @e[distance=0.1..30,tag=circuit_target] at @s run particle electric_spark ~ ~1 ~ 0.3 0.6 0.3 0.5 15 force

# Sound (rapid electric crackle)
execute at @s run playsound entity.player.attack.strong master @a ~ ~ ~ 0.3 2

# Display every 20th hit
execute if score @s overclock_timer matches 1195 run title @s actionbar [{"text":"⚡ RAPID PULSE ","color":"red","bold":true},{"text":"[","color":"gray"},{"score":{"name":"@s","objective":"total_circuit_damage"},"color":"yellow"},{"text":" DMG]","color":"gray"}]