# ==========================================
# SUPERNOVA - FINAL INFERNO
# ==========================================

# CATASTROPHIC FIRE EXPLOSION
particle explosion_emitter ~ ~1 ~ 15 15 15 0 250 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 50 force
particle flame ~ ~1 ~ 0 0 0 5 5000 force
particle soul_fire_flame ~ ~1 ~ 0 0 0 4 4000 force
particle lava ~ ~1 ~ 15 15 15 3 800 force
particle firework ~ ~1 ~ 15 15 15 2 2000 force
particle smoke ~ ~1 ~ 15 15 15 1 1500 force

# Final damage (40 base + stacks)
execute as @e[tag=burning_target,scores={burn_stacks=0..4}] run damage @s 40 on_fire by @p[tag=phoenix_master]
execute as @e[tag=burning_target,scores={burn_stacks=5..9}] run damage @s 60 on_fire by @p[tag=phoenix_master]
execute as @e[tag=burning_target,scores={burn_stacks=10..}] run damage @s 80 on_fire by @p[tag=phoenix_master]

# Massive knockback inferno
execute as @e[tag=burning_target] at @s facing entity @p[tag=phoenix_master] feet run tp @s ^ ^ ^-10
execute as @e[tag=burning_target] run effect give @s levitation 2 2 true

# Explosion on each target
execute as @e[tag=burning_target] at @s run particle explosion_emitter ~ ~1 ~ 5 5 5 0 40 force
execute as @e[tag=burning_target] at @s run particle flame ~ ~1 ~ 3 3 3 1 400 force
execute as @e[tag=burning_target] at @s run particle lava ~ ~1 ~ 2 2 2 0.5 100 force

# INFERNO SOUND FINALE
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.blaze.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound item.firecharge.use master @a ~ ~ ~ 3 0.8

# Messages
title @s title [{"text":"⬥ SUPERNOVA ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Total Burn Damage: ","color":"dark_gray"},{"score":{"name":"@s","objective":"burn_damage_dealt"},"color":"yellow"},{"text":" HP","color":"dark_gray"}]
tellraw @s [{"text":"The phoenix burns out. You dealt ","color":"gray"},{"score":{"name":"@s","objective":"burn_damage_dealt"},"color":"yellow"},{"text":" burn damage.","color":"gray"}]

# Notify targets
execute as @e[tag=burning_target,type=player] run title @s title {"text":"☠ SUPERNOVA ☠","color":"red","bold":true}
execute as @e[tag=burning_target,type=player] run title @s subtitle {"text":"Consumed by flames","color":"dark_red"}

# Remove all tags
tag @s remove phoenix_protocol
tag @s remove phoenix_master
tag @s remove phoenix_immune
tag @s remove has_rebirth
tag @e remove burning_target
scoreboard players reset @e burn_stacks

# Reset scores
scoreboard players set @s burn_damage_dealt 0
scoreboard players set @s phoenix_kills 0
scoreboard players set @s rebirth_ready 0