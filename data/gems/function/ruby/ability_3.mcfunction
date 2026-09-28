execute unless entity @s[tag=has_ruby] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_ruby] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_ruby] run return fail

# ==========================================
# RUBY ADVANCED: "CHAIN IGNITION"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Sprint near enemies to ignite sparks
# SUCCESS: Ignite 6+ sparks in 3s → chain explosion
# FAILURE: Ignite < 6 → sparks backfire
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ IGNITION READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":"s","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ SPARKS PLANTED ⬥","color":"red","bold":true}]
title @s subtitle {"text":"Sprint near them to ignite!","color":"gold","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ CHAIN IGNITION ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  IGNITION TIME: 3 seconds","color":"yellow"}]
tellraw @s [{"text":"  Get within 3 blocks to ignite!","color":"gray"}]
tellraw @s [{"text":"  6+ ignited = chain explosion","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle flame ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle lava ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 2 2 2 0.5 150 force

# 5. SOUND SEQUENCE
execute at @s run playsound entity.blaze.ambient master @a ~ ~ ~ 2 1
execute at @s run playsound block.fire.ambient master @a ~ ~ ~ 2 1.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2

# 6. TAG SYSTEM
tag @s add ruby_igniter
tag @s add ruby_immune
scoreboard players set @s ignition_timer 60
scoreboard players set @s sparks_ignited 0

# 7. PLANT SPARKS ON ENEMIES
execute at @s as @e[distance=0.1..20,tag=!ruby_immune] run tag @s add spark_marked
execute at @s as @e[distance=0.1..20,tag=spark_marked] run scoreboard players set @s spark_ignited 0

# Visual marking - floating sparks
execute at @s as @e[distance=0.1..20,tag=spark_marked] at @s run particle flame ~ ~2 ~ 0.3 0.3 0.3 0.05 30 force
execute at @s as @e[distance=0.1..20,tag=spark_marked] at @s run particle lava ~ ~2 ~ 0.2 0.2 0.2 0 10 force
execute at @s as @e[distance=0.1..20,tag=spark_marked] at @s run particle dust{color:[1.0,0.5,0.0],scale:2} ~ ~2 ~ 0.3 0.3 0.3 0 20 force

# Count sparks
execute at @s store result score @s spark_total if entity @e[distance=0.1..20,tag=spark_marked]

# 8. APPLY SPEED BUFF (3 seconds to move fast)
effect give @s speed 3 2 true

# 9. SET COOLDOWN (90 seconds = 1800 ticks)
scoreboard players set @s cd_90s 1800