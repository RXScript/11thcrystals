execute unless entity @s[tag=has_redstone] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_redstone] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_redstone] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ PULSE BOOST NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (REDSTONE - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"     ⬥ PULSE BOOST ⬥","color":"red","bold":true}]
tellraw @s [{"text":"     2-3s ","color":"yellow"},{"text":"• Speed II + Jump II","color":"red"}]
tellraw @s [{"text":"     Your pulse accelerates.","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Ability: pulseboost (Speed + jb)
effect give @s speed 3 1 true
effect give @s jump_boost 2 1 true
particle dust{color:[1.0,0.0,0.0],scale:1} ~ ~1 ~ 6 6 6 2 20 force
playsound block.redstone_torch.burn player @a[distance=..15] ~ ~ ~ 1 2

scoreboard players set @s cd_10s 200