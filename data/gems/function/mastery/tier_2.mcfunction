# The "Crush" (Mace/Heavy Core sound)
execute at @s run playsound minecraft:item.mace.smash_ground player @a ~ ~ ~ 1 0.7

# The "Metallic Clang" (Netherite theme)
execute at @s run playsound minecraft:block.anvil.land player @a ~ ~ ~ 0.5 1.2

# The "Golden Surge" (Enchanted Apple theme)
execute at @s run playsound minecraft:entity.player.levelup player @a ~ ~ ~ 0.8 0.5

# The "Deep Boom"
execute at @s run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 0.6 0.2

# The "Compression Blast"
execute at @s run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1

# Metallic Sparks and Heavy Smoke
execute at @s run particle minecraft:electric_spark ~ ~1 ~ 0.5 0.5 0.5 0.1 50
execute at @s run particle minecraft:large_smoke ~ ~1 ~ 0.3 0.3 0.3 0.05 30

# The Golden Essence
execute at @s run particle minecraft:dust{color:[1.0, 0.84, 0.0], scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 1 100

# Shockwave (Trial Spawner style)
execute at @s run particle minecraft:trial_spawner_detection ~ ~1 ~ 1 0.1 1 0.1 40

# 1. Feedback effects
tellraw @s {"text":"Core consumed. +50 Mastery","color":"aqua"}

# 2. Add the mastery points (Ensure the 'mastery' objective exists!)
# Run '/scoreboard objectives add mastery dummy' once in-game if you haven't.
scoreboard players add @s mastery 50
clear @s carrot_on_a_stick[custom_data={masteryitem:2}] 1