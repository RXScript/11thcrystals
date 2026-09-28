# Animate and cleanup the crying obsidian puddle
# Called every tick for puddle markers

# Count down timer
scoreboard players remove @s void_puddle_timer 1

# Wait period before starting shrink (first 60 ticks)
execute if score @s void_puddle_timer matches 50 run particle minecraft:portal ~ ~0.5 ~ 1 0.5 1 0.1 30 force
execute if score @s void_puddle_timer matches 50 run playsound minecraft:block.respawn_anchor.deplete ambient @a ~ ~ ~ 1 0.8

# Shrinking animation (ticks 40-5)
execute if score @s void_puddle_timer matches 40 as @e[type=block_display,tag=void_puddle,distance=..3] run data merge entity @s {transformation:{scale:[0.9f,0.18f,0.9f]}}
execute if score @s void_puddle_timer matches 35 as @e[type=block_display,tag=void_puddle,distance=..3] run data merge entity @s {transformation:{scale:[0.8f,0.16f,0.8f]}}
execute if score @s void_puddle_timer matches 30 as @e[type=block_display,tag=void_puddle,distance=..3] run data merge entity @s {transformation:{scale:[0.7f,0.14f,0.7f]}}
execute if score @s void_puddle_timer matches 25 as @e[type=block_display,tag=void_puddle,distance=..3] run data merge entity @s {transformation:{scale:[0.6f,0.12f,0.6f]}}
execute if score @s void_puddle_timer matches 20 as @e[type=block_display,tag=void_puddle,distance=..3] run data merge entity @s {transformation:{scale:[0.5f,0.1f,0.5f]}}
execute if score @s void_puddle_timer matches 15 as @e[type=block_display,tag=void_puddle,distance=..3] run data merge entity @s {transformation:{scale:[0.35f,0.07f,0.35f]}}
execute if score @s void_puddle_timer matches 10 as @e[type=block_display,tag=void_puddle,distance=..3] run data merge entity @s {transformation:{scale:[0.2f,0.04f,0.2f]}}
execute if score @s void_puddle_timer matches 5 as @e[type=block_display,tag=void_puddle,distance=..3] run data merge entity @s {transformation:{scale:[0.1f,0.02f,0.1f]}}

# Shrinking particles
execute if score @s void_puddle_timer matches 5..40 run particle minecraft:falling_obsidian_tear ~ ~0.1 ~ 0.5 0.1 0.5 0 2 force
execute if score @s void_puddle_timer matches 5..40 run particle minecraft:smoke ~ ~0.1 ~ 0.3 0.1 0.3 0.01 1 force

# Final effects when puddle disappears (tick 0)
execute if score @s void_puddle_timer matches 0 run function gems:void_banish/puddle_finale