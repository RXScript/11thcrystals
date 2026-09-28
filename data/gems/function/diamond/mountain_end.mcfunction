# ==========================================
# FINAL RELEASE - Unleash all absorbed damage
# ==========================================

# MASSIVE FINAL EXPLOSION
execute at @s run particle explosion_emitter ~ ~1 ~ 5 5 5 0 50 force
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 10 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 2 600 force
execute at @s run particle enchant ~ ~1 ~ 6 6 6 3 800 force
execute at @s run particle firework ~ ~1 ~ 5 5 5 0.5 300 force
execute at @s run particle sweep_attack ~ ~1 ~ 8 0.1 8 0.5 100 force

# Calculate damage based on absorbed damage
# Damage all players based on absorbed damage (not self)
execute if score @s absorbed_damage matches 1..49 at @s as @e[distance=0.1..20,tag=mountain_enemy] run damage @s 15 player_attack by @p[tag=mountain_user]
execute if score @s absorbed_damage matches 50..99 at @s as @e[distance=0.1..20,tag=mountain_enemy] run damage @s 25 player_attack by @p[tag=mountain_user]
execute if score @s absorbed_damage matches 100..149 at @s as @e[distance=0.1..20,tag=mountain_enemy] run damage @s 35 player_attack by @p[tag=mountain_user]
execute if score @s absorbed_damage matches 150.. at @s as @e[distance=0.1..20,tag=mountain_enemy] run damage @s 50 player_attack by @p[tag=mountain_user]

# Knockback blast
execute at @s as @e[distance=0.1..20,tag=mountain_enemy] at @s run tp @s ^ ^ ^-6
execute at @s as @e[distance=0.1..20,tag=mountain_enemy] run effect give @s levitation 2 2 true

# Epic sounds
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 2 0.8
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 1.5 1

# Messages
title @s title [{"text":"⬥ MOUNTAIN RECEDES ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Absorbed Damage Released: ","color":"dark_gray"},{"score":{"name":"@s","objective":"absorbed_damage"},"color":"yellow"}]
tellraw @s [{"text":"The earth trembles as you release ","color":"gray"},{"score":{"name":"@s","objective":"absorbed_damage"},"color":"yellow"},{"text":" absorbed force.","color":"gray"}]

# Remove all tags
tag @s remove immovable_mountain
tag @s remove mountain_user
tag @e remove mountain_enemy

# Reset scores
scoreboard players set @s absorbed_damage 0

attribute @s minecraft:jump_strength base reset