execute unless entity @s[tag=has_emerald] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_emerald] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_emerald] run return fail

# ==========================================
# EMERALD ELITE: "MERCHANT'S BARGAIN"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Fail to harvest → Life debt
# HIGH REWARD: Harvest souls → Life dominion
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ BARGAIN UNAVAILABLE: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..30] title [{"text":"⬥ ","color":"green","bold":true},{"selector":"@s","color":"green","bold":true},{"text":" ⬥","color":"green","bold":true}]
title @a[distance=0.1..30] subtitle {"text":"MAKES A BARGAIN","color":"dark_green","bold":true}
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @a[distance=0.1..30] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"green"},{"text":" offers MERCHANT'S BARGAIN","color":"gray"}]
tellraw @a[distance=0.1..30] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle happy_villager ~ ~1 ~ 10 10 10 2 2000 force
execute at @s run particle composter ~ ~1 ~ 8 8 8 1.5 1500 force
execute at @s run particle glow ~ ~1 ~ 8 8 8 1 1000 force
execute at @s run particle end_rod ~ ~1 ~ 6 6 6 0.5 800 force

# Vertical life beam
execute at @s run particle happy_villager ~ ~1 ~ 0.5 60 0.5 0 1200 force
execute at @s run particle composter ~ ~1 ~ 0.5 60 0.5 0 1000 force

# Ground life circle
execute at @s run particle happy_villager ~ ~0.1 ~ 12 0.1 12 0 1000 force
execute at @s run particle composter ~ ~0.1 ~ 10 0.1 10 0 800 force

# 4. SOUND SEQUENCE
execute at @s run playsound entity.villager.yes master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1.5

# 5. TAG SYSTEM
tag @s add bargain_active
tag @s add bargain_immune
scoreboard players set @s bargain_timer 200
scoreboard players set @s bargain_hits 0

# 6. MARK ENEMIES - THE PRICE
execute at @s as @e[distance=0.1..18,tag=!bargain_immune] run tag @s add bargain_marked
execute at @s store result score @s bargain_target_count if entity @e[distance=0.1..18,tag=bargain_marked]

# Visual marking
execute at @s as @e[distance=0.1..18,tag=bargain_marked] at @s run particle happy_villager ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..18,tag=bargain_marked] at @s run particle composter ~ ~1 ~ 0.5 1 0.5 0.3 60 force
execute at @s as @e[distance=0.1..18,tag=bargain_marked] at @s run particle glow ~ ~2 ~ 0.3 0.3 0.3 0.1 40 force

# 7. APPLY TEMPORARY BUFFS (10 seconds)
effect give @s strength 10 1 true
effect give @s speed 10 1 true
effect give @s absorption 10 4 true

# 8. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 9. NOTIFY MARKED TARGETS
execute as @e[tag=bargain_marked,type=player] run title @s title {"text":"⚠ MARKED ⚠","color":"green","bold":true}
execute as @e[tag=bargain_marked,type=player] run title @s subtitle {"text":"You are the price","color":"dark_green","italic":true}

# 10. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @s [{"text":"   ⬥ MERCHANT'S BARGAIN ⬥","color":"green","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"10 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Marked Targets: ","color":"gray"},{"score":{"name":"@s","objective":"bargain_target_count"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength II + Speed II","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Hit 10+ times","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Massive healing + life steal","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"< 10 hits","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  → Lose 10 hearts + debuffs","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]