execute unless entity @s[tag=has_emerald] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_emerald] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_emerald] run return fail

# ==========================================
# EMERALD TACTICAL: "VERDANT GRASP"
# 30 Second Cooldown - 50 Mastery Points
# Tactical lifesteal - 60% of damage heals you
# Duration: 4 seconds
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ GRASP READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ VERDANT GRASP ⬥","color":"green","bold":true}]
title @s subtitle [{"text":"Life flows to you","color":"dark_green","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @s [{"text":"   ⬥ VERDANT GRASP ⬥","color":"green","bold":true}]
tellraw @s [{"text":"  DURATION: 4 seconds","color":"yellow"}]
tellraw @s [{"text":"  Your attacks heal you!","color":"gray"}]
tellraw @s [{"text":"  60% lifesteal","color":"dark_green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[0.0,1.0,0.0],scale:3} ~ ~1 ~ 2 2 2 1 400 force
execute at @s run particle happy_villager ~ ~1 ~ 1.5 1.5 1.5 0.5 300 force
execute at @s run particle block{block_state:"minecraft:emerald_block"} ~ ~1 ~ 1 1 1 1 200 force

# Vine effect rising
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~0.1 ~ 0.8 0.1 0.8 0 30 force
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~0.5 ~ 0.7 0.1 0.7 0 25 force
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~1 ~ 0.6 0.1 0.6 0 20 force
execute at @s run particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~1.5 ~ 0.5 0.1 0.5 0 15 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound block.grass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1.5

# 6. TAG SYSTEM
tag @s add verdant_grasping
tag @s add emerald_immune
scoreboard players set @s grasp_timer 80
scoreboard players set @s grasp_healed 0

# 7. MARK POTENTIAL VICTIMS
execute at @s as @e[distance=0.1..18,type=!#minecraft:arrows,type=!item,tag=!emerald_immune] run tag @s add grasp_victim

# 8. APPLY SPEED BUFF (predatory movement)
effect give @s speed 4 1 true

# 9. SET COOLDOWN
scoreboard players set @s cd_30s 600