# ==========================================
# THE MOUNTAIN STANDS
# ==========================================

# MASSIVE weight aura
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 6 7 6 1.5 75 force
particle smoke ~ ~1 ~ 5 6 5 1 60 force
particle large_smoke ~ ~1 ~ 4 5 4 0.8 50 force
particle lava ~ ~1 ~ 4 5 4 0.5 40 force
particle end_rod ~ ~1 ~ 3 4 3 0.3 60 force

# Weight settling into ground
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~0.2 ~ 1.5 0.1 1.5 0 40 force
particle smoke ~ ~0.5 ~ 2 0.2 2 0.1 30 force

# Ground gravity floor
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~0.1 ~ 7 0.1 7 0.5 60 force
particle lava ~ ~0.1 ~ 6 0.1 6 0.3 20 force

# Vertical weight pillar every 3 seconds
execute if score @s gravity_timer matches 140 run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 50 0.5 0 100 force
execute if score @s gravity_timer matches 140 run particle smoke ~ ~1 ~ 0.5 50 0.5 0 200 force
execute if score @s gravity_timer matches 140 run playsound block.anvil.land master @a ~ ~ ~ 2 0.5

execute if score @s gravity_timer matches 80 run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 50 0.5 0 100 force
execute if score @s gravity_timer matches 80 run playsound block.anvil.land master @a ~ ~ ~ 2 0.5

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..20,tag=!gravity4_immune] unless entity @s[tag=gravity_target] run tag @s add gravity_target
execute at @s as @e[distance=0.1..20,tag=!gravity4_immune] unless entity @s[tag=gravity_target] run scoreboard players set @s pulled_distance 0
execute at @s as @e[distance=0.1..20,tag=!gravity4_immune] unless entity @s[tag=gravity_target] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0.5 1 0.5 0.5 30 force

# Gravity particles on targets (pulling effect)
execute at @s as @e[distance=0.1..20,tag=gravity_target] at @s run particle smoke ~ ~1 ~ 0.3 0.6 0.3 0.2 5 force
execute at @s as @e[distance=0.1..20,tag=gravity_target] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1.5 ~ 0.2 0.4 0.2 0.1 4 force
execute at @s as @e[distance=0.1..20,tag=gravity_target] at @s run particle lava ~ ~1 ~ 0.2 0.5 0.2 0.05 3 force

# Visual lines pulling toward gravity well
execute at @s as @e[distance=0.1..20,tag=gravity_target] at @s facing entity @p[tag=gravity_well] feet run particle smoke ^ ^ ^1 0.1 0.1 0.1 0 2 force
execute at @s as @e[distance=0.1..20,tag=gravity_target] at @s facing entity @p[tag=gravity_well] feet run particle smoke ^ ^ ^2 0.1 0.1 0.1 0 2 force

# Count enemies within 5 blocks (pulled close enough)
execute at @s store result score @s gravity_pulled if entity @e[distance=0.1..5,tag=gravity_target]

# Display progress
execute if score @s gravity_pulled matches ..5 if score @s gravity_timer matches 100.. run title @s actionbar [{"text":"⚓ GRAVITY: ","color":"black","bold":true},{"score":{"name":"@s","objective":"gravity_timer"},"color":"yellow"},{"text":" | Pulled: ","color":"gray"},{"score":{"name":"@s","objective":"gravity_pulled"},"color":"dark_gray"},{"text":"/6","color":"gray"}]
execute if score @s gravity_pulled matches ..5 if score @s gravity_timer matches 60..99 run title @s actionbar [{"text":"⚠ GRAVITY: ","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"gravity_timer"},"color":"yellow"},{"text":" | Pulled: ","color":"gray"},{"score":{"name":"@s","objective":"gravity_pulled"},"color":"dark_gray"},{"text":"/6","color":"gray"}]
execute if score @s gravity_pulled matches ..5 if score @s gravity_timer matches ..59 run title @s actionbar [{"text":"⚠ COLLAPSING: ","color":"red","bold":true},{"score":{"name":"@s","objective":"gravity_timer"},"color":"red"},{"text":" | Pulled: ","color":"gray"},{"score":{"name":"@s","objective":"gravity_pulled"},"color":"dark_gray"},{"text":"/6","color":"gray"}]
execute if score @s gravity_pulled matches 6.. run title @s actionbar [{"text":"✓ COLLAPSE READY: ","color":"green","bold":true},{"score":{"name":"@s","objective":"gravity_pulled"},"color":"yellow"},{"text":" pulled!","color":"gray"}]

# Ambient sound (heavy weight)
execute if score @s gravity_timer matches 120 run playsound block.anvil.use master @s ~ ~ ~ 1 0.5
execute if score @s gravity_timer matches 80 run playsound block.anvil.use master @s ~ ~ ~ 1.5 0.5
execute if score @s gravity_timer matches 40 run playsound entity.warden.heartbeat master @s ~ ~ ~ 2 0.5
execute if score @s gravity_timer matches 20 run playsound entity.warden.angry master @s ~ ~ ~ 2 0.5

execute if score @s gravity_pulled matches 6.. run effect give @s instant_health 1 1 true