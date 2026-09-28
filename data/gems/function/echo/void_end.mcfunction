# ==========================================
# SILENT DEATH - THE VOID COLLAPSES
# ==========================================

# CATASTROPHIC VOID IMPLOSION
particle explosion_emitter ~ ~1 ~ 20 20 20 0 400 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 80 force
particle sonic_boom ~ ~1 ~ 0 0 0 0 150 force
particle sculk_soul ~ ~1 ~ 0 0 0 8 10000 force
particle soul_fire_flame ~ ~1 ~ 0 0 0 6 8000 force
particle reverse_portal ~ ~1 ~ 0 0 0 5 6000 force
particle smoke ~ ~1 ~ 20 20 20 2 3000 force

# Final damage based on void decay stacks (40-70)
execute as @e[tag=sculk_infected,scores={void_damage=..150}] run damage @s 40 out_of_world by @p[tag=void_master]
execute as @e[tag=sculk_infected,scores={void_damage=151..250}] run damage @s 55 out_of_world by @p[tag=void_master]
execute as @e[tag=sculk_infected,scores={void_damage=251..}] run damage @s 70 out_of_world by @p[tag=void_master]

# Void implosion (pull then explode)
execute as @e[tag=sculk_infected] at @s facing entity @p[tag=void_master] feet run tp @s ^ ^ ^5
execute positioned ~ ~1 ~ run tp @e[tag=sculk_infected,distance=..8] ~ ~3 ~
execute as @e[tag=sculk_infected] run effect give @s levitation 2 2 true

# Implosion visuals on each target
execute as @e[tag=sculk_infected] at @s run particle explosion_emitter ~ ~1 ~ 10 10 10 0 80 force
execute as @e[tag=sculk_infected] at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 15 force
execute as @e[tag=sculk_infected] at @s run particle sculk_soul ~ ~1 ~ 5 5 5 2 500 force
execute as @e[tag=sculk_infected] at @s run particle soul_fire_flame ~ ~1 ~ 4 4 4 1 400 force

# VOID COLLAPSE SOUND
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 1.0
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 1.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 3 1
execute at @s run playsound entity.warden.death master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ SILENT DEATH ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Total Damage: ","color":"dark_gray"},{"score":{"name":"@s","objective":"total_void_damage"},"color":"yellow"},{"text":" HP","color":"dark_gray"}]
tellraw @s [{"text":"The void collapses. You dealt ","color":"gray"},{"score":{"name":"@s","objective":"total_void_damage"},"color":"yellow"},{"text":" void damage.","color":"gray"}]

# Notify targets
execute as @e[tag=sculk_infected,type=player] run title @s title {"text":"☠ CONSUMED ☠","color":"red","bold":true}
execute as @e[tag=sculk_infected,type=player] run title @s subtitle {"text":"The void claims all","color":"dark_red"}

# Remove all tags
tag @s remove void_walker
tag @s remove void_master
tag @s remove void_immune
tag @e remove sculk_infected
scoreboard players reset @e void_damage

# Reset scores
scoreboard players set @s total_void_damage 0
scoreboard players set @s void_kills 0