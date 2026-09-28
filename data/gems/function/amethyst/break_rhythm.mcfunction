# ==========================================
# RHYTHM BROKEN - INSTANT FAILURE
# ==========================================

# Mark as broken
scoreboard players set @s rhythm_broken 1

# HARSH visual feedback
particle smoke ~ ~1 ~ 2 2 2 0.3 200 force
particle cloud ~ ~1 ~ 2 2 2 0.2 150 force

# DISCORDANT sound
execute at @s run playsound block.amethyst_block.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 2 0.5

# Warning message
title @s title [{"text":"⚠ RHYTHM BROKEN ⚠","color":"red","bold":true}]
title @s subtitle [{"text":"Too fast! You hit too quickly","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"  ⚠ RHYTHM BROKEN ⚠","color":"red","bold":true}]
tellraw @s [{"text":"  You must wait 1 second between hits!","color":"gray"}]
tellraw @s [{"text":"  Failure is now guaranteed.","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]