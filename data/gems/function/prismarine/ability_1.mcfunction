execute unless entity @s[tag=has_prismarine] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_prismarine] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_prismarine] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ TIDAL GUARD NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (PRISMARINE - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"     ⬥ TIDAL GUARD ⬥","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"     2s ","color":"yellow"},{"text":"• Resistance I • Thorns Aura","color":"dark_aqua"}]
tellraw @s [{"text":"     The sea strikes back.","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]

# Ability: Splash Damage (Magic damage to close enemies)
tag @s add immune_to_prisma10sforfewseconds
execute at @p as @e[distance=..4, tag=!immune_to_prisma10sforfewseconds] run damage @s 4 minecraft:thorns by @p[tag=immune_to_prisma10sforfewseconds]
effect give @s resistance 2 0 true
particle splash ~ ~1 ~ 2 1 2 0.1 100
execute at @s run playsound entity.generic.splash player @a[distance=..15] ~ ~ ~ 1 1
tag @s remove immune_to_prisma10sforfewseconds

scoreboard players set @s cd_10s 200