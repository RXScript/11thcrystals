execute unless entity @s[tag=has_netherite] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_netherite] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_netherite] run return fail

# ==========================================
# NETHERITE ADVANCED: "WEIGHT OF THE WORLD"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Anchor yourself → Pull enemies → Collapse
# SUCCESS: Pull 4+ enemies → gravitational collapse
# FAILURE: < 4 enemies pulled → weak tremor
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ ANCHOR READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ ANCHORED ⬥","color":"dark_gray","bold":true}]
title @s subtitle {"text":"Become the mountain","color":"gray","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @s [{"text":"   ⬥ WEIGHT OF THE WORLD ⬥","color":"dark_gray","bold":true}]
tellraw @s [{"text":"  ANCHOR TIME: 6 seconds","color":"yellow"}]
tellraw @s [{"text":"  You become IMMOVABLE!","color":"red","bold":true}]
tellraw @s [{"text":"  Enemies pulled toward you","color":"gray"}]
tellraw @s [{"text":"  4+ pulled = collapse","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle dust{color:[0.2,0.2,0.2],scale:3} ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s run particle falling_obsidian_tear ~ ~1 ~ 2 2 2 0.5 150 force

# 5. SOUND SEQUENCE
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound entity.warden.roar master @a ~ ~ ~ 2 0.5

# 6. TAG SYSTEM
tag @s add anchor_point
tag @s add netherite_immune
scoreboard players set @s anchor_timer 120
scoreboard players set @s pulled_count 0

# 7. STORE ANCHOR POSITION (cannot move from here)
execute store result score @s anchor_x run data get entity @s Pos[0] 100
execute store result score @s anchor_y run data get entity @s Pos[1] 100
execute store result score @s anchor_z run data get entity @s Pos[2] 100

# 8. MARK ENEMIES - Affected by gravity
execute at @s as @e[distance=0.1..20,tag=!netherite_immune] run tag @s add mass_affected
execute at @s as @e[distance=0.1..20,tag=mass_affected] run scoreboard players set @s pulled_distance 0

# Visual marking - gravitational field
execute at @s as @e[distance=0.1..20,tag=mass_affected] at @s run particle falling_obsidian_tear ~ ~1 ~ 0.5 1 0.5 0.5 60 force
execute at @s as @e[distance=0.1..20,tag=mass_affected] at @s run particle dust{color:[0.2,0.2,0.2],scale:2} ~ ~1 ~ 0.5 0.8 0.5 0 40 force

# 9. APPLY ANCHOR EFFECTS (cannot be moved)
effect give @s resistance 4 4 true
effect give @s slowness 4 255 true
effect give @s jump_boost 4 250 true

# 10. SET COOLDOWN
scoreboard players set @s cd_90s 1800