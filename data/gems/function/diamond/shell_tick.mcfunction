# ==========================================
# STONE SHELL ACTIVE - CRYSTALLINE DEFENSE
# ==========================================

# Diamond crystal shell particles
particle dust{color:[0.0,1.0,1.0],scale:3} ~ ~1 ~ 1.5 1.5 1.5 0.8 30 force
particle end_rod ~ ~1 ~ 1.2 1.2 1.2 0.1 15 force
particle block{block_state:"minecraft:diamond_block"} ~ ~1 ~ 1 1 1 0.5 20 force

# Hexagonal shield effect
particle dust{color:[0.5,1.0,1.0],scale:2} ~1.5 ~1 ~ 0.1 0.8 0.1 0 3 force
particle dust{color:[0.5,1.0,1.0],scale:2} ~-1.5 ~1 ~ 0.1 0.8 0.1 0 3 force
particle dust{color:[0.5,1.0,1.0],scale:2} ~ ~1 ~1.5 0.1 0.8 0.1 0 3 force
particle dust{color:[0.5,1.0,1.0],scale:2} ~ ~1 ~-1.5 0.1 0.8 0.1 0 3 force

# Crystalline sound
execute if score @s shell_timer matches 60 run playsound block.glass.hit master @a ~ ~ ~ 1 2
execute if score @s shell_timer matches 40 run playsound block.glass.hit master @a ~ ~ ~ 1 2
execute if score @s shell_timer matches 20 run playsound block.glass.hit master @a ~ ~ ~ 1.5 2

# Display status
execute if score @s shell_timer matches 40.. run title @s actionbar [{"text":"◈ SHELL: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"shell_timer"},"color":"green"},{"text":" ticks | Absorbed: ","color":"gray"},{"score":{"name":"@s","objective":"shell_absorbed"},"color":"yellow"}]
execute if score @s shell_timer matches 20..39 run title @s actionbar [{"text":"◈ SHELL: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"shell_timer"},"color":"yellow"},{"text":" ticks | Absorbed: ","color":"gray"},{"score":{"name":"@s","objective":"shell_absorbed"},"color":"yellow"}]
execute if score @s shell_timer matches ..19 run title @s actionbar [{"text":"⚠ SHELL: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"shell_timer"},"color":"red"},{"text":" ticks | Absorbed: ","color":"gray"},{"score":{"name":"@s","objective":"shell_absorbed"},"color":"yellow"}]

# Track damage absorbed (when HurtTime = 10, damage was just taken)
execute if entity @s[nbt={HurtTime:1s}] run function gems:diamond/damage_absorbed