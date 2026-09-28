execute unless entity @s[tag=has_amethyst] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amethyst] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amethyst] run return fail

# ==========================================
# AMETHYST ELITE: "RESONANT STRIKE"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Break rhythm → Deafening backlash
# HIGH REWARD: Perfect rhythm → Sonic devastation
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ RESONANCE DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=1..30] title [{"text":"⬥ ","color":"light_purple","bold":true},{"selector":"@s","color":"light_purple","bold":true},{"text":" ⬥","color":"light_purple","bold":true}]
title @a[distance=1..30] subtitle {"text":"BEGINS THE RESONANCE","color":"dark_purple","bold":true}
tellraw @a[distance=1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @a[distance=1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"light_purple"},{"text":" activates RESONANT STRIKE","color":"gray"}]
tellraw @a[distance=1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 10 force
execute at @s run particle sculk_soul ~ ~1 ~ 10 10 10 2 2000 force
execute at @s run particle block{block_state:{Name:"minecraft:amethyst_block"}} ~ ~1 ~ 8 8 8 1.5 1500 force
execute at @s run particle end_rod ~ ~1 ~ 8 8 8 1 1000 force
execute at @s run particle note ~ ~1 ~ 6 6 6 1 800 force

# Vertical sound wave
execute at @s run particle sculk_soul ~ ~1 ~ 0.5 60 0.5 0 1200 force
execute at @s run particle note ~ ~1 ~ 0.5 60 0.5 0 1000 force

# Ground resonance circle
execute at @s run particle block{block_state:{Name:"minecraft:amethyst_block"}} ~ ~0.1 ~ 12 0.1 12 0 1000 force
execute at @s run particle note ~ ~0.1 ~ 10 0.1 10 0 800 force

# 4. SOUND SEQUENCE
execute at @s run playsound block.amethyst_block.chime master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.amethyst_cluster.break master @a ~ ~ ~ 3 1.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1
execute at @s run playsound block.note_block.chime master @a ~ ~ ~ 3 0.5

# 5. TAG SYSTEM
tag @s add resonance_active
tag @s add resonance_immune
scoreboard players set @s resonance4_timer 200
scoreboard players set @s resonance4_stacks 0
scoreboard players set @s rhythm_cooldown 0
scoreboard players set @s rhythm_broken 0

# 6. MARK ENEMIES - RESONANT TARGETS
execute at @s as @e[distance=0.1..20,tag=!resonance_immune] run tag @s add resonance_marked
execute at @s store result score @s resonance_target_count if entity @e[distance=0.1..20,tag=resonance_marked]

# Visual marking
execute at @s as @e[distance=0.1..20,tag=resonance_marked] at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 3 force
execute at @s as @e[distance=0.1..20,tag=resonance_marked] at @s run particle sculk_soul ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..20,tag=resonance_marked] at @s run particle note ~ ~1 ~ 0.5 1 0.5 0.3 60 force

# 7. APPLY TEMPORARY BUFFS (8 seconds)
effect give @s strength 8 1 true
effect give @s speed 8 1 true

# 8. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 9. NOTIFY MARKED TARGETS
execute as @e[tag=resonance_marked,type=player] run title @s title {"text":"⚠ RESONANCE MARKED ⚠","color":"light_purple","bold":true}
execute as @e[tag=resonance_marked,type=player] run title @s subtitle {"text":"The rhythm will shatter you","color":"dark_purple","italic":true}

# 10. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @s [{"text":"   ⬥ RESONANT STRIKE ⬥","color":"light_purple","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"8 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Marked Targets: ","color":"gray"},{"score":{"name":"@s","objective":"resonance_target_count"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength II + Speed II","color":"light_purple"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"RHYTHM RULE: ","color":"red","bold":true},{"text":"Wait 1s between hits","color":"yellow"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"6+ perfect hits","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Sonic devastation + buffs","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"< 6 hits OR break rhythm","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Deafening backlash + debuffs","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]