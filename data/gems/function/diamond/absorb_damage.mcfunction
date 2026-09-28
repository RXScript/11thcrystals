# DAMAGE ABSORPTION - The more you're hit, the stronger you become
scoreboard players add @s absorbed_damage 5

# Visual feedback
particle enchant{color:[0.5,1.0,1.0],scale:2} ~ ~1 ~ 0.5 1 0.5 1 20 force
particle end_rod{color:[0.5,1.0,1.0],scale:4} ~ ~1 ~ 0.3 0.8 0.3 0.1 10 force
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 0.4 0.8 0.4 0.2 15 force

# Add absorption hearts
effect give @s absorption 10 1 true

# Sound
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 0.5 2
execute at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 0.8 0.5

# Message
title @s actionbar [{"text":"💎 ABSORBED: +5 ","color":"aqua","bold":true},{"text":"[Total: ","color":"gray"},{"score":{"name":"@s","objective":"absorbed_damage"},"color":"yellow"},{"text":"]","color":"gray"}]