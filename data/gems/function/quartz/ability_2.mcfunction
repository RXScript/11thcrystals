execute unless entity @s[tag=has_quartz] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_quartz] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_quartz] run return fail

# ==========================================
# QUARTZ TACTICAL: "PRECISION STRIKE"
# 30 Second Cooldown - 50 Mastery Points
# Tactical finisher - Perfect calculated hit
# Next attack: bonus damage + crit + armor pierce
# Kill refunds cooldown
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ STRIKE READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ PRECISION STRIKE ⬥","color":"white","bold":true}]
title @s subtitle [{"text":"Perfectly calculated","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @s [{"text":"   ⬥ PRECISION STRIKE ⬥","color":"white","bold":true}]
tellraw @s [{"text":"  WINDOW: 3 seconds","color":"yellow"}]
tellraw @s [{"text":"  Next hit enhanced!","color":"gray"}]
tellraw @s [{"text":"  +10 bonus damage","color":"red"}]
tellraw @s [{"text":"  Guaranteed critical","color":"gold"}]
tellraw @s [{"text":"  Kill = refund cooldown","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[1.0,1.0,1.0],scale:3} ~ ~1 ~ 2 2 2 1 400 force
execute at @s run particle crit ~ ~1 ~ 1.5 1.5 1.5 0.5 300 force
execute at @s run particle end_rod ~ ~1 ~ 1.5 1.5 1.5 0.3 200 force
execute at @s run particle electric_spark ~ ~1 ~ 1.5 1.5 1.5 0.3 150 force

# Calculation matrix effect
execute at @s run particle dust{color:[0.9,0.9,0.9],scale:2} ~1 ~1 ~ 0.1 0.5 0.1 0 20 force
execute at @s run particle dust{color:[0.9,0.9,0.9],scale:2} ~-1 ~1 ~ 0.1 0.5 0.1 0 20 force
execute at @s run particle dust{color:[0.9,0.9,0.9],scale:2} ~ ~1 ~1 0.1 0.5 0.1 0 20 force
execute at @s run particle dust{color:[0.9,0.9,0.9],scale:2} ~ ~1 ~-1 0.1 0.5 0.1 0 20 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 2
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 2 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 2

# 6. TAG SYSTEM
tag @s add precision_charged
tag @s add quartz2_immune
scoreboard players set @s precision_window 60
scoreboard players set @s precision_used 0

# 7. MARK POTENTIAL TARGETS
execute at @s as @e[distance=0.1..18,type=!#minecraft:arrows,type=!item,tag=!quartz_immune] run tag @s add precision_target

# 8. APPLY STRENGTH BUFF (enhanced strike)
effect give @s strength 3 2 true

# 9. SET COOLDOWN (will be refunded if kill)
scoreboard players set @s cd_30s 600