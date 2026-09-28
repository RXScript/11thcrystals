# ==========================================
# VOLTAGE FULLY CHARGED - READY TO STRIKE!
# ==========================================

# Mark as charged
scoreboard players set @s voltage_phase 1
scoreboard players set @s voltage_window 40

# CHARGED VISUALS
execute at @s run particle explosion ~ ~1 ~ 2 2 2 0 30 force
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 10 force
execute at @s run particle dust{color:[1.0,1.0,0.0],scale:4} ~ ~1 ~ 0 0 0 2 600 force
execute at @s run particle electric_spark ~ ~1 ~ 0 0 0 3 400 force
execute at @s run particle flame ~ ~1 ~ 0 0 0 2 300 force

# CHARGED SOUND
execute at @s run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 2 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 2 2
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 2 2

# Messages
title @s title [{"text":"⚡ CHARGED! ⚡","color":"gold","bold":true}]
title @s subtitle [{"text":"Strike now!","color":"yellow"}]

# MARK POTENTIAL TARGETS
execute at @s as @e[distance=0.1..18,type=!#minecraft:arrows,type=!item,tag=!redstone2_immune] run tag @s add voltage_target

# APPLY STRENGTH BUFF
effect give @s strength 2 2 true