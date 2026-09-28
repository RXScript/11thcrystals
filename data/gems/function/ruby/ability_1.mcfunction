execute unless entity @s[tag=has_ruby] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_ruby] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_ruby] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ EMBER FLICKER NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (RUBY - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"     ⬥ EMBER FLICKER ⬥","color":"red","bold":true}]
tellraw @s [{"text":"     3s ","color":"yellow"},{"text":"• Speed I + Fire Aura","color":"red"}]
tellraw @s [{"text":"     You burn to move faster.","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Ability: Crimson Dash (Short TP forward + Wither damage to enemies)
# 1. Add your tag
tag @s add immune_to_ruby10sforfewseconds

# 2. The Damage Command (Attributed to you)
# We use @a instead of @p for better reliability in functions
execute at @s as @e[distance=..7,tag=!immune_to_ruby10sforfewseconds] run damage @s 3 minecraft:on_fire by @a[tag=immune_to_ruby10sforfewseconds,limit=1,sort=nearest]
effect give @s speed 3 0 true
particle minecraft:flame ~ ~1 ~ 3 1 3 0.1 150
particle minecraft:lava ~ ~1 ~ 2 1 2 0.1 20
execute at @s run playsound minecraft:entity.ghast.warn player @a[distance=..15] ~ ~ ~ 1 0.8
tag @s remove immune_to_ruby10sforfewseconds

scoreboard players set @s cd_10s 200