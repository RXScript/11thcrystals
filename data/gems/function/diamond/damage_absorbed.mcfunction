# ==========================================
# DAMAGE ABSORBED - CONVERT TO SHIELD
# ==========================================

# Add to absorbed counter (estimate 2 HP per hit during resistance)
scoreboard players add @s shell_absorbed 3

# Every 4 absorbed damage = 1 absorption heart (golden hearts)
execute if score @s shell_absorbed matches 4.. run effect give @s absorption 10 1 true
execute if score @s shell_absorbed matches 4.. run scoreboard players remove @s shell_absorbed 4

# ABSORPTION VISUALS
particle dust{color:[1.0,1.0,0.0],scale:2} ~ ~1 ~ 0.8 0.8 0.8 0.3 30 force
particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 15 force

# ABSORPTION SOUND
execute at @s run playsound entity.player.levelup master @s ~ ~ ~ 0.8 2
execute at @s run playsound block.enchantment_table.use master @s ~ ~ ~ 1 2

# Feedback
title @s actionbar [{"text":"✓ ABSORBED! ","color":"gold","bold":true},{"text":"Total: ","color":"gray"},{"score":{"name":"@s","objective":"shell_absorbed"},"color":"yellow"}]