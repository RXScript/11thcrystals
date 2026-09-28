# ==========================================
# THE FORTRESS STANDS
# ==========================================

# MASSIVE defensive aura
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 6 7 6 1 120 force
particle end_rod ~ ~1 ~ 5 6 5 0.5 80 force
particle firework ~ ~1 ~ 4 5 4 0.3 60 force

# Ground anchor particles
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~0.1 ~ 6 0.1 6 0.5 60 force
particle dust{color:[0.5,1.0,1.0],scale:1} ~ ~0.1 ~ 5 0.1 5 0.3 40 force

# Vertical anchor beam
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 0.3 20 0.3 0 100 force

# GRAVITY PULL - Pull enemies toward fortress
execute at @s as @e[distance=0.1..20,tag=!fortress_immune] unless entity @s[tag=fortress_target] run tag @s add fortress_target
execute at @s as @e[distance=0.1..20,tag=fortress_target] facing entity @p[tag=fortress_active] feet run tp @s ^ ^ ^0.1

# Pulling particles on enemies
execute at @s as @e[distance=0.1..20,tag=fortress_target] at @s run particle dust{color:[0.5,1.0,1.0],scale:3} ~ ~1 ~ 0.3 0.6 0.3 0.2 8 force
execute at @s as @e[distance=0.1..20,tag=fortress_target] at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 0.2 0.5 0.2 0.1 6 force

# ENFORCE IMMOBILITY - Cannot move from position
effect give @s slowness 2 255 true
effect clear @s levitation
effect clear @s slow_falling

# Force position lock (teleport back if moved)
execute store result score #current_x fortress_x run data get entity @s Pos[0] 100
execute store result score #current_y fortress_y run data get entity @s Pos[1] 100
execute store result score #current_z fortress_z run data get entity @s Pos[2] 100

# If position changed, snap back
execute unless score #current_x fortress_x = @s fortress_x run function gems:diamond/snap_position
execute unless score #current_y fortress_y = @s fortress_y run function gems:diamond/snap_position
execute unless score #current_z fortress_z = @s fortress_z run function gems:diamond/snap_position

# Display timer
execute if score @s fortress_timer matches 160.. run title @s actionbar [{"text":"⬥ FORTRESS: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"fortress_timer"}},{"text":" ticks","color":"yellow"},{"text":" | Hits: ","color":"gray"},{"score":{"name":"@s","objective":"fortress_hits"},"color":"red"}]
execute if score @s fortress_timer matches 80..159 run title @s actionbar [{"text":"⚠ FORTRESS: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"fortress_timer"},"color":"yellow"},{"text":" ticks | Hits: ","color":"gray"},{"score":{"name":"@s","objective":"fortress_hits"},"color":"red"}]
execute if score @s fortress_timer matches ..79 run title @s actionbar [{"text":"⚠ TIME LOW: ","color":"red","bold":true},{"score":{"name":"@s","objective":"fortress_timer"},"color":"red"},{"text":" ticks | Hits: ","color":"gray"},{"score":{"name":"@s","objective":"fortress_hits"},"color":"red"}]

# Ambient sound
execute if score @s fortress_timer matches 150 run playsound block.beacon.ambient master @s ~ ~ ~ 1 2
execute if score @s fortress_timer matches 100 run playsound block.beacon.ambient master @s ~ ~ ~ 1 2
execute if score @s fortress_timer matches 50 run playsound block.beacon.ambient master @s ~ ~ ~ 1.5 2
execute if score @s fortress_timer matches 20 run playsound block.beacon.ambient master @s ~ ~ ~ 2 2