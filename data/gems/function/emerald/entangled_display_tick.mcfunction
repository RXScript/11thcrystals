# Constantly snap the visual block displays to the exact location of the entangled entity
execute as @e[tag=life_source,tag=is_entangled] at @s run tp @e[type=block_display,tag=entangle_visual,distance=..2,sort=nearest,limit=2] ~ ~ ~

tag @e[tag=entangle_visual] add harvest_immune
tag @e[tag=entangle_visual] remove life_source