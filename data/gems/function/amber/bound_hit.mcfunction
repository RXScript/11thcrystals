# ==========================================
# BOUND TARGET WAS HIT - BONUS DAMAGE
# ==========================================

# BONUS DAMAGE (50% increase = +7 HP estimated from typical 14 HP hit)
damage @s 7 player_attack by @p[tag=resin_binding,distance=..20]

# HIT FEEDBACK VISUALS
particle explosion ~ ~1 ~ 1 1 1 0 15 force
particle block{block_state:"minecraft:honey_block"} ~ ~1 ~ 1 1 1 1 80 force
particle item{item:"minecraft:honey_bottle"} ~ ~1 ~ 0.8 0.8 0.8 0.5 60 force
particle dust{color:[1.0,0.5,0.0],scale:3} ~ ~1 ~ 0.8 0.8 0.8 0.5 40 force

# Resin cracks
particle dust{color:[0.5,0.3,0.0],scale:2} ~ ~1 ~ 0.8 0.8 0.8 0.3 30 force
particle crit ~ ~1 ~ 0.8 0.8 0.8 0.3 25 force

# HIT SOUND
execute at @s run playsound block.honey_block.break master @a ~ ~ ~ 2 0.8
execute at @s run playsound entity.slime.hurt master @a ~ ~ ~ 2 1

# Feedback to player
execute as @p[tag=resin_binding,distance=..20] run title @s actionbar [{"text":"✓ BONUS! ","color":"gold","bold":true},{"text":"+50% damage","color":"red"}]