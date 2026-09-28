execute unless entity @s[tag=has_netherite] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_netherite] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_netherite] run return fail

# ==========================================
# NETHERITE ULTIMATE: "THE INEVITABLE"
# 10 Minute Cooldown - 500 Mastery Points
# "You are the mountain. Nothing moves you."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ MOUNTAIN DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" tickss remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a[distance=0.1..100] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"#2c2c2c","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0.1..100] subtitle {"text":"BECOMES THE INEVITABLE","color":"#4a4a4a","bold":true}
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"       ⬥ THE INEVITABLE AWAKENED ⬥","color":"#4a4a4a","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"          ","color":"gray"},{"selector":"@s","color":"#2c2c2c"},{"text":" anchors to the earth","color":"gray"}]
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# 3. ACTIVATION SEQUENCE - GRAVITATIONAL COLLAPSE
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 25 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 120 force
execute at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 12 12 12 2 3000 force
execute at @s run particle smoke ~ ~1 ~ 12 12 12 1 2000 force
execute at @s run particle cloud ~ ~1 ~ 10 10 10 1 1500 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 2 1000 force
execute at @s run particle explosion ~ ~1 ~ 10 10 10 1 800 force

# Vertical anchor pillar (connecting to earth's core)
execute at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 100 0.5 0 2000 force
execute at @s run particle smoke ~ ~1 ~ 0.5 100 0.5 0 1500 force

# Ground impact crater
execute at @s run particle block{block_state:{Name:"minecraft:stone"}} ~ ~0.1 ~ 15 0.1 15 2 2000 force
execute at @s run particle explosion ~ ~0.1 ~ 15 0.1 15 0 150 force
execute at @s run particle cloud ~ ~0.1 ~ 12 0.1 12 1 1000 force

# 4. INITIAL GRAVITY WAVE
execute at @s run particle sweep_attack ~ ~1 ~ 22 0.1 22 1 450 force
execute at @s run particle explosion ~ ~1 ~ 22 0.1 22 1 400 force
execute at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 18 5 18 2 2000 force

# 5. TAG SYSTEM
tag @s add netherite_master
tag @s add gravity_immune

# 6. MARK ALL NEARBY ENTITIES - GRAVITY PULL
execute at @s as @e[distance=0.1..35,tag=!gravity_immune] run tag @s add gravity_target
execute at @s as @e[distance=0.1..35,tag=gravity_target] run scoreboard players set @s gravity_damage 0

# Initial massive damage wave
execute at @s as @e[distance=0.1..35,tag=gravity_target] run damage @s 35 player_attack by @p[tag=netherite_master]

# Pull toward center (gravity well)
execute at @s as @e[distance=0.1..35,tag=gravity_target] facing entity @p[tag=netherite_master] feet run tp @s ^ ^ ^2

# Apply crushing effects
execute at @s as @e[distance=0.1..35,tag=gravity_target] run effect give @s slowness 60 3 true
execute at @s as @e[distance=0.1..35,tag=gravity_target] run effect give @s weakness 60 2 true
execute at @s as @e[distance=0.1..35,tag=gravity_target] run effect give @s mining_fatigue 60 3 true

# Visual feedback
execute at @s as @e[distance=0.1..35,tag=gravity_target] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s as @e[distance=0.1..35,tag=gravity_target] at @s run particle cloud ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..35,tag=gravity_target] at @s run particle smoke ~ ~1 ~ 0.5 1 0.5 0.3 60 force

# 7. CATASTROPHIC SOUND SEQUENCE
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.warden.emerge master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.ender_dragon.growl master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.iron_golem.death master @a ~ ~ ~ 3 0.5

execute at @s run function gems:netherite/gravity_display_start

# 8. GIVE NETHERITE BUFFS (60 seconds)
effect give @s resistance 60 4 true
effect give @s absorption 60 19 true
effect give @s strength 60 3 true
effect give @s regeneration 60 3 true
effect give @s fire_resistance 60 0 true
effect give @s slowness 60 3 true
effect give @s jump_boost 60 1 true

# 9. APPLY INEVITABLE TAG
tag @s add the_inevitable
scoreboard players set @s inevitable_timer 1200
scoreboard players set @s total_gravity_damage 0
scoreboard players set @s inevitable_kills 0

# 10. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 11. NOTIFY MARKED TARGETS
execute as @e[tag=gravity_target,type=player] run title @s title {"text":"⚠ GRAVITY WELL ⚠","color":"dark_gray","bold":true}
execute as @e[tag=gravity_target,type=player] run title @s subtitle {"text":"You are pulled to the center","color":"gray","italic":true}

# 12. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━     ","color":"dark_gray","bold":true}]
tellraw @s [{"text":"     ⬥ THE INEVITABLE ⬥","color":"#4a4a4a","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Resistance V (96% reduction)","color":"dark_gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Absorption XX (40 extra hearts)","color":"dark_gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength IV (massive damage)","color":"dark_gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• 35-block Gravity Domain","color":"dark_gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Crushing Gravity: 8 damage/2s","color":"dark_gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Gravity Slam: 15 damage/4s","color":"dark_gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Unstoppable: Cannot be moved","color":"dark_gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Gravitational Collapse: Final impact","color":"red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"You are the mountain. Nothing moves you.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━          ","color":"dark_gray","bold":true}]