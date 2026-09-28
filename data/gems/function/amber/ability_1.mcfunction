execute unless entity @s[tag=has_amber] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amber] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amber] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ MOMENT LOCK NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_30s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (AMBER - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"     ⬥ MOMENT LOCK ⬥","color":"gold","bold":true}]
tellraw @s [{"text":"     4s ","color":"yellow"},{"text":"• Slowness IV","color":"gold"}]
tellraw @s [{"text":"     Time thickens around them.","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# Ability: Sap Trap (Slows nearby enemies heavily)
tag @s add immune_to_amber10sforfewseconds
effect give @e[distance=..5,tag=!immune_to_amber10sforfewseconds] slowness 4 3 true
particle falling_honey ~ ~2 ~ 2 1 2 0.1 100
execute at @s run playsound block.honey_block.slide player @a[distance=..15] ~ ~ ~ 1 1
tag @s remove immune_to_amber10sforfewseconds

scoreboard players set @s cd_10s 200