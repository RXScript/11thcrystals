# ==========================================
# FAILURE - OVERWHELMED BY SCREAMS
# ==========================================

# FAILURE VISUALS (screaming)
particle explosion ~ ~1 ~ 4 4 4 1 100 force
particle squid_ink ~ ~1 ~ 5 5 5 0.8 500 force
particle sculk_soul ~ ~1 ~ 4 4 4 0.5 400 force
particle smoke ~ ~1 ~ 3 3 3 0.3 300 force

# BACKLASH DAMAGE (15 HP)
execute at @s run damage @s 15 sonic_boom
scoreboard players add @s silence_backlash 15

# HARSH SCREAMING SOUND
execute at @s run playsound entity.warden.sonic_charge master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.sculk_shrieker.shriek master @a ~ ~ ~ 3 1
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound particle.soul_escape master @s ~ ~ ~ 3 0.5

# PUNISHMENT DEBUFFS (30 seconds) - Deafened
effect give @s slowness 30 2 true
effect give @s weakness 30 2 true
effect give @s mining_fatigue 30 2 true
effect give @s darkness 30 0 true
effect give @s blindness 15 0 true
effect give @s unluck 30 0 true

# Messages
title @s title [{"text":"⬥ OVERWHELMED ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"The screams consume you","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ HUNT FAILURE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  Fragments: ","color":"gray"},{"score":{"name":"@s","objective":"scream_fragments"},"color":"yellow"},{"text":"/8","color":"gray"}]
tellraw @s [{"text":"  Required: 8 scream fragments","color":"red"}]
tellraw @s [{"text":"  Backlash: -15 HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  • Slowness III","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness III","color":"dark_red"}]
tellraw @s [{"text":"  • Darkness + Blindness","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove silent_hunter
tag @s remove echo_immune
tag @e remove scream_marked
scoreboard players reset @e fragment_dropped
scoreboard players reset @s scream_fragments
scoreboard players reset @s silence_backlash
scoreboard players reset @s scream_target_count