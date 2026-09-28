# ==========================================
# EXECUTE THE SLAM - CRUSH THEM DOWN!
# ==========================================

# MASSIVE CRUSHING SLAM EXPLOSION
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 40 force
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle dust{color:[0.2,0.2,0.2],scale:4} ~ ~1 ~ 0 0 0 3 1000 force
execute at @s run particle block{block_state:"minecraft:netherite_block"} ~ ~1 ~ 0 0 0 3 800 force
execute at @s run particle smoke ~ ~1 ~ 0 0 0 5 600 force
execute at @s run particle lava ~ ~1 ~ 3 3 3 1 400 force

# Ground impact waves
execute at @s run particle dust{color:[0.3,0.3,0.3],scale:4} ~ ~0.1 ~ 1 0.1 1 0 100 force
execute at @s run particle dust{color:[0.3,0.3,0.3],scale:4} ~ ~0.1 ~ 2 0.1 2 0 150 force
execute at @s run particle dust{color:[0.3,0.3,0.3],scale:4} ~ ~0.1 ~ 3 0.1 3 0 200 force
execute at @s run particle dust{color:[0.3,0.3,0.3],scale:4} ~ ~0.1 ~ 4 0.1 4 0 250 force

# Crater effect
execute at @s run particle block{block_state:"minecraft:stone"} ~ ~0.1 ~ 3 0.1 3 1 300 force
execute at @s run particle block{block_state:"minecraft:deepslate"} ~ ~0.1 ~ 2.5 0.1 2.5 1 200 force

# SLAM SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.iron_golem.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 3 0.8

# Messages
title @s title [{"text":"⬥ CRUSHED! ⬥","color":"dark_gray","bold":true}]
title @s subtitle [{"text":"Inevitable impact","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @s [{"text":"   ⬥ CRUSHING SLAM ⬥","color":"dark_gray","bold":true}]
tellraw @s [{"text":"  Slam Damage: 16 HP","color":"red"}]
tellraw @s [{"text":"  Ground Duration: 3s","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# SLAM DAMAGE (16 HP - crushing force)
execute as @e[tag=grasp_victim,limit=1] run damage @s 16 mace_smash by @p[tag=crushing_grasper]

# Slam visuals on victim
execute as @e[tag=grasp_victim,limit=1] at @s run particle explosion ~ ~1 ~ 2 2 2 0 40 force
execute as @e[tag=grasp_victim,limit=1] at @s run particle block{block_state:"minecraft:netherite_block"} ~ ~1 ~ 2 2 2 1.5 300 force
execute as @e[tag=grasp_victim,limit=1] at @s run particle dust{color:[0.2,0.2,0.2],scale:4} ~ ~1 ~ 2 2 2 1 250 force
execute as @e[tag=grasp_victim,limit=1] at @s run particle lava ~ ~1 ~ 1.5 1.5 1.5 0.5 150 force

# GROUND EFFECT (3 seconds - crushed into ground)
execute as @e[tag=grasp_victim,limit=1] run effect give @s slowness 3 4 true
execute as @e[tag=grasp_victim,limit=1] run effect give @s mining_fatigue 3 3 true
execute as @e[tag=grasp_victim,limit=1] run effect give @s weakness 3 2 true
execute as @e[tag=grasp_victim,limit=1] run effect give @s glowing 3 0 true

# Gravity effect visualization on victim
execute as @e[tag=grasp_victim,limit=1] at @s run particle dust{color:[0.3,0.3,0.3],scale:3} ~ ~2 ~ 0.8 0.3 0.8 0.5 80 force
execute as @e[tag=grasp_victim,limit=1] at @s run particle falling_lava ~ ~2 ~ 0.5 0.2 0.5 0.5 40 force

# Crushed into ground visuals
execute as @e[tag=grasp_victim,limit=1] at @s run particle dust{color:[0.2,0.2,0.2],scale:2} ~ ~0.1 ~ 1.5 0.1 1.5 0 60 force
execute as @e[tag=grasp_victim,limit=1] at @s run particle block{block_state:"minecraft:stone"} ~ ~0.1 ~ 1.2 0.1 1.2 0.5 40 force

# Cleanup
tag @s remove crushing_grasper
tag @s remove netherite2_immune
tag @e remove grasp_victim
scoreboard players reset @s grasp_timer