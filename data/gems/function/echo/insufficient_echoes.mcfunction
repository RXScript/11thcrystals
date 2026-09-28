# ==========================================
# FAILURE - PREMATURE COLLAPSE
# ==========================================

# WEAK VOID PULSE
execute as @e[tag=void_echo_marker] at @s run particle sculk_soul ~ ~1 ~ 0.5 0.5 0.5 0.15 40 force
execute as @e[tag=void_echo_marker] at @s run particle soul ~ ~1 ~ 1 1 1 0.2 80 force
execute as @e[tag=void_echo_marker] at @s run particle dust{color:[0.0,0.1,0.1],scale:1.5} ~ ~1 ~ 1 1 1 0.1 100 force

# HARSH SOUND
execute at @s run playsound block.sculk_shrieker.shriek master @a ~ ~ ~ 3 1.6
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1

# WEAK DAMAGE (only 7 HP)
execute as @e[tag=has_void_echo] run damage @s 7 indirect_magic by @p[tag=void_echoist]

# PUNISHMENT DEBUFFS (8 seconds)
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true

# Messages
title @s title [{"text":"⬥ ECHO COLLAPSE ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"The void screams in discord...","color":"dark_purple","italic":true}]

tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]
tellraw @s [{"text":"   ⬥ DISCORDANT RESONANCE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  Resonance: ","color":"gray"},{"score":{"name":"@s","objective":"resonance_level"},"color":"aqua"},{"text":"/80%","color":"gray"}]
tellraw @s [{"text":"  Echoes: ","color":"gray"},{"score":{"name":"@s","objective":"echo_count"},"color":"aqua"},{"text":"/4","color":"gray"}]
tellraw @s [{"text":"  Status: ","color":"gray"},{"text":"Frequencies Failed to Align","color":"red","italic":true}]
tellraw @s [{"text":"  Void Feedback: 7 HP","color":"dark_red"}]
tellraw @s [{"text":"  Instability: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_purple"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_purple"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]

# Cleanup & Reset
tag @s remove void_echoist
tag @s remove echo3_immune
tag @e remove has_void_echo
kill @e[tag=void_echo_marker]
scoreboard players reset @s echo_timer
scoreboard players reset @s echo_count
scoreboard players reset @s resonance_level
scoreboard players reset @s echo_detonated