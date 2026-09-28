# ==========================================
# TASK QUEUE ACTIVE - STORING DAMAGE
# ==========================================

# Queueing particles (white energy accumulating)
particle dust{color:[1.0,1.0,1.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 15 force
particle crit ~ ~1 ~ 1 1 1 0.2 10 force
particle end_rod ~ ~1 ~ 1 1 1 0.1 8 force

# Task queue visualization (stacking boxes)
execute if score @s tasks_queued matches 1.. run particle dust{color:[1.0,1.0,1.0],scale:3} ~ ~0.5 ~ 0.3 0.3 0.3 0 5 force
execute if score @s tasks_queued matches 3.. run particle dust{color:[1.0,1.0,1.0],scale:3} ~ ~1 ~ 0.3 0.3 0.3 0 5 force
execute if score @s tasks_queued matches 5.. run particle dust{color:[1.0,1.0,1.0],scale:3} ~ ~1.5 ~ 0.3 0.3 0.3 0 5 force
execute if score @s tasks_queued matches 8.. run particle dust{color:[1.0,1.0,0.0],scale:3} ~ ~2 ~ 0.3 0.3 0.3 0 5 force

# Show targets
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s run particle crit ~ ~1.5 ~ 0.2 0.4 0.2 0 3 force
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s run particle dust{color:[1.0,1.0,1.0],scale:1.5} ~ ~1 ~ 0.3 0.6 0.3 0 5 force

# Display queue status
execute if score @s tasks_queued matches ..7 run title @s actionbar [{"text":"⬥ QUEUED: ","color":"white","bold":true},{"score":{"name":"@s","objective":"tasks_queued"},"color":"yellow"},{"text":"/8 | ","color":"gray"},{"score":{"name":"@s","objective":"queue_timer"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s tasks_queued matches 8.. run title @s actionbar [{"text":"✓ QUEUE READY: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"tasks_queued"},"color":"yellow"},{"text":" tasks!","color":"gray"}]

# Queueing sound (builds up)
execute if score @s tasks_queued matches 2 run playsound block.note_block.pling master @s ~ ~ ~ 1 1.2
execute if score @s tasks_queued matches 4 run playsound block.note_block.pling master @s ~ ~ ~ 1.2 1.4
execute if score @s tasks_queued matches 6 run playsound block.note_block.pling master @s ~ ~ ~ 1.5 1.6
execute if score @s tasks_queued matches 8 run playsound block.note_block.pling master @s ~ ~ ~ 2 2
execute if score @s tasks_queued matches 8 run playsound block.note_block.chime master @s ~ ~ ~ 2 2

# When entity takes damage, instead of dealing it, queue it
execute as @e[tag=queue_target,nbt={HurtTime:10s}] at @s if entity @p[tag=queue_active,distance=..18] run function gems:quartz/queue_damage