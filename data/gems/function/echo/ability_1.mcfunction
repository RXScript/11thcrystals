execute unless entity @s[tag=has_echo] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_echo] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_echo] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ VOID STEP NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (ECHO SHARD - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @s [{"text":"     ⬥ VOID PHASE ⬥","color":"gray","bold":true}]
tellraw @s [{"text":"     6s ","color":"yellow"},{"text":"• Silent + Faded","color":"gray"}]
tellraw @s [{"text":"     You slip between seconds.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# Ability: Sculk Step (Invisibility + Speed)
tag @s add immune_to_echo10sforfewseconds
effect give @e[distance=..12,tag=!immune_to_echo10sforfewseconds] blindness 6 3 true
gamemode spectator @s
scoreboard players set @s voidphase_timer 10
effect give @s invisibility 6 255 true
effect give @s speed 6 0 true
particle sculk_soul ~ ~1 ~ 0.5 1 0.5 0.05 30
execute at @s run playsound block.sculk_shrieker.shriek player @a[distance=..15] ~ ~ ~ 1 1
tag @s remove immune_to_echo10sforfewseconds

scoreboard players set @s cd_10s 200
