execute unless entity @s[tag=has_emerald] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_emerald] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_emerald] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ NATURE'S PRICE NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (EMERALD - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━ ","color":"green","bold":true}]
tellraw @s [{"text":"     ⬥ NATURE'S PRICE ⬥","color":"#00FF00","bold":true}]
tellraw @s [{"text":"     1s ","color":"yellow"},{"text":"• Steal health","color":"green"}]
tellraw @s [{"text":"     Life has a price.","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# Ability: Pacify (Weakens nearby mobs instantly)
tag @s add immune_to_emerald10sforfewseconds
execute at @s as @e[distance=..7, tag=!immune_to_emerald10sforfewseconds] run damage @s 4 minecraft:magic by @p[tag=!immune_to_emerald10sforfewseconds]
particle happy_villager ~ ~1 ~ 3 1 3 0.1 50
execute at @s run playsound entity.villager.trade player @a[distance=..15] ~ ~ ~ 1 1
effect give @s instant_health 1 0 true
tag @s remove immune_to_emerald10sforfewseconds

scoreboard players set @s cd_10s 200