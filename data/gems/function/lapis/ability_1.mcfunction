execute unless entity @s[tag=has_lapis] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_lapis] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_lapis] run return fail

# If cooldown is active, tell the player and stop
execute if score @s cd_10s matches 1.. run title @s actionbar [{"text":"⬥ ARCANE SURGE NOT READY! ","color":"red"},{"score":{"name":"@s","objective":"cd_10s"},"color":"yellow"},{"text":" ticks left","color":"gray"}]
execute if score @s cd_10s matches 1.. run return fail

# If it runs, they used it
# 10s ABILITY FEEDBACK (LAPIS - COMPACT)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"blue","bold":true}]
tellraw @s [{"text":"     ⬥ ARCANE SURGE ⬥","color":"blue","bold":true}]
tellraw @s [{"text":"     5s ","color":"yellow"},{"text":"• Luck I + XP Burst","color":"blue"}]
tellraw @s [{"text":"     Knowledge flows like a tide.","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"blue","bold":true}]

# Ability: Mana Surge (XP + Luck)
experience add @s 3 levels
effect give @s luck 5 1 true
particle enchanted_hit ~ ~1 ~ 0.5 1 0.5 0.5 50
particle enchant ~ ~1 ~ 10 10 10 1 2000 force
execute at @s run playsound entity.player.levelup player @a[distance=..15] ~ ~ ~ 1 2

scoreboard players set @s cd_10s 200