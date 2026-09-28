# ==========================================
# PARTIAL - TREMOR
# ==========================================

# MEDIUM QUAKE
particle explosion ~ ~1 ~ 5 5 5 0 80 force
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 3 3 3 1 500 force
particle falling_obsidian_tear ~ ~1 ~ 3 3 3 0.5 300 force

# SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 2 1.5
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 2 0.8

# MEDIUM DAMAGE (26 HP)
execute at @s as @e[distance=0.1..8,tag=mass_affected] run damage @s 26 falling_stalactite by @p[tag=anchor_point]

# MINOR BUFFS
effect give @s resistance 8 1 true
effect give @s absorption 8 2 true

# Messages
title @s title [{"text":"⬥ TREMOR ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Decent pull","color":"dark_gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gray","bold":true}]
tellraw @s [{"text":"   ⬥ PARTIAL COLLAPSE ⬥","color":"gray","bold":true}]
tellraw @s [{"text":"  Pulled: ","color":"gray"},{"score":{"name":"@s","objective":"pulled_count"},"color":"yellow"},{"text":"/4","color":"gray"}]
tellraw @s [{"text":"  Damage: 26 HP","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gray","bold":true}]

# Cleanup
tag @s remove anchor_point
tag @s remove netherite_immune
tag @e remove mass_affected
scoreboard players reset @e pulled_distance
scoreboard players reset @s anchor_timer
scoreboard players reset @s pulled_count
scoreboard players reset @s anchor_x
scoreboard players reset @s anchor_y
scoreboard players reset @s anchor_z