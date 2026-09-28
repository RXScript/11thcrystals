execute unless entity @s[tag=has_quartz] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_quartz] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_quartz] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ OVERCLOCK NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (QUARTZ - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @s [{"text":"     ⬥ OVERCLOCK ⬥","color":"white","bold":true}]
tellraw @s [{"text":"     4s ","color":"yellow"},{"text":"• Speed II + Haste I","color":"white"}]
tellraw @s [{"text":"     Push beyond your limits.","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]

# Ability: Overclock (Speed + Haste)
effect give @s speed 4 1 true
effect give @s haste 4 0 true
particle electric_spark ~ ~0.1 ~ 10 0.1 10 0 80 force
execute at @s run playsound minecraft:block.copper_bulb.turn_on player @a[distance=..15] ~ ~ ~ 1 1.5

scoreboard players set @s cd_10s 200