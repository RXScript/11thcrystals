# ==========================================
# DRAIN LIFE FROM VICTIM - HEAL PLAYER
# ==========================================

# Estimate damage dealt (roughly 3 HP per hit, varies by weapon)
# 60% lifesteal = heal 2 HP per hit (rounded)
scoreboard players add @s grasp_healed 2
effect give @s instant_health 1 0 true

# LIFE DRAIN VISUALS - from victim to player
execute as @e[tag=grasp_victim,nbt={HurtTime:10s},limit=1,sort=nearest] at @s facing entity @p[tag=verdant_grasping] eyes run particle happy_villager ^ ^1 ^0.5 0.1 0.1 0.1 0 5 force
execute as @e[tag=grasp_victim,nbt={HurtTime:10s},limit=1,sort=nearest] at @s facing entity @p[tag=verdant_grasping] eyes run particle happy_villager ^ ^1 ^1 0.1 0.1 0.1 0 5 force
execute as @e[tag=grasp_victim,nbt={HurtTime:10s},limit=1,sort=nearest] at @s facing entity @p[tag=verdant_grasping] eyes run particle happy_villager ^ ^1 ^1.5 0.1 0.1 0.1 0 5 force
execute as @e[tag=grasp_victim,nbt={HurtTime:10s},limit=1,sort=nearest] at @s facing entity @p[tag=verdant_grasping] eyes run particle happy_villager ^ ^1 ^2 0.1 0.1 0.1 0 5 force

execute as @e[tag=grasp_victim,nbt={HurtTime:10s},limit=1,sort=nearest] at @s facing entity @p[tag=verdant_grasping] eyes run particle dust{color:[0.0,1.0,0.0],scale:2} ^ ^1 ^0.5 0.1 0.1 0.1 0 8 force
execute as @e[tag=grasp_victim,nbt={HurtTime:10s},limit=1,sort=nearest] at @s facing entity @p[tag=verdant_grasping] eyes run particle dust{color:[0.0,1.0,0.0],scale:2} ^ ^1 ^1 0.1 0.1 0.1 0 8 force
execute as @e[tag=grasp_victim,nbt={HurtTime:10s},limit=1,sort=nearest] at @s facing entity @p[tag=verdant_grasping] eyes run particle dust{color:[0.0,1.0,0.0],scale:2} ^ ^1 ^1.5 0.1 0.1 0.1 0 8 force

# Drain particles on victim
execute as @e[tag=grasp_victim,nbt={HurtTime:10s},limit=1,sort=nearest] at @s run particle dust{color:[0.0,0.5,0.0],scale:2} ~ ~1 ~ 0.5 0.8 0.5 0.3 20 force
execute as @e[tag=grasp_victim,nbt={HurtTime:10s},limit=1,sort=nearest] at @s run particle block{block_state:"minecraft:slime_block"} ~ ~1 ~ 0.5 0.8 0.5 0.5 15 force

# Healing particles on player
execute at @s run particle heart ~ ~1.5 ~ 0.8 0.5 0.8 0 5 force
execute at @s run particle happy_villager ~ ~1 ~ 0.8 0.8 0.8 0.3 20 force
execute at @s run particle dust{color:[0.0,1.0,0.0],scale:2} ~ ~1 ~ 0.8 0.8 0.8 0.3 15 force

# LIFE DRAIN SOUND
execute at @s run playsound entity.player.burp master @s ~ ~ ~ 1 2
execute at @s run playsound block.enchantment_table.use master @s ~ ~ ~ 1 2
execute at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1.5 2

# Feedback
title @s actionbar [{"text":"❤ DRAINED! ","color":"green","bold":true},{"text":"Total: ","color":"gray"},{"score":{"name":"@s","objective":"grasp_healed"},"color":"yellow"},{"text":" HP","color":"gray"}]