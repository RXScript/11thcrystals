execute unless entity @s[tag=has_amber] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amber] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amber] run return fail

# ==========================================
# AMBER ADVANCED: "RESIN TRAP"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Place trap → Bait enemies → Detonate
# SUCCESS: 3+ enemies trapped → amber explosion
# FAILURE: < 3 trapped → trap dissolves
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ TRAP READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ TRAP SET ⬥","color":"gold","bold":true}]
title @s subtitle {"text":"Bait them in!","color":"yellow","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"   ⬥ RESIN TRAP ⬥","color":"gold","bold":true}]
tellraw @s [{"text":"  TRAP DURATION: 4 seconds","color":"yellow"}]
tellraw @s [{"text":"  Enemies walk over = STUCK!","color":"gray"}]
tellraw @s [{"text":"  Right-click to detonate early","color":"yellow"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle falling_honey ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle dust{color:[1.0,0.7,0.0],scale:3} ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s run particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 2 2 2 0.5 150 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.honey_block.place master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound entity.slime.squish master @a ~ ~ ~ 2 1

# 6. TAG SYSTEM
tag @s add trap_master
tag @s add amber_immune
scoreboard players set @s trap_timer 80
scoreboard players set @s trapped_count 0
scoreboard players set @s trap_detonated 0

# 7. STORE TRAP LOCATION
execute store result score @s trap_x run data get entity @s Pos[0] 100
execute store result score @s trap_y run data get entity @s Pos[1] 100
execute store result score @s trap_z run data get entity @s Pos[2] 100

# 8. VISUAL MARKER - Place trap at feet
execute at @s run particle falling_honey ~ ~0.1 ~ 2.5 0.1 2.5 0 200 force
execute at @s run particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~0.1 ~ 2 0.1 2 0 150 force
execute at @s run particle dust{color:[1.0,0.7,0.0],scale:3} ~ ~0.1 ~ 2.5 0.1 2.5 0 100 force

# 9. SET COOLDOWN (90 seconds = 1800 ticks)
scoreboard players set @s cd_90s 1800

# 10. Give detonator item
give @s carrot_on_a_stick[custom_name={text:"⬥ DETONATE TRAP ⬥",bold:true,italic:false,color:"gold"},rarity=epic,enchantment_glint_override=true,unbreakable={},custom_model_data={floats:[6]},custom_data={amber_detonate:1b},tooltip_display={hidden_components:[enchantments]}]