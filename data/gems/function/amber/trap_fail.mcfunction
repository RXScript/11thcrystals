# ==========================================
# FAILURE - TRAP DISSOLVES
# ==========================================

# Get trap location
execute store result storage amber fail_x double 0.01 run scoreboard players get @s trap_x
execute store result storage amber fail_y double 0.01 run scoreboard players get @s trap_y
execute store result storage amber fail_z double 0.01 run scoreboard players get @s trap_z

# Dissolve particles
function gems:amber/dissolve_particles with storage amber

# HARSH SOUND
execute at @s run playsound block.honey_block.break master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# WEAK DAMAGE (only 10 HP)
execute as @e[tag=resin_trapped] run damage @s 10 player_attack by @p[tag=trap_master]

# PUNISHMENT DEBUFFS (8 seconds)
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true

# Messages
title @s title [{"text":"⬥ TRAP FAILED ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Not enough trapped","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ TRAP FAILURE ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Enemies Trapped: ","color":"gray"},{"score":{"name":"@s","objective":"trapped_count"},"color":"yellow"},{"text":"/3","color":"gray"}]
tellraw @s [{"text":"  Required: 3+ trapped","color":"red"}]
tellraw @s [{"text":"  Weak Damage: 10 HP only","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove trap_master
tag @s remove amber_immune
tag @e remove resin_trapped
scoreboard players reset @s trap_timer
scoreboard players reset @s trapped_count
scoreboard players reset @s trap_detonated
scoreboard players reset @s trap_x
scoreboard players reset @s trap_y
scoreboard players reset @s trap_z