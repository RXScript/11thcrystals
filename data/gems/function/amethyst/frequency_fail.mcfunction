# ==========================================
# FAILURE - MISSED WINDOW!
# ==========================================

# DISSIPATE VISUALS
execute at @s run particle smoke ~ ~1 ~ 2 2 2 0.3 80 force
execute at @s run particle dust{color:[0.3,0.0,0.6],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 60 force
execute at @s run particle block{block_state:"minecraft:amethyst_block"} ~ ~1 ~ 1 1 1 0.5 40 force

# DISSIPATE SOUND
execute at @s run playsound block.amethyst_block.break master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"♪ FREQUENCY FADED ♪","color":"dark_purple","bold":true}]
title @s subtitle [{"text":"Resonance dissipated","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]
tellraw @s [{"text":"  ♪ FREQUENCY LOST ♪","color":"dark_purple","bold":true}]
tellraw @s [{"text":"  You didn't strike in time!","color":"gray"}]
tellraw @s [{"text":"  Resonance faded away","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]

# Cleanup
tag @s remove frequency_charged
tag @s remove amethyst_immune
tag @e remove frequency_target
scoreboard players reset @s frequency_window
scoreboard players reset @s frequency_triggered