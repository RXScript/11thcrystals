# ==========================================
# IGNITE A SPARK - Player got close!
# ==========================================

# Mark as ignited
scoreboard players set @s spark_ignited 1

# Add to player's count
execute as @p[tag=ruby_igniter,distance=..3] run scoreboard players add @s sparks_ignited 1

# IGNITION VISUALS
particle explosion ~ ~1 ~ 1 1 1 0 10 force
particle flame ~ ~1 ~ 1 1 1 0.3 80 force
particle lava ~ ~1 ~ 0.8 0.8 0.8 0 30 force
particle dust{color:[1.0,0.3,0.0],scale:3} ~ ~1 ~ 0.8 0.8 0.8 0.5 50 force

# IGNITION SOUND
execute at @s run playsound entity.blaze.shoot master @a ~ ~ ~ 2 1.5
execute at @s run playsound block.fire.ambient master @a ~ ~ ~ 2 2
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 1 2

# Set on fire
data merge entity @s {Fire:100s}

# Feedback to player
execute as @p[tag=ruby_igniter,distance=..3] run title @s actionbar [{"text":"🔥 IGNITED: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"sparks_ignited"},"color":"yellow"},{"text":"/6","color":"gray"}]