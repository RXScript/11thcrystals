execute unless entity @s[tag=has_amethyst] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amethyst] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amethyst] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ RESONANT PING NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (AMETHYST - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @s [{"text":"     ⬥ RESONANT PING ⬥","color":"light_purple","bold":true}]
tellraw @s [{"text":"     3s ","color":"yellow"},{"text":"• Reveal + Blind (2s)","color":"light_purple"}]
tellraw @s [{"text":"     Your pulse distorts reality.","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]

# Ability: Sonic Shimmer (Glows and damages nearby mobs)
tag @s add immune_to_ame10sforfewseconds
effect give @e[distance=..10,tag=!immune_to_ame10sforfewseconds] glowing 3 0 true
effect give @e[distance=..10,tag=!immune_to_ame10sforfewseconds] blindness 2 0 true
particle minecraft:witch ~ ~1 ~ 4 1 4 0.01 100
execute at @s run playsound minecraft:block.amethyst_block.hit master @s ~ ~ ~ 1 1.28
execute at @s run playsound block.amethyst_cluster.step player @a[distance=..15] ~ ~ ~ 1 1
tag @s remove immune_to_ame10sforfewseconds

scoreboard players set @s cd_10s 200