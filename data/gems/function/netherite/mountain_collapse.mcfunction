# ==========================================
# SUCCESS - MOUNTAIN COLLAPSE!
# ==========================================

# MASSIVE IMPLOSION
particle explosion_emitter ~ ~1 ~ 0 0 0 0 100 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 20 force
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 0 0 0 5 2000 force
particle falling_obsidian_tear ~ ~1 ~ 0 0 0 10 1500 force
particle dust{color:[0.2,0.2,0.2],scale:4} ~ ~1 ~ 0 0 0 3 2000 force
particle lava ~ ~1 ~ 10 10 10 2 500 force

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 3 0.5

# Messages
title @s title [{"text":"⬥ COLLAPSE ⬥","color":"dark_gray","bold":true}]
title @s subtitle [{"text":"Inevitable!","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @s [{"text":"   ⬥ MOUNTAIN COLLAPSE ⬥","color":"dark_gray","bold":true}]
tellraw @s [{"text":"  Enemies Pulled: ","color":"gray"},{"score":{"name":"@s","objective":"pulled_count"},"color":"gold"}]
tellraw @s [{"text":"  Collapse Damage: 40 HP","color":"red"}]
tellraw @s [{"text":"  • Resistance III (12s)","color":"green"}]
tellraw @s [{"text":"  • Absorption V (12s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# DAMAGE (40 HP - crushing weight)
execute at @s as @e[distance=0.1..8,tag=mass_affected] run damage @s 40 falling_stalactite by @p[tag=anchor_point]

# CRUSHING DOWNWARD FORCE
execute at @s as @e[distance=0.1..8,tag=mass_affected] run effect give @s levitation 2 2 true
execute at @s as @e[distance=0.1..8,tag=mass_affected] run effect give @s slowness 10 4 true
execute at @s as @e[distance=0.1..8,tag=mass_affected] run effect give @s weakness 10 2 true

# Explosion visuals on pulled enemies
execute at @s as @e[distance=0.1..8,tag=mass_affected] at @s run particle explosion ~ ~1 ~ 3 3 3 0 40 force
execute at @s as @e[distance=0.1..8,tag=mass_affected] at @s run particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 2 2 2 1 300 force
execute at @s as @e[distance=0.1..8,tag=mass_affected] at @s run particle falling_obsidian_tear ~ ~1 ~ 2 2 2 1 200 force

# BUFFS (mountain defense)
effect give @s resistance 12 2 true
effect give @s absorption 12 4 true
effect give @s regeneration 12 1 true
effect give @s strength 12 1 true

# Cleanup
tag @s remove anchor_point
tag @s remove netherite_immune
tag @e remove mass_affected
scoreboard players reset @e pulled_distance
scoreboard players reset @s anchor_timer
scoreboard players reset @s pulled_count
scoreboard players reset @s anchor_x
scoreboard players reset @s anchor_y
scoreboard players reset @s anchor_z