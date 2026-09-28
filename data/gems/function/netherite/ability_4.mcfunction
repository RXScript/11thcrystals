execute unless entity @s[tag=has_netherite] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_netherite] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_netherite] run return fail

# ==========================================
# NETHERITE ELITE: "GRAVITATIONAL COLLAPSE"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Don't pull enough → Crushed by weight
# HIGH REWARD: Pull them close → Collapse reality
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ GRAVITY DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..30] title [{"text":"⬥ ","color":"black","bold":true},{"selector":"@s","color":"black","bold":true},{"text":" ⬥","color":"black","bold":true}]
title @a[distance=0.1..30] subtitle {"text":"BECOMES THE MOUNTAIN","color":"dark_gray","bold":true}
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"black","bold":true}]
tellraw @a[distance=0.1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"black"},{"text":" activates GRAVITATIONAL COLLAPSE","color":"gray"}]
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"black","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 10 10 10 2 2000 force
execute at @s run particle lava ~ ~1 ~ 8 8 8 1 1500 force
execute at @s run particle smoke ~ ~1 ~ 8 8 8 1.5 1200 force
execute at @s run particle large_smoke ~ ~1 ~ 6 6 6 1 1000 force
execute at @s run particle end_rod ~ ~1 ~ 6 6 6 0.5 800 force

# Vertical weight pillar
execute at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 60 0.5 0 1200 force
execute at @s run particle smoke ~ ~1 ~ 0.5 60 0.5 0 1000 force

# Ground gravity circle
execute at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~0.1 ~ 12 0.1 12 0 1000 force
execute at @s run particle lava ~ ~0.1 ~ 10 0.1 10 0 800 force

# 4. SOUND SEQUENCE
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.warden.roar master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1
execute at @s run playsound entity.ender_dragon.growl master @a ~ ~ ~ 2 0.5

# 5. TAG SYSTEM
tag @s add gravity_well
tag @s add gravity4_immune
scoreboard players set @s gravity_timer 160
scoreboard players set @s gravity_pulled 0

# 6. MARK ENEMIES - GRAVITY TARGETS
execute at @s as @e[distance=0.1..20,tag=!gravity4_immune] run tag @s add gravity_target
execute at @s as @e[distance=0.1..20,tag=gravity_target] run scoreboard players set @s pulled_distance 0
execute at @s store result score @s gravity_target_count if entity @e[distance=0.1..20,tag=gravity_target]

# Visual marking - gravitational binding
execute at @s as @e[distance=0.1..20,tag=gravity_target] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..20,tag=gravity_target] at @s run particle smoke ~ ~1 ~ 0.5 1 0.5 0.3 60 force
execute at @s as @e[distance=0.1..20,tag=gravity_target] at @s run particle lava ~ ~2 ~ 0.3 0.3 0.3 0.1 40 force

# 7. APPLY MOUNTAIN STATE (8 seconds) - Heavy but unstoppable
effect give @s slowness 8 2 true
effect give @s resistance 8 2 true
effect give @s absorption 8 9 true
effect give @s strength 8 2 true

# Apply Knockback Resistance (simulate unmovable)
attribute @s minecraft:knockback_resistance base set 1.0

# 8. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 9. NOTIFY MARKED TARGETS
execute as @e[tag=gravity_target,type=player] run title @s title {"text":"⚠ GRAVITY WELL ⚠","color":"black","bold":true}
execute as @e[tag=gravity_target,type=player] run title @s subtitle {"text":"You are being pulled","color":"dark_gray","italic":true}

# 10. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"black","bold":true}]
tellraw @s [{"text":"   ⬥ GRAVITATIONAL COLLAPSE ⬥","color":"black","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"8 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Marked Targets: ","color":"gray"},{"score":{"name":"@s","objective":"gravity_target_count"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Slowness III (HEAVY)","color":"dark_gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Resistance III + Absorption X","color":"black"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Knockback Immunity","color":"black"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"GRAVITY RULE: ","color":"red","bold":true},{"text":"PULL enemies to you!","color":"yellow"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Pull 6+ within 5 blocks","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Reality collapse + devastation","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"< 6 pulled close","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Crushed by own weight + debuffs","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"black","bold":true}]