# ==========================================
# SUCCESS - SILENCE DETONATES
# ==========================================

# CATASTROPHIC DARKNESS EXPLOSION
particle explosion_emitter ~ ~1 ~ 20 20 20 0 400 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 60 force
particle squid_ink ~ ~1 ~ 0 0 0 12 15000 force
particle sculk_soul ~ ~1 ~ 0 0 0 10 12000 force
particle warped_spore ~ ~1 ~ 0 0 0 8 10000 force
particle smoke ~ ~1 ~ 20 20 20 2 5000 force
particle glow ~ ~1 ~ 18 18 18 1.5 3000 force

# MASSIVE DAMAGE (based on fragments)
# 8-9 fragments = 45 damage
# 10-11 fragments = 55 damage
# 12+ fragments = 65 damage
execute if score @s scream_fragments matches 8..9 as @e[tag=scream_marked] run damage @s 45 out_of_world by @p[tag=silent_hunter]
execute if score @s scream_fragments matches 10..11 as @e[tag=scream_marked] run damage @s 55 out_of_world by @p[tag=silent_hunter]
execute if score @s scream_fragments matches 12.. as @e[tag=scream_marked] run damage @s 65 out_of_world by @p[tag=silent_hunter]

# SUCCESS BUFFS (30 seconds) - Silent Assassin
effect give @s strength 30 2 true
effect give @s speed 30 2 true
effect give @s resistance 30 1 true
effect give @s invisibility 30 0 true
effect give @s night_vision 30 0 true

# MASSIVE KNOCKBACK
execute as @e[tag=scream_marked] at @s facing entity @p[tag=silent_hunter] feet run tp @s ^ ^ ^-12
execute as @e[tag=scream_marked] run effect give @s levitation 2 2 true

# Apply darkness and silence
execute as @e[tag=scream_marked] run effect give @s darkness 20 0 true
execute as @e[tag=scream_marked] run effect give @s blindness 10 0 true
execute as @e[tag=scream_marked] run effect give @s slowness 10 2 true

# Explosion visuals on targets
execute as @e[tag=scream_marked] at @s run particle explosion_emitter ~ ~1 ~ 10 10 10 0 80 force
execute as @e[tag=scream_marked] at @s run particle squid_ink ~ ~1 ~ 8 8 8 2 1000 force
execute as @e[tag=scream_marked] at @s run particle sculk_soul ~ ~1 ~ 6 6 6 1 800 force
execute as @e[tag=scream_marked] at @s run particle warped_spore ~ ~1 ~ 5 5 5 1 600 force

# VICTORY SOUND - Silent scream
execute at @s run playsound entity.warden.death master @a ~ ~ ~ 5 0.5
execute at @s run playsound block.sculk_shrieker.shriek master @a ~ ~ ~ 5 1
execute at @s run playsound entity.enderman.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5

# Messages
title @s title [{"text":"⬥ SILENCE DETONATES ⬥","color":"dark_gray","bold":true}]
title @s subtitle [{"text":"The screams are released","color":"black"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @s [{"text":"   ⬥ HUNT SUCCESS ⬥","color":"dark_gray","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Fragments Collected: ","color":"gray"},{"score":{"name":"@s","objective":"scream_fragments"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Silence Damage: 45-65 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Silent Assassin (30s)","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  • Strength III + Invisibility","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# Notify targets
execute as @e[tag=scream_marked,type=player] run title @s title {"text":"☠ SILENCED ☠","color":"red","bold":true}
execute as @e[tag=scream_marked,type=player] run title @s subtitle {"text":"The scream consumes you","color":"dark_red"}

# Cleanup
tag @s remove silent_hunter
tag @s remove echo_immune
tag @e remove scream_marked
scoreboard players reset @e fragment_dropped
scoreboard players reset @s scream_fragments
scoreboard players reset @s silence_backlash
scoreboard players reset @s scream_target_count