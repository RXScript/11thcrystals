# ==========================================
# SUCCESS - RESIN EXPLOSION
# ==========================================

# CATASTROPHIC AMBER BURST
particle explosion_emitter ~ ~1 ~ 20 20 20 0 400 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 60 force
particle falling_honey ~ ~1 ~ 0 0 0 12 15000 force
particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 0 0 0 10 12000 force
particle dust{color:[1.0,0.7,0.0],scale:4} ~ ~1 ~ 20 20 20 2 8000 force
particle glow ~ ~1 ~ 20 20 20 2 5000 force

# CALCULATE DOUBLED DAMAGE (capped at reasonable ranges)
# 40-49 stored → 40 damage
# 50-59 stored → 50 damage  
# 60+ stored → 60 damage
execute if score @s damage_stored matches 40..49 as @e[tag=resin_source] run damage @s 40 player_attack by @p[tag=resin_tank]
execute if score @s damage_stored matches 50..59 as @e[tag=resin_source] run damage @s 50 player_attack by @p[tag=resin_tank]
execute if score @s damage_stored matches 60.. as @e[tag=resin_source] run damage @s 60 player_attack by @p[tag=resin_tank]

# HEAL BASED ON DAMAGE STORED (reward tanking)
execute if score @s damage_stored matches 40..49 run effect give @s instant_health 1 2 true
execute if score @s damage_stored matches 50..59 run effect give @s instant_health 1 3 true
execute if score @s damage_stored matches 60.. run effect give @s instant_health 1 4 true

effect give @s regeneration 20 2 true
effect give @s absorption 30 9 true

# SUCCESS BUFFS (30 seconds)
effect give @s strength 30 2 true
effect give @s resistance 30 1 true
effect give @s speed 30 1 true

# MASSIVE KNOCKBACK
execute as @e[tag=resin_source] at @s facing entity @p[tag=resin_tank] feet run tp @s ^ ^ ^-12
execute as @e[tag=resin_source] run effect give @s levitation 2 2 true

# Stick enemies in resin
execute as @e[tag=resin_source] run effect give @s slowness 10 3 true

# Explosion visuals on targets
execute as @e[tag=resin_source] at @s run particle explosion_emitter ~ ~1 ~ 10 10 10 0 80 force
execute as @e[tag=resin_source] at @s run particle falling_honey ~ ~1 ~ 8 8 8 2 1000 force
execute as @e[tag=resin_source] at @s run particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 6 6 6 1 800 force

# VICTORY SOUND
execute at @a run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @a run playsound block.honey_block.break master @a ~ ~ ~ 5 0.5
execute at @a run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @a run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @a run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5

# Messages
title @s title [{"text":"⬥ RESIN BURSTS ⬥","color":"gold","bold":true}]
title @s subtitle [{"text":"Ancient power released","color":"yellow"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"   ⬥ REFLECTION SUCCESS ⬥","color":"gold","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Damage Absorbed: ","color":"gray"},{"score":{"name":"@s","objective":"damage_stored"},"color":"yellow"},{"text":" HP","color":"gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Burst Damage: 40-60 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Healing: +16-20 hearts","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Strength III (30s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# Notify targets
execute as @e[tag=resin_source,type=player] run title @s title {"text":"☠ REFLECTED ☠","color":"red","bold":true}
execute as @e[tag=resin_source,type=player] run title @s subtitle {"text":"Your attacks returned doubled","color":"dark_red"}

# Cleanup
tag @s remove resin_tank
tag @s remove resin_immune
tag @e remove resin_source
scoreboard players reset @s damage_stored
scoreboard players reset @s amber_weight_count
scoreboard players reset @s resin_source_count
scoreboard players reset @s health_before
scoreboard players reset @s health_current
scoreboard players reset #damage_taken damage_stored