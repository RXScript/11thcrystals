# ==========================================
# PARTIAL - DECENT RESONANCE
# ==========================================

# MEDIUM VOID BLAST
execute as @e[tag=void_echo_marker] at @s run particle explosion ~ ~1 ~ 2 2 2 0 40 force
execute as @e[tag=void_echo_marker] at @s run particle soul ~ ~1 ~ 2 2 2 0.5 200 force
execute as @e[tag=void_echo_marker] at @s run particle sculk_charge{roll:3.0} ~ ~1 ~ 1 1 1 0 100 force

# SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 2 1.5
execute at @s run playsound particle.soul_escape master @a ~ ~ ~ 2 1

# MEDIUM DAMAGE (23 HP)
execute as @e[tag=has_void_echo] run damage @s 23 indirect_magic by @p[tag=void_echoist]

# MINOR BUFFS
effect give @s speed 8 1 true
effect give @s invisibility 5 0 true

# Messages
title @s title [{"text":"⬥ PARTIAL COLLAPSE ⬥","color":"light_purple","bold":true}]
title @s subtitle [{"text":"Good resonance","color":"dark_purple"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @s [{"text":"   ⬥ PARTIAL COLLAPSE ⬥","color":"light_purple","bold":true}]
tellraw @s [{"text":"  Resonance: ","color":"gray"},{"score":{"name":"@s","objective":"resonance_level"},"color":"yellow"},{"text":"%","color":"gray"}]
tellraw @s [{"text":"  Damage: 23 HP","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]

# Cleanup
tag @s remove void_echoist
tag @s remove echo3_immune
tag @e remove has_void_echo
kill @e[tag=void_echo_marker]
scoreboard players reset @s echo_timer
scoreboard players reset @s echo_count
scoreboard players reset @s resonance_level
scoreboard players reset @s echo_detonated