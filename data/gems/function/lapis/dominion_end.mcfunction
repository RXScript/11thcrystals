# ==========================================
# COSMIC RIFT - ARCANE APOCALYPSE
# ==========================================

# CATASTROPHIC ARCANE EXPLOSION
particle explosion_emitter ~ ~1 ~ 15 15 15 0 200 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 40 force
particle enchant ~ ~1 ~ 0 0 0 5 3000 force
particle witch ~ ~1 ~ 15 15 15 3 2000 force
particle soul ~ ~1 ~ 12 12 12 2 1500 force
particle glow ~ ~1 ~ 15 15 15 2 1500 force
particle end_rod ~ ~1 ~ 0 0 0 4 1500 force
particle reverse_portal ~ ~1 ~ 12 12 12 3 2000 force
particle dragon_breath ~ ~1 ~ 10 10 10 2 1200 force

# Cosmic rift opening
particle portal ~ ~1 ~ 0 0 0 10 5000 force

# Final damage based on XP stolen (5 damage per level stolen, max 150)
execute if score @s xp_stolen matches 1..10 as @e[tag=arcane_victim] run damage @s 30 player_attack by @p[tag=arcane_master]
execute if score @s xp_stolen matches 11..20 as @e[tag=arcane_victim] run damage @s 60 player_attack by @p[tag=arcane_master]
execute if score @s xp_stolen matches 21..30 as @e[tag=arcane_victim] run damage @s 90 player_attack by @p[tag=arcane_master]
execute if score @s xp_stolen matches 31.. as @e[tag=arcane_victim] run damage @s 120 player_attack by @p[tag=arcane_master]

# Additional damage based on drain stacks
execute as @e[tag=arcane_victim,scores={arcane_drain=10..}] run damage @s 20 player_attack by @p[tag=arcane_master]
execute as @e[tag=arcane_victim,scores={arcane_drain=20..}] run damage @s 20 player_attack by @p[tag=arcane_master]
execute as @e[tag=arcane_victim,scores={arcane_drain=30..}] run damage @s 20 player_attack by @p[tag=arcane_master]

# Massive vortex pull then explosion
execute as @e[tag=arcane_victim] at @s facing entity @p[tag=arcane_master] feet run tp @s ^ ^ ^3
execute as @e[tag=arcane_victim] run effect give @s levitation 2 2 true
execute positioned ~ ~1 ~ run tp @e[tag=arcane_victim,distance=..5] ~ ~3 ~
execute as @e[tag=arcane_victim] run effect give @s levitation 2 2 true

# Explosion visuals on each target
execute as @e[tag=arcane_victim] at @s run particle explosion_emitter ~ ~1 ~ 4 4 4 0 30 force
execute as @e[tag=arcane_victim] at @s run particle enchant ~ ~1 ~ 3 3 3 3 300 force
execute as @e[tag=arcane_victim] at @s run particle witch ~ ~1 ~ 2 2 2 2 200 force
execute as @e[tag=arcane_victim] at @s run particle soul ~ ~1 ~ 2 2 2 1 150 force

# APOCALYPTIC SOUND FINALE
execute at @s run playsound entity.ender_dragon.death master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 3 1
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 2 1.5
execute at @s run playsound block.end_portal.spawn master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ DOMINION COMPLETE ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Knowledge Stolen: ","color":"dark_gray"},{"score":{"name":"@s","objective":"xp_stolen"},"color":"yellow"},{"text":" levels","color":"dark_gray"}]
tellraw @s [{"text":"The arcane dominion collapses. You stole ","color":"gray"},{"score":{"name":"@s","objective":"xp_stolen"},"color":"yellow"},{"text":" levels.","color":"gray"}]

# Notify previously marked players
execute as @e[tag=arcane_victim,type=player] run title @s title {"text":"☠ COSMIC RIFT ☠","color":"red","bold":true}
execute as @e[tag=arcane_victim,type=player] run title @s subtitle {"text":"Your knowledge was consumed","color":"dark_red"}

# Remove all tags
tag @s remove arcane_dominion
tag @s remove arcane_master
tag @s remove arcane_immune
tag @e remove arcane_victim
scoreboard players reset @e arcane_drain

# Reset scores
scoreboard players set @s xp_stolen 0
scoreboard players set @s dominion_kills 0