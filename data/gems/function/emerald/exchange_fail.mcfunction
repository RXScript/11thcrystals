# ==========================================
# EXCHANGE FAILED - DIDN'T HIT IN TIME!
# ==========================================

# Only fail if NOT drained yet
execute if score @s exchange_drained matches 1.. run return fail

# FAILURE VISUALS
particle explosion ~ ~1 ~ 2 2 2 0 30 force
particle smoke ~ ~1 ~ 2 2 2 0.3 100 force
particle angry_villager ~ ~2 ~ 0.5 0.5 0.5 0 10 force

# HARSH SOUND
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.player.hurt master @s ~ ~ ~ 2 0.5

# YOU ALREADY LOST THE HP FROM SACRIFICE - No refund!

# PUNISHMENT DEBUFFS (8 seconds)
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true
effect give @s hunger 8 1 true

# Messages
title @s title [{"text":"⬥ EXCHANGE FAILED ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"No refunds","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ EXCHANGE FAILED ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  You didn't hit anyone in time!","color":"gray"}]
tellraw @s [{"text":"  Sacrificed HP: Lost permanently","color":"red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"  • Hunger II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove vital_exchange_active
tag @s remove exchange_immune
scoreboard players reset @s exchange_window
scoreboard players reset @s exchange_sacrificed
scoreboard players reset @s exchange_drained
scoreboard players reset @s exchange_health