# EFFECT THEFT - Steal beneficial effects from enemies
# Check each marked entity for beneficial effects and transfer them

# Speed theft
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:speed"}]}] run effect give @p[tag=harvest_master] speed 10 1 true
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:speed"}]}] run effect clear @s speed

# Strength theft
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:strength"}]}] run effect give @p[tag=harvest_master] strength 10 2 true
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:strength"}]}] run effect clear @s strength

# Regeneration theft
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:regeneration"}]}] run effect give @p[tag=harvest_master] regeneration 10 3 true
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:regeneration"}]}] run effect clear @s regeneration

# Absorption theft
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:absorption"}]}] run effect give @p[tag=harvest_master] absorption 10 2 true
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:absorption"}]}] run effect clear @s absorption

# Resistance theft
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:resistance"}]}] run effect give @p[tag=harvest_master] resistance 10 1 true
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:resistance"}]}] run effect clear @s resistance

# Fire resistance theft
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:fire_resistance"}]}] run effect give @p[tag=harvest_master] fire_resistance 10 0 true
execute as @e[distance=0.1..30,tag=life_source,nbt={active_effects:[{id:"minecraft:fire_resistance"}]}] run effect clear @s fire_resistance

# Visual feedback
particle happy_villager ~ ~2 ~ 2 2 2 0.5 50 force
particle glow ~ ~2 ~ 1.5 1.5 1.5 0.3 30 force
particle enchant ~ ~2 ~ 2 2 2 1 40 force

# Sound
execute at @s run playsound entity.evoker.cast_spell master @a ~ ~ ~ 1.5 1.5
execute at @s run playsound entity.villager.yes master @s ~ ~ ~ 1 2

# Message
title @s actionbar [{"text":"💚 EFFECTS STOLEN","color":"green","bold":true}]