# ==========================================
# GRASP ACTIVE - COUNTDOWN TO SLAM
# ==========================================

# Gravitational particles around player
particle dust{color:[0.2,0.2,0.2],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 15 force
particle block{block_state:"minecraft:netherite_block"} ~ ~1 ~ 1 1 1 0.5 10 force
particle smoke ~ ~1 ~ 1 1 1 0.2 8 force

# Particles on victim
execute as @e[tag=grasp_victim,limit=1] at @s run particle dust{color:[0.3,0.3,0.3],scale:3} ~ ~1 ~ 0.8 0.8 0.8 0.5 20 force
execute as @e[tag=grasp_victim,limit=1] at @s run particle smoke ~ ~1 ~ 0.6 0.6 0.6 0.1 10 force

# Display countdown
title @s actionbar [{"text":"⬥ SLAM IN: ","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"grasp_timer"},"color":"red"}]