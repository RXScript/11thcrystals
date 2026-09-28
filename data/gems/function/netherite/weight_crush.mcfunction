# ==========================================
# FAILURE - CRUSHED BY OWN WEIGHT
# ==========================================

# FAILURE VISUALS (collapsing under weight)
particle explosion ~ ~1 ~ 4 4 4 1 100 force
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 5 5 5 0.8 500 force
particle smoke ~ ~1 ~ 4 4 4 0.5 400 force
particle large_smoke ~ ~1 ~ 3 3 3 0.3 300 force

# CRUSHING DAMAGE (20 HP - the weight collapses on you)
execute at @s run damage @s 20 cramming

# Reset knockback resistance
attribute @s minecraft:knockback_resistance base set 0.0

# HARSH CRUSHING SOUND
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.iron_golem.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.player.hurt master @s ~ ~ ~ 2 0.5

# PUNISHMENT DEBUFFS (30 seconds) - Crushed
effect give @s slowness 30 3 true
effect give @s weakness 30 2 true
effect give @s mining_fatigue 30 3 true
effect give @s jump_boost 30 2 true
effect give @s unluck 30 0 true

# Messages
title @s title [{"text":"⬥ CRUSHED ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"The weight was too much","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ GRAVITATIONAL FAILURE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  Pulled: ","color":"gray"},{"score":{"name":"@s","objective":"gravity_pulled"},"color":"yellow"},{"text":"/6 enemies","color":"gray"}]
tellraw @s [{"text":"  Required: 6 enemies within 5 blocks","color":"red"}]
tellraw @s [{"text":"  Crushed: -20 HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  • Slowness IV","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness III","color":"dark_red"}]
tellraw @s [{"text":"  • Mining Fatigue IV","color":"dark_red"}]
tellraw @s [{"text":"  • Cannot jump","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove gravity_well
tag @s remove gravity4_immune
tag @e remove gravity_target
scoreboard players reset @e pulled_distance
scoreboard players reset @s gravity_pulled
scoreboard players reset @s gravity_target_count