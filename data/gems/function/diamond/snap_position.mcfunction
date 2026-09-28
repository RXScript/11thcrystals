# Snap player back to fortress position
execute store result storage fortress temp_x double 0.01 run scoreboard players get @s fortress_x
execute store result storage fortress temp_y double 0.01 run scoreboard players get @s fortress_y
execute store result storage fortress temp_z double 0.01 run scoreboard players get @s fortress_z

# Teleport back
function gems:diamond/teleport_macro with storage fortress

# Particles on snap
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 0.5 1 0.5 0.5 30 force
execute at @s run playsound block.anvil.land master @s ~ ~ ~ 0.5 1.5