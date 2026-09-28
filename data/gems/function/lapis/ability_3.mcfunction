execute unless entity @s[tag=has_lapis] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_lapis] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_lapis] run return fail

# ==========================================
# LAPIS ADVANCED: "ARCANE OVERFLOW"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Charge power → Release at peak
# Longer charge = more damage (but enemies see it)
# SUCCESS: Release at 80-100% → massive blast
# FAILURE: Release too early → weak pulse
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ ARCANE READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ CHARGING ⬥","color":"blue","bold":true}]
title @s subtitle {"text":"Release at peak power!","color":"dark_blue","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"blue","bold":true}]
tellraw @s [{"text":"   ⬥ ARCANE OVERFLOW ⬥","color":"blue","bold":true}]
tellraw @s [{"text":"  CHARGE TIME: 5 seconds","color":"yellow"}]
tellraw @s [{"text":"  Right-click to release!","color":"gray"}]
tellraw @s [{"text":"  80-100% = max damage","color":"green"}]
tellraw @s [{"text":"  < 60% = weak damage","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"blue","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle dust{color:[0.0,0.0,1.0],scale:3} ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle enchant ~ ~1 ~ 2 2 2 1 200 force
execute at @s run particle glow ~ ~1 ~ 2 2 2 0.3 150 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1 0.5

# 6. TAG SYSTEM
tag @s add arcane_charging
tag @s add lapis_immune
scoreboard players set @s arcane_charge_timer 100
scoreboard players set @s arcane_power 0
scoreboard players set @s overflow_released 0

# 7. MARK ENEMIES - Arcane targets
execute at @s as @e[distance=0.1..18,tag=!lapis_immune] run tag @s add arcane_target

# Visual marking
execute at @s as @e[distance=0.1..18,tag=arcane_target] at @s run particle dust{color:[0.0,0.0,1.0],scale:2} ~ ~1 ~ 0.5 1 0.5 0.5 60 force
execute at @s as @e[distance=0.1..18,tag=arcane_target] at @s run particle enchant ~ ~2 ~ 0.3 0.3 0.3 0 30 force

# 8. SET COOLDOWN (90 seconds = 1800 ticks)
scoreboard players set @s cd_90s 1800

effect give @s glowing 5 0 true
effect give @s slowness 5 3 true
effect give @s mining_fatigue 5 2 true
effect give @s weakness 5 255 true


# 9. Give item to right-click with
give @p carrot_on_a_stick[custom_name={text:"⬥ RELEASE OVERFLOW ⬥",bold:true,italic:false,color:"dark_blue"},rarity=epic,enchantment_glint_override=true,unbreakable={},custom_model_data={floats:[4]},custom_data={lapis_release:1b},tooltip_display={hidden_components:[enchantments]}]