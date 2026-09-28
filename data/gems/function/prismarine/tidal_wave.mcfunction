# ==========================================
# SUCCESS - TIDAL WAVE
# ==========================================

# CATASTROPHIC OCEAN SURGE
particle explosion_emitter ~ ~1 ~ 20 20 20 0 400 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 60 force
particle splash ~ ~1 ~ 0 0 0 12 15000 force
particle falling_water ~ ~1 ~ 0 0 0 10 12000 force
particle bubble ~ ~1 ~ 20 20 20 2 8000 force
particle glow ~ ~1 ~ 20 20 20 2 5000 force
particle end_rod ~ ~1 ~ 18 18 18 1.5 3000 force

# MASSIVE DAMAGE (based on debt collected)
# 50-59 collected = 40 damage
# 60-74 collected = 50 damage
# 75+ collected = 60 damage
execute if score @s debt_collected matches 50..59 as @e[tag=debt_holder] run damage @s 40 player_attack by @p[tag=debt_collector]
execute if score @s debt_collected matches 60..74 as @e[tag=debt_holder] run damage @s 50 player_attack by @p[tag=debt_collector]
execute if score @s debt_collected matches 75.. as @e[tag=debt_holder] run damage @s 60 player_attack by @p[tag=debt_collector]

# HEAL BACK ALL DROWNING DAMAGE
execute if score @s drowning_damage matches 1..10 run effect give @s instant_health 1 0 true
execute if score @s drowning_damage matches 11..15 run effect give @s instant_health 1 1 true
execute if score @s drowning_damage matches 16.. run effect give @s instant_health 1 2 true

effect give @s regeneration 20 3 true
effect give @s absorption 30 9 true

# SUCCESS BUFFS (30 seconds)
effect give @s strength 30 2 true
effect give @s resistance 30 1 true
effect give @s speed 30 1 true
effect give @s water_breathing 30 0 true

# MASSIVE KNOCKBACK - Tidal surge
execute as @e[tag=debt_holder] at @s facing entity @p[tag=debt_collector] feet run tp @s ^ ^ ^-13
execute as @e[tag=debt_holder] run effect give @s levitation 2 2 true

# Drench enemies
execute as @e[tag=debt_holder] run effect give @s slowness 10 2 true

# Explosion visuals on targets
execute as @e[tag=debt_holder] at @s run particle explosion_emitter ~ ~1 ~ 10 10 10 0 80 force
execute as @e[tag=debt_holder] at @s run particle splash ~ ~1 ~ 8 8 8 2 1000 force
execute as @e[tag=debt_holder] at @s run particle falling_water ~ ~1 ~ 6 6 6 1 800 force
execute as @e[tag=debt_holder] at @s run particle bubble ~ ~1 ~ 5 5 5 1 600 force

# VICTORY SOUND - Tidal crash
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.elder_guardian.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.player.splash.high_speed master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5

# Messages
title @s title [{"text":"⬥ DEBT PAID ⬥","color":"dark_aqua","bold":true}]
title @s subtitle [{"text":"The ocean is satisfied","color":"aqua"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"   ⬥ TIDAL SUCCESS ⬥","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Debt Collected: ","color":"gray"},{"score":{"name":"@s","objective":"debt_collected"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Tidal Damage: 40-60 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Drowning Healed: +","color":"green"},{"score":{"name":"@s","objective":"drowning_damage"},"color":"yellow"},{"text":" HP","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Strength III (30s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]

# Notify targets
execute as @e[tag=debt_holder,type=player] run title @s title {"text":"☠ DROWNED ☠","color":"red","bold":true}
execute as @e[tag=debt_holder,type=player] run title @s subtitle {"text":"The ocean collects","color":"dark_red"}

# Cleanup
tag @s remove debt_collector
tag @s remove debt_immune
tag @e remove debt_holder
scoreboard players reset @s debt_collected
scoreboard players reset @s drowning_damage
scoreboard players reset @s debt_holder_count