execute unless entity @s[tag=has_quartz] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_quartz] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_quartz] run return fail

# ==========================================
# QUARTZ ADVANCED: "TASK QUEUE"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Queue damage → Must get 8+ hits in 3s
# All damage stored, then released at once
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ QUEUE READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ QUEUEING ⬥","color":"white","bold":true}]
title @s subtitle {"text":"Damage batched for 6s","color":"gray","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @s [{"text":"   ⬥ TASK QUEUE ⬥","color":"white","bold":true}]
tellraw @s [{"text":"  QUEUE TIME: 6 seconds","color":"yellow"}]
tellraw @s [{"text":"  All damage is STORED!","color":"red","bold":true}]
tellraw @s [{"text":"  8+ hits = massive burst","color":"green"}]
tellraw @s [{"text":"  10+ hits = 33% chance refund cooldown","color":"gold"}]
tellraw @s [{"text":"  Damage releases at end","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle dust{color:[1.0,1.0,1.0],scale:3} ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle end_rod ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s run particle crit ~ ~1 ~ 2 2 2 0.3 150 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound block.note_block.pling master @a ~ ~ ~ 2 2
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 2 2

# 6. TAG SYSTEM
tag @s add queue_active
tag @s add quartz_immune
scoreboard players set @s queue_timer 120
scoreboard players set @s tasks_queued 0

# 7. MARK ENEMIES
execute at @s as @e[distance=0.1..18,type=!#minecraft:arrows,type=!item,tag=!quartz_immune] run tag @s add queue_target

# Visual marking
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s run particle dust{color:[1.0,1.0,1.0],scale:2} ~ ~1 ~ 0.5 1 0.5 0.5 60 force
execute at @s as @e[distance=0.1..18,tag=queue_target] at @s run particle crit ~ ~2 ~ 0.3 0.3 0.3 0 30 force

# 8. APPLY SPEED BUFFS
effect give @s speed 3 2 true
effect give @s haste 3 2 true

# 9. SET COOLDOWN
scoreboard players set @s cd_90s 1800
execute as @s store result score @s queue_rng_value run random value 1..3