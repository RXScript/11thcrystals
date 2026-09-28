execute unless entity @s[tag=has_amethyst] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amethyst] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amethyst] run return fail

# ==========================================
# AMETHYST TACTICAL: "SHATTER FREQUENCY"
# 30 Second Cooldown - 50 Mastery Points
# Tactical stun - Next attack creates resonant shockwave
# Stuns enemies in 5 block radius for 3 seconds
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ SHATTER READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ SHATTER FREQUENCY ⬥","color":"light_purple","bold":true}]
title @s subtitle [{"text":"Next strike resonates","color":"dark_purple","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @s [{"text":"   ⬥ SHATTER FREQUENCY ⬥","color":"light_purple","bold":true}]
tellraw @s [{"text":"  WINDOW: 3 seconds","color":"yellow"}]
tellraw @s [{"text":"  Hit enemy = resonant shockwave!","color":"gray"}]
tellraw @s [{"text":"  Stuns in 5 block radius","color":"dark_purple"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[0.5,0.0,1.0],scale:3} ~ ~1 ~ 2 2 2 1 400 force
execute at @s run particle end_rod ~ ~1 ~ 1.5 1.5 1.5 0.3 200 force
execute at @s run particle block{block_state:"minecraft:amethyst_block"} ~ ~1 ~ 1 1 1 1 300 force

# Vibration rings expanding
execute at @s run particle dust{color:[0.5,0.0,1.0],scale:2} ~ ~1 ~ 1 0.1 1 0 30 force
execute at @s run particle dust{color:[0.5,0.0,1.0],scale:2} ~ ~1 ~ 2 0.1 2 0 50 force
execute at @s run particle dust{color:[0.5,0.0,1.0],scale:2} ~ ~1 ~ 3 0.1 3 0 70 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.amethyst_block.resonate master @a ~ ~ ~ 2 2
execute at @s run playsound block.amethyst_block.chime master @a ~ ~ ~ 2 2
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 2

# 6. TAG SYSTEM
tag @s add frequency_charged
tag @s add amethyst_immune
scoreboard players set @s frequency_window 60
scoreboard players set @s frequency_triggered 0

# 7. MARK POTENTIAL TARGETS
execute at @s as @e[distance=0.1..18,type=!#minecraft:arrows,type=!item,tag=!amethyst_immune] run tag @s add frequency_target

# 8. APPLY STRENGTH BUFF (enhanced strike)
effect give @s strength 3 1 true

# 9. SET COOLDOWN
scoreboard players set @s cd_30s 600