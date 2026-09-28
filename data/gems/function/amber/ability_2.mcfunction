execute unless entity @s[tag=has_amber] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_amber] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_amber] run return fail

# ==========================================
# AMBER TACTICAL: "RESIN BIND"
# 30 Second Cooldown - 50 Mastery Points
# Tactical root - Coat target in resin
# Target slowed + takes 50% more damage for 3s
# Resin shatters at end for damage
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ BIND READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. FIND NEAREST ENTITY IN FRONT (raycast)
tag @s add resin_caster
execute anchored eyes positioned ^ ^ ^0.5 run function gems:amber/raycast_bind
tag @s remove resin_caster

# 4. CHECK IF TARGET FOUND
execute unless entity @e[tag=resin_bound,limit=1] run title @s actionbar {"text":"⚠ No target found!","color":"red","bold":true}
execute unless entity @e[tag=resin_bound,limit=1] run playsound entity.villager.no master @s ~ ~ ~ 1 0.5
execute unless entity @e[tag=resin_bound,limit=1] run return fail

# 5. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ RESIN BIND ⬥","color":"gold","bold":true}]
title @s subtitle [{"text":"Trapped in time","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"   ⬥ RESIN BIND ⬥","color":"gold","bold":true}]
tellraw @s [{"text":"  DURATION: 3 seconds","color":"yellow"}]
tellraw @s [{"text":"  Target rooted in resin!","color":"gray"}]
tellraw @s [{"text":"  +50% damage taken","color":"red"}]
tellraw @s [{"text":"  Shatter damage at end","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# 6. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 15 force

# Target coated in resin
execute as @e[tag=resin_bound,limit=1] at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 8 force
execute as @e[tag=resin_bound,limit=1] at @s run particle explosion ~ ~1 ~ 1 1 1 0 30 force
execute as @e[tag=resin_bound,limit=1] at @s run particle block{block_state:"minecraft:honey_block"} ~ ~1 ~ 1 1 1 1 300 force
execute as @e[tag=resin_bound,limit=1] at @s run particle item{item:"minecraft:honey_bottle"} ~ ~1 ~ 1 1 1 0.5 200 force
execute as @e[tag=resin_bound,limit=1] at @s run particle dust{color:[1.0,0.7,0.0],scale:4} ~ ~1 ~ 1 1 1 1 250 force

# Resin dripping effect
execute as @e[tag=resin_bound,limit=1] at @s run particle dripping_honey ~ ~2 ~ 0.8 0.3 0.8 0 50 force
execute as @e[tag=resin_bound,limit=1] at @s run particle falling_honey ~ ~1.5 ~ 0.5 0.5 0.5 0 30 force

# 7. SOUND SEQUENCE
execute at @s run playsound block.honey_block.place master @a ~ ~ ~ 2 0.8
execute at @s run playsound block.honey_block.slide master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 2

# Target sound
execute as @e[tag=resin_bound,limit=1] at @s run playsound block.honey_block.place master @a ~ ~ ~ 2 0.5
execute as @e[tag=resin_bound,limit=1] at @s run playsound entity.slime.squish master @a ~ ~ ~ 2 0.8

# 8. TAG SYSTEM
tag @s add resin_binding
tag @s add amber2_immune
scoreboard players set @s bind_timer 60

# 9. APPLY RESIN EFFECTS TO TARGET (3 seconds)
execute as @e[tag=resin_bound,limit=1] run effect give @s slowness 3 3 true
execute as @e[tag=resin_bound,limit=1] run effect give @s jump_boost 3 250 true
execute as @e[tag=resin_bound,limit=1] run effect give @s mining_fatigue 3 2 true
execute as @e[tag=resin_bound,limit=1] run effect give @s glowing 3 0 true
execute as @e[tag=resin_bound,limit=1] run effect give @s weakness 3 0 true

# Mark for bonus damage
execute as @e[tag=resin_bound,limit=1] run scoreboard players set @s resin_duration 60

# 10. SET COOLDOWN
scoreboard players set @s cd_30s 600