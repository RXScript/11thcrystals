# ==========================================
# FAILURE - PREMATURE COLLAPSE
# ==========================================

# WEAK VOID PULSE
execute as @e[tag=void_echo_marker] at @s run particle smoke ~ ~1 ~ 1 1 1 0.3 50 force
execute as @e[tag=void_echo_marker] at @s run particle soul ~ ~1 ~ 1 1 1 0.2 80 force

# HARSH SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# WEAK DAMAGE (11 HP)
execute as @e[tag=has_void_echo] run damage @s 11 indirect_magic by @p[tag=void_echoist]

# PUNISHMENT DEBUFFS
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true

# Messages
title @s title [{"text":"⬥ TOO EARLY ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Insufficient resonance!","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ PREMATURE COLLAPSE ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Resonance: ","color":"gray"},{"score":{"name":"@s","objective":"resonance_level"},"color":"yellow"},{"text":"/80%","color":"gray"}]
tellraw @s [{"text":"  You collapsed too early!","color":"red"}]
tellraw @s [{"text":"  Weak Damage: 11 HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove void_echoist
tag @s remove echo3_immune
tag @e remove has_void_echo
kill @e[tag=void_echo_marker]
scoreboard players reset @s echo_timer
scoreboard players reset @s echo_count
scoreboard players reset @s resonance_level
scoreboard players reset @s echo_detonated