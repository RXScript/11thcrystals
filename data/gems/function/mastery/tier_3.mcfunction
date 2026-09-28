# --- 1. SOUNDS ---
execute at @s run playsound minecraft:entity.ender_dragon.growl player @a ~ ~ ~ 1 0.5
execute at @s run playsound minecraft:block.beacon.activate player @a ~ ~ ~ 1 1.5
execute at @s run playsound minecraft:entity.wither.spawn player @a ~ ~ ~ 0.7 0.5
execute at @s run playsound minecraft:block.amethyst_block.chime player @a ~ ~ ~ 1 0.1

# --- 2. PARTICLES ---
execute at @s run particle minecraft:large_smoke ~ ~1 ~ 1 1 1 0.05 100
execute at @s run particle minecraft:dragon_breath ~ ~1 ~ 0.5 0.5 0.5 0.1 80
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 1 1 1 0.1 200
# FIXED DUST SYNTAX: color is space-separated 0.5 0 0
execute at @s run particle minecraft:dust_plume ~ ~1 ~ 1 1 1 0.05 150
execute at @s run particle minecraft:effect ~ ~1 ~ 10 10 10 0 2

# --- 3. LOGIC ---
scoreboard players add @s mastery 100
clear @s carrot_on_a_stick[custom_data={masteryitem:3}] 1

# --- 4. FEEDBACK ---
tellraw @s {"text":"Sovereign consumed. +100 Mastery","color":"dark_red"}