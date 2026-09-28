# ==========================================
# FAILURE - ARCANE BACKLASH
# ==========================================

# FAILURE VISUALS (arcane collapse)
particle explosion ~ ~1 ~ 4 4 4 1 100 force
particle smoke ~ ~1 ~ 3 3 3 0.3 300 force
particle cloud ~ ~1 ~ 3 3 3 0.2 200 force
particle falling_dust{block_state:{Name:"minecraft:lapis_block"}} ~ ~1 ~ 2 2 2 0.3 150 force

# MASSIVE XP LOSS (10 levels)
experience add @s -10 levels

# HARSH DISCORDANT SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.evoker.death master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.player.hurt master @s ~ ~ ~ 2 0.5

# PUNISHMENT DEBUFFS (30 seconds)
effect give @s slowness 30 2 true
effect give @s weakness 30 1 true
effect give @s mining_fatigue 30 2 true
effect give @s unluck 30 1 true
effect give @s blindness 10 0 true

# Messages
execute if score @s cascade_failed matches 1 run title @s title [{"text":"⬥ ARCANE COLLAPSE ⬥","color":"dark_red","bold":true}]
execute if score @s cascade_failed matches 0 run title @s title [{"text":"⬥ INSUFFICIENT CASCADE ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"Knowledge rejects you","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ CASCADE FAILURE ⬥","color":"dark_red","bold":true}]
execute if score @s cascade_failed matches 1 run tellraw @s [{"text":"  Reason: ","color":"gray"},{"text":"Hit same target twice","color":"red"}]
execute if score @s cascade_failed matches 0 run tellraw @s [{"text":"  Targets Hit: ","color":"gray"},{"score":{"name":"@s","objective":"cascade_targets_hit"},"color":"yellow"},{"text":"/5","color":"gray"}]
execute if score @s cascade_failed matches 0 run tellraw @s [{"text":"  Required: 5 different targets","color":"red"}]
tellraw @s [{"text":"  XP Loss: -10 levels","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  • Slowness III","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"  • Mining Fatigue III","color":"dark_red"}]
tellraw @s [{"text":"  • Blindness (10s)","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove cascade_active
tag @s remove cascade_immune
tag @e remove cascade_marked
scoreboard players reset @e cascade_hit_by_player
scoreboard players reset @s cascade_targets_hit
scoreboard players reset @s cascade_failed
scoreboard players reset @s cascade_target_count