# ==========================================
# SUCCESS - AMBER EXPLOSION!
# ==========================================

# Get trap location
execute store result storage amber explode_x double 0.01 run scoreboard players get @s trap_x
execute store result storage amber explode_y double 0.01 run scoreboard players get @s trap_y
execute store result storage amber explode_z double 0.01 run scoreboard players get @s trap_z

# MASSIVE EXPLOSION at trap location
function gems:amber/explosion_particles with storage amber

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.honey_block.break master @a ~ ~ ~ 3 0.5

# Messages
title @s title [{"text":"⬥ TRAP DETONATED ⬥","color":"gold","bold":true}]
title @s subtitle [{"text":"Perfect capture!","color":"yellow"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"   ⬥ TRAP SUCCESS ⬥","color":"gold","bold":true}]
tellraw @s [{"text":"  Enemies Trapped: ","color":"gray"},{"score":{"name":"@s","objective":"trapped_count"},"color":"gold"}]
tellraw @s [{"text":"  Amber Damage: 32 HP","color":"red"}]
tellraw @s [{"text":"  • Strength II (10s)","color":"green"}]
tellraw @s [{"text":"  • Resistance II (10s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# DAMAGE (32 HP)
execute as @e[tag=resin_trapped] run damage @s 32 player_attack by @p[tag=trap_master]

# MASSIVE KNOCKBACK UPWARD (caught in amber burst)
execute as @e[tag=resin_trapped] run effect give @s levitation 2 2 true
execute as @e[tag=resin_trapped] run effect give @s slow_falling 4 0 true

# Keep stuck effects
execute as @e[tag=resin_trapped] run effect give @s slowness 8 3 true

# Explosion visuals on trapped
execute as @e[tag=resin_trapped] at @s run particle explosion ~ ~1 ~ 2 2 2 0 30 force
execute as @e[tag=resin_trapped] at @s run particle falling_honey ~ ~1 ~ 2 2 2 1 200 force
execute as @e[tag=resin_trapped] at @s run particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 1.5 1.5 1.5 0.5 150 force

# BUFFS (10 seconds)
effect give @s strength 10 1 true
effect give @s resistance 10 1 true
effect give @s regeneration 10 0 true
effect give @s absorption 10 4 true

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