# ==========================================
# PROTOCOL RUNNING
# ==========================================

# MASSIVE precision aura
particle firework ~ ~1 ~ 6 7 6 1.5 150 force
particle end_rod ~ ~1 ~ 5 6 5 1 100 force
particle electric_spark ~ ~1 ~ 5 6 5 1 120 force
particle glow ~ ~1 ~ 4 5 4 0.5 80 force

# Speed lines (motion efficiency)
particle firework ~ ~1 ~ 10 0.5 10 0.5 40 force
particle end_rod ~ ~1 ~ 8 0.5 8 0.3 30 force

# Vertical precision beam every 2 seconds
execute if score @s protocol_timer matches 100 run particle firework ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s protocol_timer matches 100 run particle electric_spark ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s protocol_timer matches 100 run playsound block.beacon.power_select master @a ~ ~ ~ 2 2

execute if score @s protocol_timer matches 60 run particle firework ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s protocol_timer matches 60 run playsound block.beacon.power_select master @a ~ ~ ~ 2 2

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..20,tag=!protocol_immune] unless entity @s[tag=efficiency_target] run tag @s add efficiency_target
execute at @s as @e[distance=0.1..20,tag=!protocol_immune] unless entity @s[tag=efficiency_target] run scoreboard players set @s target_hit_status 0
execute at @s as @e[distance=0.1..20,tag=!protocol_immune] unless entity @s[tag=efficiency_target] at @s run particle firework ~ ~1 ~ 0.5 1 0.5 0.5 60 force

# Target lock particles on unmarked targets
execute at @s as @e[distance=0.1..20,tag=efficiency_target,scores={target_hit_status=0}] at @s run particle firework ~ ~1 ~ 0.3 0.6 0.3 0.2 10 force
execute at @s as @e[distance=0.1..20,tag=efficiency_target,scores={target_hit_status=0}] at @s run particle electric_spark ~ ~1.5 ~ 0.2 0.4 0.2 0.1 8 force
execute at @s as @e[distance=0.1..20,tag=efficiency_target,scores={target_hit_status=0}] at @s run particle end_rod ~ ~2 ~ 0.2 0.2 0.2 0.05 6 force

# Green particles for completed targets
execute at @s as @e[distance=0.1..20,tag=efficiency_target,scores={target_hit_status=1}] at @s run particle glow ~ ~1 ~ 0.3 0.6 0.3 0.2 15 force
execute at @s as @e[distance=0.1..20,tag=efficiency_target,scores={target_hit_status=1}] at @s run particle end_rod ~ ~1.5 ~ 0.2 0.4 0.2 0.1 10 force

# Display progress
execute if score @s protocol_failed matches 0 if score @s protocol_timer matches 80.. run title @s actionbar [{"text":"⬥ PROTOCOL: ","color":"white","bold":true},{"score":{"name":"@s","objective":"protocol_timer"},"color":"yellow"},{"text":" | Hit: ","color":"gray"},{"score":{"name":"@s","objective":"targets_hit_elite"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"efficiency_target_total"},"color":"yellow"}]
execute if score @s protocol_failed matches 0 if score @s protocol_timer matches 40..79 run title @s actionbar [{"text":"⚠ PROTOCOL: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"protocol_timer"},"color":"yellow"},{"text":" | Hit: ","color":"gray"},{"score":{"name":"@s","objective":"targets_hit_elite"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"efficiency_target_total"},"color":"yellow"}]
execute if score @s protocol_failed matches 0 if score @s protocol_timer matches ..39 run title @s actionbar [{"text":"⚠ TIME CRITICAL: ","color":"red","bold":true},{"score":{"name":"@s","objective":"protocol_timer"},"color":"red"},{"text":" | Hit: ","color":"gray"},{"score":{"name":"@s","objective":"targets_hit_elite"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"efficiency_target_total"},"color":"yellow"}]
execute if score @s protocol_failed matches 1 run title @s actionbar [{"text":"⚠ FAILED: ","color":"red","bold":true},{"text":"Protocol terminated!","color":"dark_red"}]

# Ambient sound (machine hum)
execute if score @s protocol_timer matches 90 run playsound block.beacon.ambient master @s ~ ~ ~ 1 2
execute if score @s protocol_timer matches 60 run playsound block.beacon.ambient master @s ~ ~ ~ 1.5 2
execute if score @s protocol_timer matches 30 run playsound block.beacon.ambient master @s ~ ~ ~ 2 2
execute if score @s protocol_timer matches 10 run playsound block.conduit.ambient master @s ~ ~ ~ 2 2

scoreboard players set @s efficiency_target_total 8

execute if score @s protocol_failed matches 0 if score @s targets_hit_elite >= @s efficiency_target_total run effect give @s instant_health 1 1 true