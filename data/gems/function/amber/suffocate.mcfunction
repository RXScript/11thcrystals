# Suffocation damage - trapped in amber
execute as @e[distance=0.1..25,tag=time_frozen] run damage @s 8 player_attack by @p[tag=amber_master]

# Visual feedback
execute as @e[distance=0.1..25,tag=time_frozen] at @s run particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 0.5 0.8 0.5 0.3 30 force
execute as @e[distance=0.1..25,tag=time_frozen] at @s run particle dust{color:[1.0,0.7,0.0],scale:4} ~ ~1.5 ~ 0.4 0.6 0.4 0 15 force

# Sound
execute at @s run playsound entity.player.hurt master @a ~ ~ ~ 1 0.5
execute at @s run playsound block.honey_block.break master @a ~ ~ ~ 1 0.8