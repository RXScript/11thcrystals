execute unless entity @s[tag=has_diamond] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_diamond] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_diamond] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ REFRACTIVE SHIELD NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (DIAMOND - BASIC)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━ ","color":"aqua","bold":true}]
tellraw @s [{"text":"     ⬥ REFRACTIVE SHIELD ⬥","color":"aqua","bold":true}]
tellraw @s [{"text":"     2s • Resistance I + Absorption I","color":"aqua"}]
tellraw @s [{"text":"     Incoming hits softened","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]

# Ability: Refractive Shield (Resistance + Particles)
effect give @s resistance 3 0 true
effect give @s absorption 3 0 true
particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 50
execute at @s run playsound item.shield.block player @a[distance=..15] ~ ~ ~ 1 1

# Set Cooldown (200 ticks = 10s)
scoreboard players set @s cd_10s 200