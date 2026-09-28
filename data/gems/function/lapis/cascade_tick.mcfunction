# ==========================================
# THE ARCANE FLOWS
# ==========================================

# MASSIVE arcane aura
particle enchant ~ ~1 ~ 6 7 6 1.5 150 force
particle portal ~ ~1 ~ 5 6 5 1 100 force
particle block{block_state:{Name:"minecraft:lapis_block"}} ~ ~1 ~ 5 6 5 1 80 force
particle dragon_breath ~ ~1 ~ 4 5 4 0.5 60 force
particle glow ~ ~1 ~ 3 4 3 0.3 40 force

# Ground arcane circle
particle enchant ~ ~0.1 ~ 7 0.1 7 0.5 60 force
particle block{block_state:{Name:"minecraft:lapis_block"}} ~ ~0.1 ~ 6 0.1 6 0.3 40 force

# Vertical arcane beam every 3 seconds
execute if score @s cascade_timer matches 140 run particle enchant ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s cascade_timer matches 140 run particle portal ~ ~1 ~ 0.5 50 0.5 0 600 force
execute if score @s cascade_timer matches 140 run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1.5

execute if score @s cascade_timer matches 80 run particle enchant ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s cascade_timer matches 80 run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1.5

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..20,tag=!cascade_immune] unless entity @s[tag=cascade_marked] run tag @s add cascade_marked
execute at @s as @e[distance=0.1..20,tag=!cascade_immune] unless entity @s[tag=cascade_marked] at @s run particle enchant ~ ~1 ~ 0.5 1 0.5 0.5 60 force
execute at @s as @e[distance=0.1..20,tag=!cascade_immune] unless entity @s[tag=cascade_marked] run scoreboard players set @s cascade_hit_by_player 0

# Arcane particles on marked targets
execute at @s as @e[distance=0.1..20,tag=cascade_marked] at @s run particle enchant ~ ~1 ~ 0.3 0.6 0.3 0.2 10 force
execute at @s as @e[distance=0.1..20,tag=cascade_marked] at @s run particle portal ~ ~1.5 ~ 0.2 0.4 0.2 0.1 8 force
execute at @s as @e[distance=0.1..20,tag=cascade_marked] at @s run particle glow ~ ~2 ~ 0.2 0.2 0.2 0.05 6 force

# Different colored particles for already-hit targets (warning)
execute at @s as @e[distance=0.1..20,tag=cascade_marked,scores={cascade_hit_by_player=1..}] at @s run particle dust{color:[1.0,0.0,0.0],scale:1} ~ ~1 ~ 0.4 0.8 0.4 0.2 15 force

# Display progress
execute if score @s cascade_failed matches 0 if score @s cascade_timer matches 120.. run title @s actionbar [{"text":"⬥ CASCADE: ","color":"dark_blue","bold":true},{"score":{"name":"@s","objective":"cascade_timer"},"color":"yellow"},{"text":" | Targets: ","color":"gray"},{"score":{"name":"@s","objective":"cascade_targets_hit"},"color":"blue"},{"text":"/5","color":"gray"}]
execute if score @s cascade_failed matches 0 if score @s cascade_timer matches 60..119 run title @s actionbar [{"text":"⚠ CASCADE: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"cascade_timer"},"color":"yellow"},{"text":" | Targets: ","color":"gray"},{"score":{"name":"@s","objective":"cascade_targets_hit"},"color":"blue"},{"text":"/5","color":"gray"}]
execute if score @s cascade_failed matches 0 if score @s cascade_timer matches ..59 run title @s actionbar [{"text":"⚠ TIME LOW: ","color":"red","bold":true},{"score":{"name":"@s","objective":"cascade_timer"},"color":"red"},{"text":" | Targets: ","color":"gray"},{"score":{"name":"@s","objective":"cascade_targets_hit"},"color":"blue"},{"text":"/5","color":"gray"}]
execute if score @s cascade_failed matches 1 run title @s actionbar [{"text":"⚠ FAILED: ","color":"red","bold":true},{"text":"Hit same target twice!","color":"dark_red"}]

# Ambient sound
execute if score @s cascade_timer matches 150 run playsound block.enchantment_table.use master @s ~ ~ ~ 1 1.5
execute if score @s cascade_timer matches 100 run playsound block.enchantment_table.use master @s ~ ~ ~ 1 1.5
execute if score @s cascade_timer matches 50 run playsound block.enchantment_table.use master @s ~ ~ ~ 1.5 1.5
execute if score @s cascade_timer matches 20 run playsound block.enchantment_table.use master @s ~ ~ ~ 2 2

execute if score @s cascade_failed matches 0 if score @s cascade_targets_hit matches 5.. run effect give @s instant_health 1 1 true