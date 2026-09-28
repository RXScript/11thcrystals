# ==========================================
# CHECK RHYTHM TIMING
# ==========================================

# If rhythm already broken, ignore
execute if score @s rhythm_broken matches 1 run return fail

# If on cooldown (hit too fast), BREAK RHYTHM
execute if score @s rhythm_cooldown matches 1.. run function gems:amethyst/break_rhythm
execute if score @s rhythm_cooldown matches 1.. run return fail

# PERFECT HIT - Add resonance stack
scoreboard players add @s resonance4_stacks 1

# Set rhythm cooldown (20 ticks = 1 second)
scoreboard players set @s rhythm_cooldown 20

# MASSIVE visual feedback
execute at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle sculk_soul ~ ~1 ~ 1 1 1 1 100 force
execute at @s run particle block{block_state:{Name:"minecraft:amethyst_block"}} ~ ~1 ~ 0.8 0.8 0.8 0.8 80 force
execute at @s run particle note ~ ~1 ~ 0.6 0.6 0.6 0.5 60 force
execute at @s run particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.3 40 force

# Sound - Musical notes ascending with stacks
execute if score @s resonance4_stacks matches 1 run playsound block.note_block.chime master @a ~ ~ ~ 2 0.5
execute if score @s resonance4_stacks matches 2 run playsound block.note_block.chime master @a ~ ~ ~ 2 0.7
execute if score @s resonance4_stacks matches 3 run playsound block.note_block.chime master @a ~ ~ ~ 2 0.9
execute if score @s resonance4_stacks matches 4 run playsound block.note_block.chime master @a ~ ~ ~ 2 1.1
execute if score @s resonance4_stacks matches 5 run playsound block.note_block.chime master @a ~ ~ ~ 2 1.3
execute if score @s resonance4_stacks matches 6.. run playsound block.note_block.chime master @a ~ ~ ~ 2 1.5

execute at @s run playsound block.amethyst_block.hit master @a ~ ~ ~ 2 1.5
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1.5 2

# Feedback
title @s actionbar [{"text":"✓ PERFECT: ","color":"green","bold":true},{"score":{"name":"@s","objective":"resonance4_stacks"},"color":"light_purple"},{"text":"/6","color":"gray"}]