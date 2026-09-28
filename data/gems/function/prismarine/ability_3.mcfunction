execute unless entity @s[tag=has_prismarine] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_prismarine] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_prismarine] run return fail

# ==========================================
# PRISMARINE ADVANCED: "GUARDIAN'S FOCUS"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Channel laser beam without moving
# SUCCESS: Channel 3s+ without moving → devastating beam
# FAILURE: Move OR get interrupted → beam fizzles
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ FOCUS READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ FOCUSING ⬥","color":"dark_aqua","bold":true}]
title @s subtitle [{"text":"DON'T MOVE!","color":"aqua","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"   ⬥ GUARDIAN'S FOCUS ⬥","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"  CHANNEL TIME: 6 seconds max","color":"yellow"}]
tellraw @s [{"text":"  STAY STILL to charge beam!","color":"red","bold":true}]
tellraw @s [{"text":"  3s+ = devastating laser","color":"green"}]
tellraw @s [{"text":"  Movement = beam breaks!","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle bubble_pop ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle dust{color:[0.0,0.7,1.0],scale:3} ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s run particle electric_spark ~ ~1 ~ 2 2 2 0.3 150 force

# 5. SOUND SEQUENCE
execute at @s run playsound entity.guardian.ambient master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.conduit.activate master @a ~ ~ ~ 2 2
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2

# 6. TAG SYSTEM
tag @s add guardian_focusing
tag @s add prismarine_immune
scoreboard players set @s focus_timer 120
scoreboard players set @s focus_charge 0
scoreboard players set @s focus_broken 0

# 7. STORE POSITION (to detect movement)
execute store result score @s focus_pos_x run data get entity @s Pos[0] 100
execute store result score @s focus_pos_y run data get entity @s Pos[1] 100
execute store result score @s focus_pos_z run data get entity @s Pos[2] 100

# 8. MARK TARGET (closest enemy)
execute at @s as @e[distance=0.1..20,tag=!prismarine_immune,sort=nearest,limit=1] run tag @s add laser_target

# Visual target lock
execute at @s as @e[tag=laser_target] at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 0.5 1 0.5 0.5 100 force
execute at @s as @e[tag=laser_target] at @s run particle electric_spark ~ ~2 ~ 0.3 0.3 0.3 0 50 force

# 9. APPLY SLOWNESS (vulnerable while channeling)
effect give @s slowness 4 4 true
effect give @s weakness 4 2 true

# 10. SET COOLDOWN
scoreboard players set @s cd_90s 1800

give @s carrot_on_a_stick[custom_name={text:"⬥ FIRE LASER ⬥",bold:true,italic:false,color:"dark_aqua"},rarity=epic,enchantment_glint_override=true,unbreakable={},custom_model_data={floats:[8]},custom_data={fire_laser:1b},tooltip_display={hidden_components:[enchantments]}]