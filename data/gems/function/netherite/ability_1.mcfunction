execute unless entity @s[tag=has_netherite] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_netherite] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_netherite] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ GRAVITY DROP NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (NETHERITE - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @s [{"text":"     ⬥ GRAVITY DROP ⬥","color":"dark_gray","bold":true}]
tellraw @s [{"text":"     1s ","color":"yellow"},{"text":"• Pull Down (5m radius)","color":"gray"}]
tellraw @s [{"text":"     The weight drags them under.","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# Ability: Sculk Step (Invisibility + Speed)
tag @s add immune_to_netherite10sforfewseconds
execute at @s run tp @e[distance=..5,tag=!immune_to_netherite10sforfewseconds] ^ ^-3 ^
particle minecraft:dust_plume ~ ~ ~ 3 0.1 3 0.01 100
particle minecraft:large_smoke ~ ~ ~ 2 1 2 0.05 40
execute at @s run playsound minecraft:block.anvil.destroy player @a[distance=..15] ~ ~ ~ 1 1
execute at @s run playsound minecraft:block.anvil.land player @a[distance=..15] ~ ~ ~ 1 0.1
execute at @s run playsound minecraft:entity.iron_golem.damage player @a[distance=..15] ~ ~ ~ 1 0.5
tag @s add immune_to_netherite10sforfewseconds

scoreboard players set @s cd_10s 200
