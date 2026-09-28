# ==========================================
# QUEUE THIS DAMAGE INSTEAD OF DEALING IT
# ==========================================

# Heal the entity (cancel the damage)
effect give @s instant_health 1 0 true

# Add to queue count
execute as @p[tag=queue_active,distance=..18] run scoreboard players add @s tasks_queued 1

# QUEUE VISUALS
particle crit ~ ~1 ~ 0.8 0.8 0.8 0.3 30 force
particle dust{color:[1.0,1.0,1.0],scale:2} ~ ~1 ~ 0.5 0.5 0.5 0 20 force
particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.1 15 force

# QUEUE SOUND
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.note_block.hat master @a ~ ~ ~ 1 2

# Visual feedback to player
execute as @p[tag=queue_active,distance=..18] run title @s actionbar [{"text":"✓ QUEUED: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"tasks_queued"},"color":"yellow"},{"text":"/8","color":"gray"}]