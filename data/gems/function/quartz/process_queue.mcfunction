# ==========================================
# PROCESS QUEUE - RELEASE ALL DAMAGE
# ==========================================

# Check queue count
execute if score @s tasks_queued matches 8.. run function gems:quartz/queue_reset
execute if score @s tasks_queued matches 8.. run function gems:quartz/batch_execute
execute if score @s tasks_queued matches 5..7 run function gems:quartz/partial_batch
execute if score @s tasks_queued matches ..4 run function gems:quartz/queue_underrun