# ==========================================
# PROTOCOL BROKEN - DUPLICATE HIT
# ==========================================

# Mark as failed
scoreboard players set @s protocol_failed 1

# HARSH visual feedback
particle smoke ~ ~1 ~ 2 2 2 0.3 200 force
particle cloud ~ ~1 ~ 2 2 2 0.2 150 force
particle large_smoke ~ ~1 ~ 1.5 1.5 1.5 0.1 100 force

# DISCORDANT sound - system error
playsound block.glass.break master @a ~ ~ ~ 3 0.5
playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
playsound entity.villager.no master @a ~ ~ ~ 2 0.5

# Warning message
title @s title [{"text":"⚠ PROTOCOL FAILED ⚠","color":"red","bold":true}]
title @s subtitle [{"text":"Duplicate target hit!","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"  ⚠ PROTOCOL TERMINATED ⚠","color":"red","bold":true}]
tellraw @s [{"text":"  You hit the same target twice!","color":"gray"}]
tellraw @s [{"text":"  Each target must be hit EXACTLY once.","color":"gray"}]
tellraw @s [{"text":"  System failure is guaranteed.","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]