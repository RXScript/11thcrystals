# ==========================================
# CASCADE BROKEN - INSTANT FAILURE
# ==========================================

# Mark as failed
scoreboard players set @s cascade_failed 1

# HARSH visual feedback
particle smoke ~ ~1 ~ 2 2 2 0.3 200 force
particle cloud ~ ~1 ~ 2 2 2 0.2 150 force
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 100 force

# DISCORDANT sound
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.evoker.cast_spell master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 2 0.5

# Warning message
title @s title [{"text":"⚠ CASCADE BROKEN ⚠","color":"red","bold":true}]
title @s subtitle [{"text":"You hit the same target twice!","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"  ⚠ CASCADE BROKEN ⚠","color":"red","bold":true}]
tellraw @s [{"text":"  You must hit DIFFERENT targets!","color":"gray"}]
tellraw @s [{"text":"  Each target can only be hit once.","color":"gray"}]
tellraw @s [{"text":"  Failure is now guaranteed.","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]