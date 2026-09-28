execute unless entity @s[tag=has_lapis] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_lapis] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_lapis] run return fail

# ==========================================
# LAPIS ELITE: "ARCANE CASCADE"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Hit same target twice → Arcane backlash
# HIGH REWARD: Hit 5+ different targets → Knowledge storm
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ ARCANE DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..30] title [{"text":"⬥ ","color":"dark_blue","bold":true},{"selector":"@s","color":"dark_blue","bold":true},{"text":" ⬥","color":"dark_blue","bold":true}]
title @a[distance=0.1..30] subtitle {"text":"WEAVES THE ARCANE","color":"blue","bold":true}
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_blue","bold":true}]
tellraw @a[distance=0.1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"dark_blue"},{"text":" activates ARCANE CASCADE","color":"gray"}]
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_blue","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle enchant ~ ~1 ~ 10 10 10 2 2000 force
execute at @s run particle block{block_state:{Name:"minecraft:lapis_block"}} ~ ~1 ~ 8 8 8 1.5 1500 force
execute at @s run particle portal ~ ~1 ~ 8 8 8 1 1200 force
execute at @s run particle glow ~ ~1 ~ 8 8 8 1 1000 force
execute at @s run particle dragon_breath ~ ~1 ~ 6 6 6 0.5 800 force

# Vertical arcane beam
execute at @s run particle enchant ~ ~1 ~ 0.5 60 0.5 0 1200 force
execute at @s run particle portal ~ ~1 ~ 0.5 60 0.5 0 1000 force

# Ground arcane circle
execute at @s run particle enchant ~ ~0.1 ~ 12 0.1 12 0 1000 force
execute at @s run particle block{block_state:{Name:"minecraft:lapis_block"}} ~ ~0.1 ~ 10 0.1 10 0 800 force

# 4. SOUND SEQUENCE
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.evoker.prepare_summon master @a ~ ~ ~ 3 1.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 3 0.5

# 5. TAG SYSTEM
tag @s add cascade_active
tag @s add cascade_immune
scoreboard players set @s cascade_timer 200
scoreboard players set @s cascade_targets_hit 0
scoreboard players set @s cascade_failed 0

# 6. MARK ENEMIES - ARCANE TARGETS
execute at @s as @e[distance=0.1..20,tag=!cascade_immune] run tag @s add cascade_marked
execute at @s as @e[distance=0.1..20,tag=cascade_marked] run scoreboard players set @s cascade_hit_by_player 0
execute at @s store result score @s cascade_target_count if entity @e[distance=0.1..20,tag=cascade_marked]

# Visual marking
execute at @s as @e[distance=0.1..20,tag=cascade_marked] at @s run particle enchant ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..20,tag=cascade_marked] at @s run particle portal ~ ~1 ~ 0.5 1 0.5 0.3 60 force
execute at @s as @e[distance=0.1..20,tag=cascade_marked] at @s run particle glow ~ ~2 ~ 0.3 0.3 0.3 0.1 40 force

# 7. APPLY TEMPORARY BUFFS (10 seconds)
effect give @s strength 10 1 true
effect give @s speed 10 2 true
effect give @s night_vision 10 0 true

# 8. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 9. NOTIFY MARKED TARGETS
execute as @e[tag=cascade_marked,type=player] run title @s title {"text":"⚠ ARCANE MARKED ⚠","color":"dark_blue","bold":true}
execute as @e[tag=cascade_marked,type=player] run title @s subtitle {"text":"Knowledge seeks you","color":"blue","italic":true}

# 10. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_blue","bold":true}]
tellraw @s [{"text":"   ⬥ ARCANE CASCADE ⬥","color":"dark_blue","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"10 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Marked Targets: ","color":"gray"},{"score":{"name":"@s","objective":"cascade_target_count"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength II + Speed III","color":"blue"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"CASCADE RULE: ","color":"red","bold":true},{"text":"Hit DIFFERENT targets","color":"yellow"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Hit 5+ different enemies","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Arcane burst + XP gain + buffs","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"< 5 OR hit same twice","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Lose XP levels + debuffs","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_blue","bold":true}]