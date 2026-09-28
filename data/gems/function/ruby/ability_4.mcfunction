execute unless entity @s[tag=has_ruby] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_ruby] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_ruby] run return fail

# ==========================================
# RUBY ELITE: "IMMOLATION PACT"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Burn yourself → Don't hit enough = death
# HIGH REWARD: Build stacks → Rebirth with devastation
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ PHOENIX DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..30] title [{"text":"⬥ ","color":"red","bold":true},{"selector":"@s","color":"red","bold":true},{"text":" ⬥","color":"red","bold":true}]
title @a[distance=0.1..30] subtitle {"text":"IGNITES THE PHOENIX","color":"gold","bold":true}
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @a[distance=0.1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"red"},{"text":" activates IMMOLATION PACT","color":"gray"}]
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle flame ~ ~1 ~ 10 10 10 2 2000 force
execute at @s run particle lava ~ ~1 ~ 8 8 8 1 1500 force
execute at @s run particle soul_fire_flame ~ ~1 ~ 8 8 8 1.5 1200 force
execute at @s run particle smoke ~ ~1 ~ 8 8 8 1 1000 force
execute at @s run particle glow ~ ~1 ~ 6 6 6 0.5 800 force

# Vertical fire pillar
execute at @s run particle flame ~ ~1 ~ 0.5 60 0.5 0 1200 force
execute at @s run particle soul_fire_flame ~ ~1 ~ 0.5 60 0.5 0 1000 force

# Ground fire circle
execute at @s run particle flame ~ ~0.1 ~ 12 0.1 12 0 1000 force
execute at @s run particle lava ~ ~0.1 ~ 10 0.1 10 0 800 force

# 4. SOUND SEQUENCE
execute at @s run playsound entity.blaze.ambient master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.generic.burn master @a ~ ~ ~ 3 1
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1
execute at @s run playsound entity.phoenix.ambient master @a ~ ~ ~ 3 1.5

# 5. TAG SYSTEM
tag @s add phoenix_form
tag @s add phoenix_immune
scoreboard players set @s phoenix_form_timer 160
scoreboard players set @s phoenix_stacks_elite 0
scoreboard players set @s self_burn_damage 0
scoreboard players set @s rebirth_ready_elite 0

# 6. MARK ENEMIES - IMMOLATION TARGETS
execute at @s as @e[distance=0.1..20,tag=!phoenix_immune] run tag @s add immolation_target
execute at @s store result score @s immolation_target_count if entity @e[distance=0.1..20,tag=immolation_target]

# Visual marking
execute at @s as @e[distance=0.1..20,tag=immolation_target] at @s run particle flame ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..20,tag=immolation_target] at @s run particle soul_fire_flame ~ ~1 ~ 0.5 1 0.5 0.3 60 force
execute at @s as @e[distance=0.1..20,tag=immolation_target] at @s run particle smoke ~ ~2 ~ 0.3 0.3 0.3 0.1 40 force

# 7. APPLY TEMPORARY BUFFS (8 seconds)
effect give @s strength 8 2 true
effect give @s speed 8 1 true
effect give @s fire_resistance 8 0 true

# 8. INITIAL SELF-DAMAGE (5 hearts to start)
damage @s 10 on_fire
scoreboard players add @s self_burn_damage 10

# 9. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 10. NOTIFY MARKED TARGETS
execute as @e[tag=immolation_target,type=player] run title @s title {"text":"⚠ IMMOLATION TARGET ⚠","color":"red","bold":true}
execute as @e[tag=immolation_target,type=player] run title @s subtitle {"text":"The phoenix burns for you","color":"gold","italic":true}

# 11. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ IMMOLATION PACT ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"8 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Marked Targets: ","color":"gray"},{"score":{"name":"@s","objective":"immolation_target_count"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength III + Speed II","color":"red"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"WARNING: ","color":"red","bold":true},{"text":"You are BURNING!","color":"gold"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Hit 6+ enemies","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Phoenix Rebirth + healing","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"< 6 hits","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Burn to death + debuffs","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]