# ==========================================
# TIME RESUMES - AMBER SHATTERS
# ==========================================

# MASSIVE SHATTER EXPLOSION
particle explosion_emitter ~ ~1 ~ 8 8 8 0 80 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
particle end_rod ~ ~1 ~ 0 0 0 2 800 force
particle firework ~ ~1 ~ 8 8 8 0.8 600 force
particle glow ~ ~1 ~ 8 8 8 0.5 500 force
particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 8 8 8 1.5 800 force

# Shatter damage to all frozen entities
execute as @e[tag=time_frozen] run damage @s 25 player_attack by @p[tag=amber_master]

# Massive knockback (time resumes violently)
execute as @e[tag=time_frozen] at @s facing entity @p[tag=amber_master] feet run tp @s ^ ^ ^-8
execute as @e[tag=time_frozen] run effect give @s levitation 2 2 true

# Shatter visuals on each frozen entity
execute as @e[tag=time_frozen] at @s run particle explosion ~ ~1 ~ 1 1 1 0 10 force
execute as @e[tag=time_frozen] at @s run particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 1 1 1 0.5 100 force

# Epic sounds
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 1.5 1.2
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 2 0.7

# Messages
title @s title [{"text":"⏵ TIME RESUMES ⏵","color":"gray","bold":true}]
title @s subtitle [{"text":"Eternity preserved: ","color":"dark_gray"},{"score":{"name":"@s","objective":"amber_kills"},"color":"yellow"},{"text":" entities","color":"dark_gray"}]
tellraw @s [{"text":"The amber shatters. ","color":"gray"},{"text":"some","color":"yellow"},{"text":" were preserved in your eternal moment.","color":"gray"}]

# Notify previously frozen players
execute as @e[tag=time_frozen,type=player] run title @s title {"text":"⏵ RELEASED ⏵","color":"green","bold":true}
execute as @e[tag=time_frozen,type=player] run title @s subtitle {"text":"Time flows again","color":"gray"}

# Reset attributes
execute at @s as @e[tag=time_frozen] run attribute @s minecraft:attack_speed base reset
execute at @s as @e[tag=time_frozen] run attribute @s minecraft:movement_speed base reset
execute at @s as @e[tag=time_frozen] run attribute @s minecraft:jump_strength base reset
execute at @s as @e[tag=time_frozen] run attribute @s minecraft:gravity base reset

# Remove all tags
tag @s remove fossilized_eternity
tag @s remove amber_master
tag @s remove time_immune
tag @e remove time_frozen

# Reset scores
scoreboard players set @s amber_kills 0
# 1. Delete the block displays
kill @e[type=block_display,tag=amber_fossil]

# 3. Strip the tags so these mobs can be targeted by the ability again later
tag @e remove has_display