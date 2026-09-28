# ==========================================
# THE RESONANCE BUILDS
# ==========================================

# MASSIVE sonic/crystal aura
particle sculk_soul ~ ~1 ~ 6 7 6 1.5 150 force
particle block{block_state:{Name:"minecraft:amethyst_block"}} ~ ~1 ~ 5 6 5 1 100 force
particle note ~ ~1 ~ 4 5 4 0.8 80 force
particle end_rod ~ ~1 ~ 3 4 3 0.3 60 force

# Ground resonance circle
particle block{block_state:{Name:"minecraft:amethyst_block"}} ~ ~0.1 ~ 7 0.1 7 0.5 60 force
particle note ~ ~0.1 ~ 6 0.1 6 0.3 40 force

# Vertical sound wave every 2 seconds
execute if score @s resonance4_timer matches 140 run particle sculk_soul ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s resonance4_timer matches 140 run particle sonic_boom ~ ~1 ~ 0 0 0 0 5 force
execute if score @s resonance4_timer matches 140 run playsound block.amethyst_block.chime master @a ~ ~ ~ 2 1.5

execute if score @s resonance4_timer matches 100 run particle sculk_soul ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s resonance4_timer matches 100 run playsound block.amethyst_block.chime master @a ~ ~ ~ 2 1.5

execute if score @s resonance4_timer matches 60 run particle sculk_soul ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s resonance4_timer matches 60 run playsound block.amethyst_block.chime master @a ~ ~ ~ 2 1.5

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..20,tag=!resonance_immune] unless entity @s[tag=resonance_marked] run tag @s add resonance_marked
execute at @s as @e[distance=0.1..20,tag=!resonance_immune] unless entity @s[tag=resonance_marked] at @s run particle sculk_soul ~ ~1 ~ 0.5 1 0.5 0.5 60 force

# Resonance particles on marked targets
execute at @s as @e[distance=0.1..20,tag=resonance_marked] at @s run particle sculk_soul ~ ~1 ~ 0.3 0.6 0.3 0.2 10 force
execute at @s as @e[distance=0.1..20,tag=resonance_marked] at @s run particle note ~ ~1.5 ~ 0.2 0.4 0.2 0.1 8 force
execute at @s as @e[distance=0.1..20,tag=resonance_marked] at @s run particle block{block_state:{Name:"minecraft:amethyst_block"}} ~ ~1 ~ 0.2 0.5 0.2 0.05 6 force

# Display progress with rhythm status
execute if score @s rhythm_cooldown matches 1.. run title @s actionbar [{"text":"⬥ RHYTHM: ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"resonance4_timer"},"color":"yellow"},{"text":" | Stacks: ","color":"gray"},{"score":{"name":"@s","objective":"resonance4_stacks"},"color":"light_purple"},{"text":"/6 | ","color":"gray"},{"text":"⏳ WAIT","color":"red","bold":true}]
execute if score @s rhythm_cooldown matches ..0 if score @s resonance4_timer matches 100.. run title @s actionbar [{"text":"⬥ RHYTHM: ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"resonance4_timer"},"color":"yellow"},{"text":" | Stacks: ","color":"gray"},{"score":{"name":"@s","objective":"resonance4_stacks"},"color":"light_purple"},{"text":"/6 | ","color":"gray"},{"text":"✓ READY","color":"green","bold":true}]
execute if score @s rhythm_cooldown matches ..0 if score @s resonance4_timer matches 60..99 run title @s actionbar [{"text":"⚠ RHYTHM: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"resonance4_timer"},"color":"yellow"},{"text":" | Stacks: ","color":"gray"},{"score":{"name":"@s","objective":"resonance4_stacks"},"color":"light_purple"},{"text":"/6 | ","color":"gray"},{"text":"✓ READY","color":"green","bold":true}]
execute if score @s rhythm_cooldown matches ..0 if score @s resonance4_timer matches ..59 run title @s actionbar [{"text":"⚠ TIME LOW: ","color":"red","bold":true},{"score":{"name":"@s","objective":"resonance4_timer"},"color":"red"},{"text":" | Stacks: ","color":"gray"},{"score":{"name":"@s","objective":"resonance4_stacks"},"color":"light_purple"},{"text":"/6 | ","color":"gray"},{"text":"✓ READY","color":"green","bold":true}]

# Ambient sound
execute if score @s resonance4_timer matches 120 run playsound block.amethyst_cluster.step master @s ~ ~ ~ 1 1.5
execute if score @s resonance4_timer matches 80 run playsound block.amethyst_cluster.step master @s ~ ~ ~ 1 1.5
execute if score @s resonance4_timer matches 40 run playsound block.amethyst_cluster.step master @s ~ ~ ~ 1.5 1.5
execute if score @s resonance4_timer matches 20 run playsound block.amethyst_cluster.step master @s ~ ~ ~ 2 2

execute if score @s rhythm_broken matches 0 if score @s resonance4_stacks matches 6.. run effect give @s instant_health 1 1 true