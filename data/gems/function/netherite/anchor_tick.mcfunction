# ==========================================
# ANCHOR POINT ACTIVE - IMMOVABLE
# ==========================================

# Heavy anchor particles
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 2 2 2 1 20 force
particle falling_obsidian_tear ~ ~1 ~ 1.5 1.5 1.5 0.3 15 force
particle dust{color:[0.2,0.2,0.2],scale:3} ~ ~1 ~ 2 2 2 0.5 10 force
particle lava ~ ~0.5 ~ 1 0.5 1 0 5 force

# Gravitational field rings (pulsing)
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~0.1 ~ 3 0.1 3 0 25 force
particle falling_obsidian_tear ~ ~0.1 ~ 2.5 0.1 2.5 0 20 force
particle dust{color:[0.2,0.2,0.2],scale:4} ~ ~0.1 ~ 3 0.1 3 0 15 force

# Show gravitational pull lines to enemies
execute at @s as @e[distance=0.1..20,tag=mass_affected] at @s facing entity @p[tag=anchor_point] feet run particle falling_obsidian_tear ^ ^1 ^0.5 0.1 0.1 0.1 0 2 force
execute at @s as @e[distance=0.1..20,tag=mass_affected] at @s facing entity @p[tag=anchor_point] feet run particle falling_obsidian_tear ^ ^1 ^1 0.1 0.1 0.1 0 2 force

# Display pull count
execute if score @s pulled_count matches ..3 run title @s actionbar [{"text":"⬥ PULLING: ","color":"red","bold":true},{"score":{"name":"@s","objective":"pulled_count"},"color":"yellow"},{"text":"/4 | ","color":"gray"},{"score":{"name":"@s","objective":"anchor_timer"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s pulled_count matches 4.. run title @s actionbar [{"text":"✓ MASS READY: ","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"pulled_count"},"color":"gold"},{"text":" pulled!","color":"gray"}]

# Sound feedback
execute if score @s anchor_timer matches 60 run playsound block.anvil.land master @s ~ ~ ~ 1 0.8
execute if score @s anchor_timer matches 40 run playsound block.anvil.land master @s ~ ~ ~ 1.5 0.8
execute if score @s anchor_timer matches 20 run playsound block.anvil.land master @s ~ ~ ~ 2 0.8
execute if score @s anchor_timer matches 10 run playsound entity.warden.heartbeat master @s ~ ~ ~ 2 1