# ==========================================
# FAILURE - WEAK QUAKE
# ==========================================

# WEAK RUMBLE
particle explosion ~ ~1 ~ 2 2 2 0 30 force
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 2 2 2 0.5 100 force
particle smoke ~ ~1 ~ 2 2 2 0.3 80 force

# HARSH SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# WEAK DAMAGE (13 HP)
execute at @s as @e[distance=0.1..8,tag=mass_affected] run damage @s 13 falling_stalactite by @p[tag=anchor_point]

# PUNISHMENT DEBUFFS
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true
effect give @s mining_fatigue 8 1 true

# Messages
title @s title [{"text":"⬥ INSUFFICIENT MASS ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Not enough pulled","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ COLLAPSE FAILED ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Pulled: ","color":"gray"},{"score":{"name":"@s","objective":"pulled_count"},"color":"yellow"},{"text":"/4","color":"gray"}]
tellraw @s [{"text":"  Required: 4+ enemies","color":"red"}]
tellraw @s [{"text":"  Weak Damage: 13 HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"  • Mining Fatigue II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

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