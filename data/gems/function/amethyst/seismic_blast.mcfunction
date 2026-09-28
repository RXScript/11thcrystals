# ==========================================
# SUCCESS - SEISMIC BLAST!
# ==========================================

# MASSIVE EARTHQUAKE EXPLOSION
particle explosion_emitter ~ ~1 ~ 10 10 10 0 200 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 30 force
particle dust{color:[0.5,0.0,0.5],scale:4} ~ ~1 ~ 0 0 0 3 2000 force
particle sculk_charge{roll:10.0} ~ ~1 ~ 0 0 0 2 500 force
particle glow ~ ~1 ~ 10 10 10 2 1000 force

# Ground shockwave
particle dust{color:[0.5,0.0,0.5],scale:4} ~ ~0.1 ~ 0 0 0 5 800 force

# VICTORY SOUND
playsound entity.player.levelup master @a ~ ~ ~ 3 2
playsound entity.warden.sonic_boom master @a ~ ~ ~ 3 1
playsound block.amethyst_block.chime master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ SEISMIC BLAST ⬥","color":"light_purple","bold":true}]
title @s subtitle [{"text":"Peak resonance!","color":"dark_purple"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @s [{"text":"   ⬥ SENSE SUCCESS ⬥","color":"light_purple","bold":true}]
tellraw @s [{"text":"  Vibrations: ","color":"gray"},{"score":{"name":"@s","objective":"vibration_count"},"color":"gold"}]
tellraw @s [{"text":"  Seismic Damage: 45 HP","color":"red"}]
tellraw @s [{"text":"  • Strength II (12s)","color":"green"}]
tellraw @s [{"text":"  • Resistance II (12s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]

# DAMAGE (45 HP - higher than other advanced)
execute at @s as @e[distance=0.1..20,tag=vibration_source] run damage @s 45 sonic_boom by @p[tag=seismic_sensing]

# MASSIVE KNOCKBACK
execute at @s as @e[distance=0.1..20,tag=vibration_source] at @s facing entity @p[tag=seismic_sensing] feet run tp @s ^ ^ ^-10
execute at @s as @e[distance=0.1..20,tag=vibration_source] run effect give @s levitation 2 2 true

# Apply earthquake effects
execute at @s as @e[distance=0.1..20,tag=vibration_source] run effect give @s slowness 10 3 true
execute at @s as @e[distance=0.1..20,tag=vibration_source] run effect give @s weakness 10 2 true

# Explosion visuals on targets
execute at @s as @e[distance=0.1..20,tag=vibration_source] at @s run particle explosion ~ ~1 ~ 3 3 3 0 40 force
execute at @s as @e[distance=0.1..20,tag=vibration_source] at @s run particle dust{color:[0.5,0.0,0.5],scale:3} ~ ~1 ~ 2 2 2 1 300 force
execute at @s as @e[distance=0.1..20,tag=vibration_source] at @s run particle sculk_charge{roll:5.0} ~ ~1 ~ 1 1 1 0 100 force

# BUFFS (12 seconds)
effect give @s strength 12 1 true
effect give @s resistance 12 1 true
effect give @s regeneration 12 1 true
effect give @s absorption 12 4 true

# Cleanup
tag @s remove seismic_sensing
tag @s remove seismic_immune
tag @e remove vibration_source
scoreboard players reset @e entity_last_x
scoreboard players reset @e entity_last_z
scoreboard players reset @s seismic_timer
scoreboard players reset @s vibration_count
scoreboard players reset @s detonated