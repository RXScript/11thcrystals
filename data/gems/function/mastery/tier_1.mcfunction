# Core burst (The main impact)
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.1 100
execute at @s run particle minecraft:effect ~ ~1 ~ 10 10 10 0 1

# Soul energy release (The "Ominous" trial theme)
execute at @s run particle minecraft:soul_fire_flame ~ ~1 ~ 0.2 0.5 0.2 0.05 40
execute at @s run particle minecraft:trial_spawner_detection ~ ~1 ~ 0.3 0.3 0.3 0.1 15

# Lingering magic aura
execute at @s run particle minecraft:enchant ~ ~1 ~ 0.5 0.5 0.5 1 50

# The "Chime" (Success)
execute at @s run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1 0.5

# The "Bass" (Power)
execute at @s run playsound minecraft:entity.warden.heartbeat player @a ~ ~ ~ 1 0.8

# The "Shatter" (Consumption)
execute at @s run playsound minecraft:block.amethyst_block.break player @a ~ ~ ~ 1 0.5

# The "Ominous" Vibe
execute at @s run playsound minecraft:block.trial_spawner.spawn_item player @a ~ ~ ~ 1 1.2

# 1. Feedback effects
tellraw @s {"text":"Sigil consumed. +10 Mastery","color":"gold"}


# 2. Add the mastery points (Ensure the 'mastery' objective exists!)
# Run '/scoreboard objectives add mastery dummy' once in-game if you haven't.
scoreboard players add @s mastery 10
clear @s carrot_on_a_stick[custom_data={masteryitem:1}] 1