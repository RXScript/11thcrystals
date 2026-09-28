# ==========================================
# ENTITY REACHED ANCHOR POINT
# ==========================================

# Mark as fully pulled (only count once per entity)
execute if score @s pulled_distance matches 0 run function gems:netherite/count_pull

# Set marker
scoreboard players set @s pulled_distance 1

# Keep stuck at anchor
effect give @s slowness 2 4 true
effect give @s weakness 2 2 true

# Crushed particles
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 0.8 0.5 0 15 force
particle falling_obsidian_tear ~ ~1 ~ 0.3 0.6 0.3 0 10 force

# Crushing sound
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 1 0.5