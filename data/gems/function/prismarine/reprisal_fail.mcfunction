# ==========================================
# FAILURE - STANCE EXPIRED WITHOUT HIT!
# ==========================================

# STANCE DROP VISUALS
execute at @s run particle smoke ~ ~1 ~ 2 2 2 0.3 80 force
execute at @s run particle dust{color:[0.0,0.3,0.3],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 60 force
execute at @s run particle falling_water ~ ~1 ~ 1 1 1 0.3 40 force

# STANCE DROP SOUND
execute at @s run playsound entity.guardian.death master @a ~ ~ ~ 2 2
execute at @s run playsound block.conduit.deactivate master @a ~ ~ ~ 2 2
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"⛉ STANCE FAILED ⛉","color":"dark_gray","bold":true}]
title @s subtitle [{"text":"No counter triggered","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @s [{"text":"  ⛉ REPRISAL FAILED ⛉","color":"dark_gray","bold":true}]
tellraw @s [{"text":"  Stance expired!","color":"gray"}]
tellraw @s [{"text":"  You weren't hit!","color":"dark_gray"}]
tellraw @s [{"text":"  Debuff: 3 seconds","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# PUNISHMENT DEBUFF (3 seconds - missed parry)
effect give @s slowness 3 0 true
effect give @s weakness 3 0 true

# Cleanup
tag @s remove reprisal_stance
tag @s remove prismarine2_immune
scoreboard players reset @s reprisal_window
scoreboard players reset @s reprisal_triggered