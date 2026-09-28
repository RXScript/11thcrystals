# ==========================================
# SUCCESS - CHAIN EXPLOSION!
# ==========================================

# MASSIVE FIRE EXPLOSION
particle explosion_emitter ~ ~1 ~ 10 10 10 0 200 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 30 force
particle flame ~ ~1 ~ 0 0 0 10 3000 force
particle lava ~ ~1 ~ 10 10 10 2 1000 force
particle dust{color:[1.0,0.3,0.0],scale:4} ~ ~1 ~ 0 0 0 3 2000 force
particle glow ~ ~1 ~ 10 10 10 2 1000 force

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.blaze.death master @a ~ ~ ~ 3 1

# Messages
title @s title [{"text":"⬥ CHAIN EXPLOSION ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"All sparks ignited!","color":"gold"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ IGNITION SUCCESS ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Sparks Ignited: ","color":"gray"},{"score":{"name":"@s","objective":"sparks_ignited"},"color":"gold"}]
tellraw @s [{"text":"  Chain Damage: 35 HP","color":"red"}]
# tellraw @s [{"text":"  • Fire Aspect (10s)","color":"green"}]
tellraw @s [{"text":"  • Strength II (10s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# DAMAGE (35 HP to all marked)
execute at @s as @e[distance=0.1..20,tag=spark_marked] run damage @s 35 on_fire by @p[tag=ruby_igniter]

# MASSIVE KNOCKBACK
execute at @s as @e[distance=0.1..20,tag=spark_marked] at @s facing entity @p[tag=ruby_igniter] feet run tp @s ^ ^ ^-8
execute at @s as @e[distance=0.1..20,tag=spark_marked] run effect give @s levitation 2 2 true

# Set all on fire
execute at @s as @e[distance=0.1..20,tag=spark_marked] run data merge entity @s {Fire:200s}

# Explosion visuals on all sparks
execute at @s as @e[distance=0.1..20,tag=spark_marked] at @s run particle explosion ~ ~1 ~ 3 3 3 0 40 force
execute at @s as @e[distance=0.1..20,tag=spark_marked] at @s run particle flame ~ ~1 ~ 3 3 3 1 200 force
execute at @s as @e[distance=0.1..20,tag=spark_marked] at @s run particle lava ~ ~1 ~ 2 2 2 0.5 100 force

# Chain lightning effect between ignited sparks
execute at @s as @e[distance=0.1..20,tag=spark_marked,scores={spark_ignited=1}] at @s run particle flame ~ ~1 ~ 0 0 0 0.5 100 force

# BUFFS (10 seconds)
effect give @s strength 10 1 true
effect give @s fire_resistance 10 0 true
effect give @s regeneration 10 1 true
effect give @s speed 10 1 true

# Give fire aspect effect (simulated with tag)
tag @s add fire_aspect_active
scoreboard players set @s fire_aspect_timer 200

# Cleanup
tag @s remove ruby_igniter
tag @s remove ruby_immune
tag @e remove spark_marked
scoreboard players reset @e spark_ignited
scoreboard players reset @s ignition_timer
scoreboard players reset @s sparks_ignited
scoreboard players reset @s spark_total