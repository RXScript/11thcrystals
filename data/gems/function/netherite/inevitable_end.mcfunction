execute at @s run function gems:netherite/gravity_display_end
# ==========================================
# GRAVITATIONAL COLLAPSE - THE MOUNTAIN FALLS
# ==========================================

# CATASTROPHIC GRAVITY IMPLOSION
particle explosion_emitter ~ ~1 ~ 25 25 25 0 500 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 100 force
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0 0 0 10 15000 force
particle smoke ~ ~1 ~ 25 25 25 3 5000 force
particle cloud ~ ~1 ~ 20 20 20 2 4000 force
particle explosion ~ ~1 ~ 25 25 25 2 1000 force

# Final damage based on gravity dealt (60-80)
execute if score @s total_gravity_damage matches ..240 as @e[tag=gravity_target] run damage @s 60 falling_anvil by @p[tag=netherite_master]
execute if score @s total_gravity_damage matches 241..360 as @e[tag=gravity_target] run damage @s 70 falling_anvil by @p[tag=netherite_master]
execute if score @s total_gravity_damage matches 361.. as @e[tag=gravity_target] run damage @s 80 falling_anvil by @p[tag=netherite_master]

# Massive implosion pull then slam down
execute as @e[tag=gravity_target] at @s facing entity @p[tag=netherite_master] feet run tp @s ^ ^ ^8
execute positioned ~ ~1 ~ run tp @e[tag=gravity_target,distance=..12] ~ ~ ~
execute as @e[tag=gravity_target] run effect give @s levitation 2 2 true

# Implosion visuals on each target
execute as @e[tag=gravity_target] at @s run particle explosion_emitter ~ ~1 ~ 12 12 12 0 100 force
execute as @e[tag=gravity_target] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 8 8 8 2 800 force
execute as @e[tag=gravity_target] at @s run particle cloud ~ ~1 ~ 6 6 6 1 600 force

# CATASTROPHIC SOUND
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 3 1
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"⬥ COLLAPSE ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Total Damage: ","color":"dark_gray"},{"score":{"name":"@s","objective":"total_gravity_damage"},"color":"yellow"},{"text":" HP","color":"dark_gray"}]
tellraw @s [{"text":"The mountain falls. You dealt ","color":"gray"},{"score":{"name":"@s","objective":"total_gravity_damage"},"color":"yellow"},{"text":" gravity damage.","color":"gray"}]

# Notify targets
execute as @e[tag=gravity_target,type=player] run title @s title {"text":"☠ CRUSHED ☠","color":"red","bold":true}
execute as @e[tag=gravity_target,type=player] run title @s subtitle {"text":"The weight was inevitable","color":"dark_red"}

# Remove all tags
tag @s remove the_inevitable
tag @s remove netherite_master
tag @s remove gravity_immune
tag @e remove gravity_target
scoreboard players reset @e gravity_damage

# Reset scores
scoreboard players set @s total_gravity_damage 0
scoreboard players set @s inevitable_kills 0