# ==========================================
# PROCESS HIT ON EFFICIENCY TARGET
# ==========================================

# If this target was already hit, FAIL PROTOCOL
execute if score @s target_hit_status matches 1 as @a[tag=protocol_active,limit=1,sort=nearest] run function gems:quartz/break_protocol
execute if score @s target_hit_status matches 1 run return fail

# FIRST HIT ON THIS TARGET - Valid!
scoreboard players set @s target_hit_status 1
execute as @a[tag=protocol_active,limit=1,sort=nearest] run scoreboard players add @s targets_hit_elite 1

# MASSIVE visual feedback - precision hit
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 3 force
particle firework ~ ~1 ~ 1 1 1 1 100 force
particle end_rod ~ ~1 ~ 0.8 0.8 0.8 0.8 80 force
particle electric_spark ~ ~1 ~ 0.6 0.6 0.6 0.6 60 force
particle glow ~ ~1 ~ 0.5 0.5 0.5 0.3 40 force

# Sound - precision confirmation
execute at @s run playsound block.note_block.chime master @a ~ ~ ~ 2 2
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 1 2

# Feedback to player
execute as @a[tag=protocol_active,limit=1,sort=nearest] run title @s actionbar [{"text":"✓ PRECISE: ","color":"green","bold":true},{"score":{"name":"@s","objective":"targets_hit_elite"},"color":"yellow"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"efficiency_target_total"},"color":"yellow"}]