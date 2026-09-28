# FORTRESS WAS HIT - Absorb the blow
scoreboard players add @s fortress_hits 1
scoreboard players add @s damage_absorbed 1

# Visual feedback
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 1 1 1 1 50 force
particle end_rod ~ ~1 ~ 0.8 0.8 0.8 0.5 40 force
particle explosion ~ ~1 ~ 0.5 0.5 0.5 0 5 force

# Sound
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 1 1.2
execute at @s run playsound block.stone.hit master @a ~ ~ ~ 1 0.8

# Message
title @s actionbar [{"text":"⬥ ABSORBED: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"fortress_hits"},"color":"yellow"},{"text":" HITS","color":"aqua"}]