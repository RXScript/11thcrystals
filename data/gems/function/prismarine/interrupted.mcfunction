# ==========================================
# HIT WHILE FOCUSING - INTERRUPTED!
# ==========================================

# Mark as broken
scoreboard players set @s focus_broken 1

# ERROR VISUALS
particle explosion ~ ~1 ~ 1 1 1 0 20 force
particle smoke ~ ~1 ~ 1.5 1.5 1.5 0.3 100 force

# HARSH SOUND
execute at @s run playsound entity.guardian.death master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"⚠ INTERRUPTED ⚠","color":"red","bold":true}]
title @s subtitle [{"text":"Focus lost!","color":"dark_red"}]