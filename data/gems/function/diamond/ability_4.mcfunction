execute unless entity @s[tag=has_diamond] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_diamond] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_diamond] run return fail

# ==========================================
# DIAMOND ELITE: "IMMOVABLE FORTRESS"
# 3 Minute Cooldown - 300 Mastery Points
# HIGH RISK: Miss = severe debuffs
# HIGH REWARD: Hit = devastating counter
# ==========================================

# 1. Cooldown Check
execute if score @s cd_3m matches 1.. run title @s actionbar [{"text":"⬥ FORTRESS RECHARGING: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_3m"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_3m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_3m matches 1.. run return fail

# 2. ACTIVATION ANNOUNCEMENT
title @a[distance=0.1..20] title [{"text":"⬥ ","color":"aqua","bold":true},{"selector":"@s","color":"aqua","bold":true},{"text":" ⬥","color":"aqua","bold":true}]
title @a[distance=0.1..20] subtitle {"text":"BECOMES IMMOVABLE","color":"gray","bold":true}
tellraw @a[distance=0.1..20] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @a[distance=0.1..20] [{"text":"   ⬥ ","color":"gray"},{"selector":"@s","color":"aqua"},{"text":" activates IMMOVABLE FORTRESS","color":"gray"}]
tellraw @a[distance=0.1..20] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]

# 3. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 10 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 50 force
execute at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 8 8 8 1.5 1500 force
execute at @s run particle end_rod ~ ~1 ~ 8 8 8 1 1000 force
execute at @s run particle firework ~ ~1 ~ 8 8 8 0.8 800 force

# Ground anchor effect
execute at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~0.1 ~ 10 0.1 10 1 1000 force
execute at @s run particle end_rod ~ ~0.1 ~ 8 0.1 8 0.5 600 force

# Vertical pillar (rooted to earth)
execute at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 0.5 50 0.5 0 1000 force

# 4. SOUND SEQUENCE
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 1
execute at @s run playsound block.respawn_anchor.charge master @a ~ ~ ~ 2 1.5

# 5. TAG SYSTEM
tag @s add fortress_active
tag @s add fortress_immune
scoreboard players set @s fortress_timer 200
scoreboard players set @s fortress_hits 0
scoreboard players set @s damage_absorbed 0

# 6. MARK ENEMIES IN RANGE
execute at @s as @e[distance=0.1..20,tag=!fortress_immune] run tag @s add fortress_target

# Initial pull toward fortress
execute at @s as @e[distance=0.1..20,tag=fortress_target] facing entity @p[tag=fortress_active] feet run tp @s ^ ^ ^3

# 7. APPLY FORTRESS BUFFS (10 seconds)
effect give @s resistance 10 4 true
effect give @s absorption 10 9 true
effect give @s slowness 10 255 true
effect give @s jump_boost 10 2 true

# 8. SET COOLDOWN (3 minutes = 3600 ticks)
scoreboard players set @s cd_3m 3600

# 9. STORE CURRENT POSITION (for immovable check)
execute store result score @s fortress_x run data get entity @s Pos[0] 100
execute store result score @s fortress_y run data get entity @s Pos[1] 100
execute store result score @s fortress_z run data get entity @s Pos[2] 100

# 10. NOTIFY ENEMIES
execute as @e[tag=fortress_target,type=player] run title @s title {"text":"⚠ FORTRESS ACTIVE ⚠","color":"aqua","bold":true}
execute as @e[tag=fortress_target,type=player] run title @s subtitle {"text":"Strike the mountain or flee","color":"gray","italic":true}

# 11. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @s [{"text":"   ⬥ IMMOVABLE FORTRESS ⬥","color":"aqua","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"10 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Resistance V + Absorption X","color":"aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Rooted to earth (cannot move)","color":"aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Enemies pulled toward you","color":"aqua"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"SUCCESS: ","color":"red","bold":true},{"text":"Take damage → Devastating counter","color":"green"}]
tellraw @s [{"text":"  ","color":"red","bold":true},{"text":"FAILURE: ","color":"red","bold":true},{"text":"No damage → Severe debuffs","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]