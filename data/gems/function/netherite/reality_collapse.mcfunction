# ==========================================
# SUCCESS - REALITY COLLAPSES
# ==========================================

# CATASTROPHIC GRAVITATIONAL IMPLOSION
particle explosion_emitter ~ ~1 ~ 20 20 20 0 400 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 60 force
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0 0 0 12 15000 force
particle smoke ~ ~1 ~ 0 0 0 10 12000 force
particle lava ~ ~1 ~ 20 20 20 2 5000 force
particle large_smoke ~ ~1 ~ 18 18 18 1.5 3000 force
particle end_rod ~ ~1 ~ 18 18 18 1 2000 force

# MASSIVE DAMAGE (based on how many pulled)
# 6-7 pulled = 45 damage
# 8-9 pulled = 55 damage
# 10+ pulled = 65 damage
execute if score @s gravity_pulled matches 6..7 as @e[tag=gravity_target] run damage @s 45 cramming by @p[tag=gravity_well]
execute if score @s gravity_pulled matches 8..9 as @e[tag=gravity_target] run damage @s 55 cramming by @p[tag=gravity_well]
execute if score @s gravity_pulled matches 10.. as @e[tag=gravity_target] run damage @s 65 cramming by @p[tag=gravity_well]

# SUCCESS BUFFS (30 seconds) - Unbreakable Will
effect give @s strength 30 2 true
effect give @s resistance 30 2 true
effect give @s absorption 30 9 true
effect give @s regeneration 30 2 true

# Reset knockback resistance
attribute @s minecraft:knockback_resistance base set 0.0

# MASSIVE DOWNWARD FORCE - Slam enemies into ground
execute as @e[tag=gravity_target] run effect give @s levitation 2 2 true
execute as @e[tag=gravity_target] run effect give @s slow_falling 3 0 true

# Crush enemies
execute as @e[tag=gravity_target] run effect give @s slowness 10 3 true
execute as @e[tag=gravity_target] run effect give @s weakness 10 2 true

# Explosion visuals on targets - crushed
execute as @e[tag=gravity_target] at @s run particle explosion_emitter ~ ~1 ~ 10 10 10 0 80 force
execute as @e[tag=gravity_target] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 8 8 8 2 1000 force
execute as @e[tag=gravity_target] at @s run particle smoke ~ ~1 ~ 6 6 6 1 800 force
execute as @e[tag=gravity_target] at @s run particle lava ~ ~1 ~ 5 5 5 1 600 force

# VICTORY SOUND - Reality breaking
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.warden.death master @a ~ ~ ~ 5 0.5
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.ender_dragon.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5

# Messages
title @s title [{"text":"⬥ COLLAPSE ⬥","color":"black","bold":true}]
title @s subtitle [{"text":"The mountain strikes","color":"dark_gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"black","bold":true}]
tellraw @s [{"text":"   ⬥ GRAVITATIONAL SUCCESS ⬥","color":"black","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Enemies Pulled: ","color":"gray"},{"score":{"name":"@s","objective":"gravity_pulled"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Collapse Damage: 45-65 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Unbreakable Will (30s)","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  • Strength III + Resistance III","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"black","bold":true}]

# Notify targets
execute as @e[tag=gravity_target,type=player] run title @s title {"text":"☠ CRUSHED ☠","color":"red","bold":true}
execute as @e[tag=gravity_target,type=player] run title @s subtitle {"text":"Gravity claims you","color":"dark_red"}

# Cleanup
tag @s remove gravity_well
tag @s remove gravity4_immune
tag @e remove gravity_target
scoreboard players reset @e pulled_distance
scoreboard players reset @s gravity_pulled
scoreboard players reset @s gravity_target_count