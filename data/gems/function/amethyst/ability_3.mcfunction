execute unless entity @s[tag=has_amethyst] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amethyst] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amethyst] run return fail

# ==========================================
# AMETHYST ADVANCED: "SEISMIC SENSE"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Activate → Wait → Detonate at peak
# Enemies that MOVE create vibrations you absorb
# SUCCESS: Detonate at 80+ vibrations → massive blast
# FAILURE: Detonate too early → weak pulse
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ SENSE READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ SEISMIC SENSE ⬥","color":"light_purple","bold":true}]
title @s subtitle {"text":"Feel the vibrations","color":"dark_purple","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @s [{"text":"   ⬥ SEISMIC SENSE ⬥","color":"light_purple","bold":true}]
tellraw @s [{"text":"  SENSE DURATION: 5 seconds","color":"yellow"}]
tellraw @s [{"text":"  Enemy movement = vibrations!","color":"gray"}]
tellraw @s [{"text":"  Right-click to detonate early","color":"yellow"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle dust{color:[0.5,0.0,0.5],scale:3} ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle minecraft:sculk_charge{roll:1.0} ~ ~1 ~ 2 2 2 0 100 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.amethyst_block.chime master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.sculk_sensor.clicking master @a ~ ~ ~ 3 1
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2

# 6. TAG SYSTEM
tag @s add seismic_sensing
tag @s add seismic_immune
scoreboard players set @s seismic_timer 100
scoreboard players set @s vibration_count 0
scoreboard players set @s detonated 0

# 7. MARK ENEMIES - Vibration sources
execute at @s as @e[distance=0.1..20,tag=!seismic_immune] run tag @s add vibration_source
execute at @s as @e[distance=0.1..20,tag=vibration_source] run scoreboard players set @s entity_last_x 0
execute at @s as @e[distance=0.1..20,tag=vibration_source] run scoreboard players set @s entity_last_z 0

# Store initial positions
execute at @s as @e[distance=0.1..20,tag=vibration_source] store result score @s entity_last_x run data get entity @s Pos[0] 100
execute at @s as @e[distance=0.1..20,tag=vibration_source] store result score @s entity_last_z run data get entity @s Pos[2] 100

# Visual marking
execute at @s as @e[distance=0.1..20,tag=vibration_source] at @s run particle dust{color:[0.5,0.0,0.5],scale:2} ~ ~1 ~ 0.5 1 0.5 0.5 60 force
execute at @s as @e[distance=0.1..20,tag=vibration_source] at @s run particle sculk_charge{roll:1.0} ~ ~1 ~ 0.3 0.5 0.3 0 30 force

# 8. SET COOLDOWN (90 seconds = 1800 ticks)
scoreboard players set @s cd_90s 1800