execute unless entity @s[tag=has_echo] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_echo] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_echo] run return fail

# ==========================================
# ECHO SHARD ADVANCED: "VOID ECHOES"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Place echoes → Wait for resonance → Detonate
# SUCCESS: 4+ echoes resonate → void collapse
# FAILURE: < 4 echoes OR detonate too early → weak pulse
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ ECHOES READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ VOID ECHOES ⬥","color":"dark_purple","bold":true}]
title @s subtitle {"text":"Let them resonate","color":"light_purple","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]
tellraw @s [{"text":"   ⬥ VOID ECHOES ⬥","color":"dark_purple","bold":true}]
tellraw @s [{"text":"  RESONANCE TIME: 6 seconds","color":"yellow"}]
tellraw @s [{"text":"  Echoes placed at enemy locations","color":"gray"}]
tellraw @s [{"text":"  Wait 2s+ for resonance!","color":"aqua"}]
tellraw @s [{"text":"  Right-click to detonate early","color":"yellow"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle soul ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle dust{color:[0.3,0.0,0.5],scale:3} ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s run particle sculk_charge{roll:10.0} ~ ~1 ~ 2 2 2 0 150 force

# 5. SOUND SEQUENCE
execute at @s run playsound entity.warden.ambient master @a ~ ~ ~ 2 0.5
execute at @s run playsound particle.soul_escape master @a ~ ~ ~ 2 1
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2

# 6. TAG SYSTEM
tag @s add void_echoist
tag @s add echo3_immune
scoreboard players set @s echo_timer 160
scoreboard players set @s echo_count 0
scoreboard players set @s resonance_level 0
scoreboard players set @s echo_detonated 0

# 7. PLACE ECHOES at enemy locations
execute at @s as @e[distance=0.1..20,tag=!echo_immune] at @s run function gems:echo/place_echo

# Count echoes
execute at @s store result score @s echo_count if entity @e[tag=void_echo_marker]

# 8. SET COOLDOWN
scoreboard players set @s cd_90s 1800

# 9. Give detonator
give @s carrot_on_a_stick[custom_name={text:"⬥ COLLAPSE ECHOES ⬥",bold:true,italic:false,color:"dark_purple"},rarity=epic,enchantment_glint_override=true,unbreakable={},custom_model_data={floats:[9]},custom_data={echo_detonate:1b},tooltip_display={hidden_components:[enchantments]}]