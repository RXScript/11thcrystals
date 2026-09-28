# ==========================================
# TSUNAMI - THE OCEAN'S FINAL WRATH
# ==========================================

# CATASTROPHIC TIDAL WAVE
particle explosion_emitter ~ ~1 ~ 18 18 18 0 350 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 70 force
particle splash ~ ~1 ~ 0 0 0 6 800 force
particle falling_water ~ ~1 ~ 0 0 0 5 600 force
particle bubble ~ ~1 ~ 18 18 18 3 300 force
particle glow ~ ~1 ~ 18 18 18 2 200 force
particle dust{color:[0.0,0.7,1.0],scale:2} ~ ~1 ~ 15 15 15 2 200 force

# Final damage based on pressure dealt (50-80)
execute if score @s abyssal_timer matches ..180 as @e[tag=drowning_target,scores={pressure_damage=..100}] run damage @s 50 player_attack by @p[tag=abyssal_master]
execute if score @s abyssal_timer matches ..180 as @e[tag=drowning_target,scores={pressure_damage=101..150}] run damage @s 65 player_attack by @p[tag=abyssal_master]
execute if score @s abyssal_timer matches ..180 as @e[tag=drowning_target,scores={pressure_damage=151..}] run damage @s 80 player_attack by @p[tag=abyssal_master]

# Alternative: if timer ran out normally, use standard damage
execute unless score @s abyssal_timer matches ..180 as @e[tag=drowning_target] run damage @s 60 player_attack by @p[tag=abyssal_master]

# Massive tidal knockback
execute as @e[tag=drowning_target] at @s facing entity @p[tag=abyssal_master] feet run tp @s ^ ^ ^-15
execute as @e[tag=drowning_target] run effect give @s levitation 2 2 true

function gems:prismarine/tsunami_display

# Tsunami visuals on each target
execute as @e[tag=drowning_target] at @s run particle explosion_emitter ~ ~1 ~ 8 8 8 0 60 force
execute as @e[tag=drowning_target] at @s run particle splash ~ ~1 ~ 5 5 5 2 500 force
execute as @e[tag=drowning_target] at @s run particle falling_water ~ ~1 ~ 4 4 4 1 400 force
execute as @e[tag=drowning_target] at @s run particle bubble ~ ~1 ~ 3 3 3 1 300 force

# OCEANIC CATASTROPHE SOUND
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.elder_guardian.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.water.ambient master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.player.splash.high_speed master @a ~ ~ ~ 3 0.8

# Messages
title @s title [{"text":"⬥ TSUNAMI ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Reflected: ","color":"dark_gray"},{"score":{"name":"@s","objective":"damage_reflected"},"color":"yellow"},{"text":" HP","color":"dark_gray"}]
tellraw @s [{"text":"The ocean recedes. You reflected ","color":"gray"},{"score":{"name":"@s","objective":"damage_reflected"},"color":"yellow"},{"text":" damage.","color":"gray"}]

# Notify targets
execute as @e[tag=drowning_target,type=player] run title @s title {"text":"☠ TSUNAMI ☠","color":"red","bold":true}
execute as @e[tag=drowning_target,type=player] run title @s subtitle {"text":"Claimed by the depths","color":"dark_red"}

# Remove all tags
tag @s remove abyssal_dominion
tag @s remove abyssal_master
tag @s remove abyssal_immune
tag @e remove drowning_target
scoreboard players reset @e pressure_damage

# Reset scores
scoreboard players set @s damage_reflected 0
scoreboard players set @s abyssal_kills 0