execute unless entity @s[tag=has_echo] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_echo] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_echo] run return fail

# ==========================================
# ECHO SHARD ELITE: "SILENT HUNT"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Don't collect fragments → Overwhelmed by screams
# HIGH REWARD: Collect fragments → Silence detonates
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ SILENCE DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..30] title [{"text":"⬥ ","color":"dark_gray","bold":true},{"selector":"@s","color":"dark_gray","bold":true},{"text":" ⬥","color":"dark_gray","bold":true}]
title @a[distance=0.1..30] subtitle {"text":"BECOMES THE SILENCE","color":"black","bold":true}
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @a[distance=0.1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"dark_gray"},{"text":" activates SILENT HUNT","color":"gray"}]
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle squid_ink ~ ~1 ~ 10 10 10 2 2000 force
execute at @s run particle sculk_soul ~ ~1 ~ 8 8 8 1.5 1500 force
execute at @s run particle warped_spore ~ ~1 ~ 8 8 8 1 1200 force
execute at @s run particle smoke ~ ~1 ~ 6 6 6 0.8 1000 force

# Vertical darkness pillar
execute at @s run particle squid_ink ~ ~1 ~ 0.5 60 0.5 0 1200 force
execute at @s run particle sculk_soul ~ ~1 ~ 0.5 60 0.5 0 1000 force

# Ground silence circle
execute at @s run particle squid_ink ~ ~0.1 ~ 12 0.1 12 0 1000 force
execute at @s run particle warped_spore ~ ~0.1 ~ 10 0.1 10 0 800 force

# 4. SOUND SEQUENCE
execute at @s run playsound entity.warden.ambient master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.sculk_shrieker.shriek master @a ~ ~ ~ 3 1
execute at @s run playsound entity.enderman.scream master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1

# 5. TAG SYSTEM
tag @s add silent_hunter
tag @s add echo_immune
scoreboard players set @s silent_hunt_timer 440
scoreboard players set @s scream_fragments 0
scoreboard players set @s silence_backlash 0

# 6. MARK ENEMIES - SCREAM TARGETS
execute at @s as @e[distance=0.1..20,tag=!echo_immune] run tag @s add scream_marked
execute at @s as @e[distance=0.1..20,tag=scream_marked] run scoreboard players set @s fragment_dropped 0
execute at @s store result score @s scream_target_count if entity @e[distance=0.1..20,tag=scream_marked]

# Visual marking - darkness tendrils
execute at @s as @e[distance=0.1..20,tag=scream_marked] at @s run particle squid_ink ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..20,tag=scream_marked] at @s run particle sculk_soul ~ ~1 ~ 0.5 1 0.5 0.3 60 force
execute at @s as @e[distance=0.1..20,tag=scream_marked] at @s run particle warped_spore ~ ~2 ~ 0.3 0.3 0.3 0.1 40 force

# 7. APPLY HUNTER BUFFS (7 seconds)
effect give @s strength 7 2 true
effect give @s speed 7 2 true
effect give @s invisibility 7 0 true
effect give @s night_vision 7 0 true

# 8. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 9. NOTIFY MARKED TARGETS
execute as @e[tag=scream_marked,type=player] run title @s title {"text":"⚠ MARKED BY SILENCE ⚠","color":"dark_gray","bold":true}
execute as @e[tag=scream_marked,type=player] run title @s subtitle {"text":"The darkness hunts you","color":"black","italic":true}

# 10. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @s [{"text":"   ⬥ SILENT HUNT ⬥","color":"dark_gray","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"7 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Marked Targets: ","color":"gray"},{"score":{"name":"@s","objective":"scream_target_count"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength III + Speed III + Invisibility","color":"dark_gray"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"HUNT RULE: ","color":"red","bold":true},{"text":"Hit marked enemies!","color":"yellow"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Collect 8+ scream fragments","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Silence detonates + buffs","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"< 8 fragments","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Overwhelmed by screams + debuffs","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray","italic":true},{"text":"Each marked enemy drops 1 fragment when hit","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]