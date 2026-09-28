# ==========================================
# SUCCESS - VOID COLLAPSE!
# ==========================================

# MASSIVE VOID IMPLOSION at each echo
execute as @e[tag=void_echo_marker] at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 30 force
execute as @e[tag=void_echo_marker] at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute as @e[tag=void_echo_marker] at @s run particle soul ~ ~1 ~ 0 0 0 5 500 force
execute as @e[tag=void_echo_marker] at @s run particle sculk_charge{roll:10.0} ~ ~1 ~ 0 0 0 3 300 force
execute as @e[tag=void_echo_marker] at @s run particle dust{color:[0.3,0.0,0.5],scale:4} ~ ~1 ~ 0 0 0 3 400 force
execute as @e[tag=void_echo_marker] at @s run particle reverse_portal ~ ~1 ~ 0 0 0 3 200 force

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 3 0.5
execute at @s run playsound particle.soul_escape master @a ~ ~ ~ 3 0.5

# Messages
title @s title [{"text":"⬥ VOID COLLAPSE ⬥","color":"dark_purple","bold":true}]
title @s subtitle [{"text":"Peak resonance!","color":"light_purple"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]
tellraw @s [{"text":"   ⬥ VOID COLLAPSE ⬥","color":"dark_purple","bold":true}]
tellraw @s [{"text":"  Resonance: ","color":"gray"},{"score":{"name":"@s","objective":"resonance_level"},"color":"gold"},{"text":"%","color":"gray"}]
tellraw @s [{"text":"  Echoes: ","color":"gray"},{"score":{"name":"@s","objective":"echo_count"},"color":"light_purple"}]
tellraw @s [{"text":"  Void Damage: 35 HP","color":"red"}]
tellraw @s [{"text":"  • Speed III (10s)","color":"green"}]
tellraw @s [{"text":"  • Invisibility (10s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]

# DAMAGE (35 HP)
execute as @e[tag=has_void_echo] run damage @s 35 indirect_magic by @p[tag=void_echoist]

# VOID PULL - Suck enemies toward their echo
execute as @e[tag=void_echo_marker] at @s as @e[tag=has_void_echo,distance=..3] at @s facing entity @e[tag=void_echo_marker,limit=1,sort=nearest] feet run tp @s ^ ^ ^3
execute as @e[tag=has_void_echo] run effect give @s slowness 8 3 true
execute as @e[tag=has_void_echo] run effect give @s darkness 8 0 true

# BUFFS (void walker)
effect give @s speed 10 2 true
effect give @s invisibility 10 0 true
effect give @s night_vision 10 0 true
effect give @s regeneration 10 0 true

# Cleanup
tag @s remove void_echoist
tag @s remove echo3_immune
tag @e remove has_void_echo
kill @e[tag=void_echo_marker]
scoreboard players reset @s echo_timer
scoreboard players reset @s echo_count
scoreboard players reset @s resonance_level
scoreboard players reset @s echo_detonated