execute unless entity @s[tag=has_netherite] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_netherite] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_netherite] run return fail

# ==========================================
# NETHERITE TACTICAL: "CRUSHING GRASP"
# 30 Second Cooldown - 50 Mastery Points
# Tactical grab - Pull nearest enemy to you
# Slam them down for damage + ground effect
# Heavy impact, inevitable pull
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ GRASP READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. FIND NEAREST ENEMY IN FRONT (raycast)
tag @s add grasp_caster
execute anchored eyes positioned ^ ^ ^0.5 run function gems:netherite/raycast_grasp
tag @s remove grasp_caster

# 4. CHECK IF TARGET FOUND
execute unless entity @e[tag=grasp_victim,limit=1] run title @s actionbar {"text":"⚠ No target found!","color":"red","bold":true}
execute unless entity @e[tag=grasp_victim,limit=1] run playsound entity.villager.no master @s ~ ~ ~ 1 0.5
execute unless entity @e[tag=grasp_victim,limit=1] run return fail

# 5. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ CRUSHING GRASP ⬥","color":"dark_gray","bold":true}]
title @s subtitle [{"text":"Inevitable pull","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @s [{"text":"   ⬥ CRUSHING GRASP ⬥","color":"dark_gray","bold":true}]
tellraw @s [{"text":"  Pulling target...","color":"gray"}]
tellraw @s [{"text":"  Slam Damage: 16 HP","color":"red"}]
tellraw @s [{"text":"  Ground Effect: 3s","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# 6. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[0.2,0.2,0.2],scale:3} ~ ~1 ~ 2 2 2 1 400 force
execute at @s run particle block{block_state:"minecraft:netherite_block"} ~ ~1 ~ 1 1 1 1 300 force
execute at @s run particle smoke ~ ~1 ~ 1.5 1.5 1.5 0.3 200 force

# Gravitational pull effect
execute at @s run particle dust{color:[0.3,0.3,0.3],scale:3} ~ ~1 ~ 3 0.1 3 0 80 force
execute at @s run particle dust{color:[0.3,0.3,0.3],scale:3} ~ ~1 ~ 2 0.1 2 0 60 force
execute at @s run particle dust{color:[0.3,0.3,0.3],scale:3} ~ ~1 ~ 1 0.1 1 0 40 force

# 7. SOUND SEQUENCE
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.iron_golem.attack master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 2

# Target grabbed sound
execute as @e[tag=grasp_victim,limit=1] at @s run playsound entity.iron_golem.hurt master @a ~ ~ ~ 2 1
execute as @e[tag=grasp_victim,limit=1] at @s run playsound block.chain.break master @a ~ ~ ~ 2 0.5

# 8. TAG SYSTEM
tag @s add crushing_grasper
tag @s add netherite2_immune
scoreboard players set @s grasp_timer 10

# 9. TELEPORT TARGET TO PLAYER IMMEDIATELY (2 blocks in front)
execute as @e[tag=grasp_victim,limit=1] at @p[tag=crushing_grasper] run tp @s ^ ^ ^2 facing entity @p[tag=crushing_grasper] eyes

# 10. PULL VISUALS
execute as @e[tag=grasp_victim,limit=1] at @s run particle explosion ~ ~1 ~ 1 1 1 0 30 force
execute as @e[tag=grasp_victim,limit=1] at @s run particle dust{color:[0.3,0.3,0.3],scale:4} ~ ~1 ~ 1 1 1 1 200 force
execute as @e[tag=grasp_victim,limit=1] at @s run particle smoke ~ ~1 ~ 1 1 1 0.3 150 force
execute as @e[tag=grasp_victim,limit=1] at @s run particle block{block_state:"minecraft:netherite_block"} ~ ~1 ~ 0.8 0.8 0.8 0.5 60 force

# Pull sound
execute at @s run playsound entity.iron_golem.attack master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.chain.break master @a ~ ~ ~ 3 1
execute at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 2 0.5

# 11. SET COOLDOWN
scoreboard players set @s cd_30s 600