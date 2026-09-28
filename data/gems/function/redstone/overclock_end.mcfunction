# ==========================================
# CIRCUIT MELTDOWN - CATASTROPHIC OVERLOAD
# ==========================================

# MASSIVE CIRCUIT EXPLOSION
particle explosion_emitter ~ ~1 ~ 25 25 25 0 600 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 120 force
particle dust{color:[1.0,0.0,0.0],scale:4} ~ ~1 ~ 10 10 10 10 20000 force
particle electric_spark ~ ~1 ~ 0 0 0 8 10000 force
particle end_rod ~ ~1 ~ 0 0 0 5 5000 force
particle firework ~ ~1 ~ 25 25 25 3 3000 force

# Final damage based on circuit hits (40-60)
execute if score @s total_circuit_damage matches ..360 as @e[tag=circuit_target] run damage @s 40 lightning_bolt by @p[tag=redstone_master]
execute if score @s total_circuit_damage matches 361..480 as @e[tag=circuit_target] run damage @s 50 lightning_bolt by @p[tag=redstone_master]
execute if score @s total_circuit_damage matches 481.. as @e[tag=circuit_target] run damage @s 60 lightning_bolt by @p[tag=redstone_master]

# Massive electric explosion
execute as @e[tag=circuit_target] at @s facing entity @p[tag=redstone_master] feet run tp @s ^ ^ ^-15
execute as @e[tag=circuit_target] run effect give @s levitation 2 2 true

# Explosion visuals on each target
execute as @e[tag=circuit_target] at @s run particle explosion_emitter ~ ~1 ~ 4 4 4 0 75 force
execute as @e[tag=circuit_target] at @s run particle dust{color:[1.0,0.0,0.0],scale:1} ~ ~1 ~ 2 2 2 2 100 force
execute as @e[tag=circuit_target] at @s run particle electric_spark ~ ~1 ~ 2 2 2 2 50 force

execute at @s run function gems:redstone/surge_rings_end

# CATASTROPHIC ELECTRIC SOUND
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 1.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 2
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 3 1
execute at @s run playsound entity.creeper.death master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ MELTDOWN ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Total Damage: ","color":"dark_gray"},{"score":{"name":"@s","objective":"total_circuit_damage"},"color":"yellow"},{"text":" HP","color":"dark_gray"}]
tellraw @s [{"text":"The circuit overloads. You dealt ","color":"gray"},{"score":{"name":"@s","objective":"total_circuit_damage"},"color":"yellow"},{"text":" electric damage.","color":"gray"}]

# Notify targets
execute as @e[tag=circuit_target,type=player] run title @s title {"text":"☠ FRIED ☠","color":"red","bold":true}
execute as @e[tag=circuit_target,type=player] run title @s subtitle {"text":"Circuit overload","color":"dark_red"}

# Remove all tags
tag @s remove redstone_overclock
tag @s remove redstone_master
tag @s remove redstone4_immune
tag @e remove circuit_target
scoreboard players reset @e circuit_hits

# Reset scores
scoreboard players set @s total_circuit_damage 0
scoreboard players set @s overclock_kills 0