# ==========================================
# NATURE'S WRATH - FINAL HARVEST EXPLOSION
# ==========================================

# MASSIVE NATURE EXPLOSION
particle explosion_emitter ~ ~1 ~ 10 10 10 0 100 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 20 force
particle happy_villager ~ ~1 ~ 0 0 0 3 1500 force
particle composter ~ ~1 ~ 10 10 10 2 1000 force
particle glow ~ ~1 ~ 10 10 10 1 800 force
particle end_rod ~ ~1 ~ 0 0 0 2 600 force
particle heart ~ ~1 ~ 8 8 8 1 300 force

# Final damage based on life stolen (10% of total life drained as AoE damage)
scoreboard players operation @s final_harvest = @s life_stolen
scoreboard players operation @s final_harvest /= #10 const

# Minimum 30 damage, maximum 60 damage
execute if score @s final_harvest matches ..29 run scoreboard players set @s final_harvest 30
execute if score @s final_harvest matches 61.. run scoreboard players set @s final_harvest 60

# Apply final damage to all marked entities
execute if score @s final_harvest matches 30 as @e[tag=life_source] run damage @s 30 player_attack by @p[tag=harvest_master]
execute if score @s final_harvest matches 35 as @e[tag=life_source] run damage @s 35 player_attack by @p[tag=harvest_master]
execute if score @s final_harvest matches 40 as @e[tag=life_source] run damage @s 40 player_attack by @p[tag=harvest_master]
execute if score @s final_harvest matches 45 as @e[tag=life_source] run damage @s 45 player_attack by @p[tag=harvest_master]
execute if score @s final_harvest matches 50 as @e[tag=life_source] run damage @s 50 player_attack by @p[tag=harvest_master]
execute if score @s final_harvest matches 55 as @e[tag=life_source] run damage @s 55 player_attack by @p[tag=harvest_master]
execute if score @s final_harvest matches 60 as @e[tag=life_source] run damage @s 60 player_attack by @p[tag=harvest_master]

# Massive knockback (nature's rejection)
execute as @e[tag=life_source] at @s facing entity @p[tag=harvest_master] feet run tp @s ^ ^ ^-10
execute as @e[tag=life_source] run effect give @s levitation 2 2 true

execute as @e[tag=life_source,tag=is_entangled] at @s run function gems:emerald/entangled_display_end

# Explosion visuals on each target
execute as @e[tag=life_source] at @s run particle explosion ~ ~1 ~ 2 2 2 0 15 force
execute as @e[tag=life_source] at @s run particle happy_villager ~ ~1 ~ 1 1 1 0.5 100 force
execute as @e[tag=life_source] at @s run particle composter ~ ~1 ~ 1 1 1 0.3 80 force

# Epic sounds
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 2 0.8
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.evoker.prepare_summon master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.villager.death master @a ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"⬥ HARVEST COMPLETE ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Life Stolen: ","color":"dark_gray"},{"score":{"name":"@s","objective":"life_stolen"},"color":"yellow"},{"text":" HP","color":"dark_gray"}]
tellraw @s [{"text":"The harvest ends. You drained ","color":"gray"},{"score":{"name":"@s","objective":"life_stolen"},"color":"yellow"},{"text":" life force.","color":"gray"}]

# Notify previously marked players
execute as @e[tag=life_source,type=player] run title @s title {"text":"☠ HARVEST COMPLETE ☠","color":"red","bold":true}
execute as @e[tag=life_source,type=player] run title @s subtitle {"text":"Nature's wrath unleashed","color":"dark_red"}

# Remove all tags
tag @s remove emerald_harvest
tag @s remove harvest_master
tag @s remove harvest_immune
tag @e remove life_source

# Reset scores
scoreboard players set @s life_stolen 0
scoreboard players set @s harvest_kills 0
scoreboard players set @s final_harvest 0