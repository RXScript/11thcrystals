# RAPID STRIKE - Lightning-fast precision hits
particle electric_spark ~ ~1 ~ 10 2 10 1 80 force
particle firework ~ ~1 ~ 8 2 8 0.5 60 force
particle end_rod ~ ~1 ~ 6 1 6 0.3 40 force

# Base damage: 5 per 0.5 seconds = 10 DPS
execute as @e[distance=0.1..30,tag=time_slowed] run damage @s 5 player_attack by @p[tag=overclock_master]

# Increase hit counter
execute as @e[distance=0.1..30,tag=time_slowed] run scoreboard players add @s overclock_hits 1

# Track damage
scoreboard players add @s rapid_damage_dealt 5

# Visual feedback
execute as @e[distance=0.1..30,tag=time_slowed] at @s run particle electric_spark ~ ~1 ~ 0.3 0.6 0.3 0.5 15 force
execute as @e[distance=0.1..30,tag=time_slowed] at @s run particle firework ~ ~1 ~ 0.2 0.5 0.2 0.2 10 force

# Sound (rapid mechanical hits)
execute at @s run playsound entity.player.attack.strong master @a ~ ~ ~ 0.5 2
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 0.3 2

# Display
execute if score @s overclock_timer matches 1195 run title @s actionbar [{"text":"⚡ RAPID STRIKE ","color":"white","bold":true},{"text":"[","color":"gray"},{"score":{"name":"@s","objective":"rapid_damage_dealt"},"color":"yellow"},{"text":" DMG]","color":"gray"}]