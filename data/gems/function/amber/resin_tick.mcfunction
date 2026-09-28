# ==========================================
# RESIN ABSORBS ATTACKS
# ==========================================

# MASSIVE amber aura
particle dripping_dripstone_lava ~ ~1 ~ 6 7 6 1.5 20 force
particle dust{color:[1.0,0.7,0.0],scale:3} ~ ~1 ~ 5 6 5 1 100 force
particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 4 5 4 0.8 80 force
particle glow ~ ~1 ~ 3 4 3 0.3 60 force

# Ground amber circle
particle dripping_dripstone_lava ~ ~0.1 ~ 7 0.1 7 0.5 30 force
particle dust{color:[1.0,0.7,0.0],scale:2} ~ ~0.1 ~ 6 0.1 6 0.3 40 force

# Layers of resin building up (visual weight)
execute if score @s damage_stored matches 10.. run particle dripping_dripstone_lava ~ ~0.5 ~ 1 0.2 1 0.1 10 force
execute if score @s damage_stored matches 20.. run particle dripping_dripstone_lava ~ ~1 ~ 1 0.2 1 0.1 10 force
execute if score @s damage_stored matches 30.. run particle dripping_dripstone_lava ~ ~1.5 ~ 1 0.2 1 0.1 10 force
execute if score @s damage_stored matches 40.. run particle dripping_dripstone_lava ~ ~2 ~ 1 0.2 1 0.1 20 force
execute if score @s damage_stored matches 50.. run particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 1.5 1.5 1.5 0.5 40 force

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..20,tag=!resin_immune] unless entity @s[tag=resin_source] run tag @s add resin_source
execute at @s as @e[distance=0.1..20,tag=!resin_immune] unless entity @s[tag=resin_source] at @s run particle dripping_dripstone_lava ~ ~1 ~ 0.5 1 0.5 0.5 30 force

# Amber particles on marked sources
execute at @s as @e[distance=0.1..20,tag=resin_source] at @s run particle dripping_dripstone_lava ~ ~1 ~ 0.3 0.6 0.3 0.2 8 force
execute at @s as @e[distance=0.1..20,tag=resin_source] at @s run particle dust{color:[1.0,0.7,0.0],scale:1.5} ~ ~1.5 ~ 0.2 0.4 0.2 0.1 6 force

# Display progress
execute if score @s damage_stored matches ..39 if score @s resin_timer matches 100.. run title @s actionbar [{"text":"🍯 ABSORBING: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"resin_timer"},"color":"yellow"},{"text":" | Stored: ","color":"gray"},{"score":{"name":"@s","objective":"damage_stored"},"color":"gold"},{"text":"/40 HP","color":"gray"}]
execute if score @s damage_stored matches ..39 if score @s resin_timer matches 60..99 run title @s actionbar [{"text":"⚠ ABSORBING: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"resin_timer"},"color":"yellow"},{"text":" | Stored: ","color":"gray"},{"score":{"name":"@s","objective":"damage_stored"},"color":"gold"},{"text":"/40 HP","color":"gray"}]
execute if score @s damage_stored matches ..39 if score @s resin_timer matches ..59 run title @s actionbar [{"text":"⚠ LOW TIME: ","color":"red","bold":true},{"score":{"name":"@s","objective":"resin_timer"},"color":"red"},{"text":" | Stored: ","color":"gray"},{"score":{"name":"@s","objective":"damage_stored"},"color":"gold"},{"text":"/40 HP","color":"gray"}]
execute if score @s damage_stored matches 40.. run title @s actionbar [{"text":"✓ RELEASE READY: ","color":"green","bold":true},{"score":{"name":"@s","objective":"damage_stored"},"color":"yellow"},{"text":" HP stored!","color":"gray"}]

# Ambient sound
execute if score @s resin_timer matches 120 run playsound block.honey_block.step master @s ~ ~ ~ 1 0.5
execute if score @s resin_timer matches 80 run playsound block.honey_block.step master @s ~ ~ ~ 1 0.5
execute if score @s resin_timer matches 40 run playsound block.honey_block.step master @s ~ ~ ~ 1.5 0.5
execute if score @s resin_timer matches 20 run playsound block.honey_block.break master @s ~ ~ ~ 2 0.5
# Update health tracking every tick (not just when hit)
execute store result score @s health_current run data get entity @s Health 1

execute if score @s damage_stored matches 40.. run effect give @s instant_health 1 1 true

execute at @e[tag=resin_tank,limit=1] run tp @e[tag=amber_fossil,type=block_display] ~ ~ ~