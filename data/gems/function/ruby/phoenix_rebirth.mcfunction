# ==========================================
# SUCCESS - PHOENIX REBIRTH
# ==========================================

# CATASTROPHIC FIRE EXPLOSION
particle explosion_emitter ~ ~1 ~ 20 20 20 0 400 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 60 force
particle flame ~ ~1 ~ 0 0 0 12 15000 force
particle soul_fire_flame ~ ~1 ~ 0 0 0 10 12000 force
particle lava ~ ~1 ~ 20 20 20 2 3000 force
particle glow ~ ~1 ~ 20 20 20 2 5000 force
particle smoke ~ ~1 ~ 18 18 18 1 3000 force

# MASSIVE DAMAGE (based on stacks)
# 6-7 stacks = 40 damage
# 8-9 stacks = 50 damage
# 10+ stacks = 60 damage
execute if score @s phoenix_stacks_elite matches 6..7 as @e[tag=immolation_target] run damage @s 40 in_fire by @p[tag=phoenix_form]
execute if score @s phoenix_stacks_elite matches 8..9 as @e[tag=immolation_target] run damage @s 50 in_fire by @p[tag=phoenix_form]
execute if score @s phoenix_stacks_elite matches 10.. as @e[tag=immolation_target] run damage @s 60 in_fire by @p[tag=phoenix_form]

# REBIRTH - HEAL ALL SELF-BURN DAMAGE + EXTRA
# Convert burn damage to healing (doubled)
execute store result score #heal_amount self_burn_damage run scoreboard players get @s self_burn_damage
scoreboard players operation #heal_amount self_burn_damage *= #2 self_burn_damage

# Apply healing (instant health based on damage taken)
execute if score @s self_burn_damage matches ..20 run effect give @s instant_health 1 1 true
execute if score @s self_burn_damage matches 21..30 run effect give @s instant_health 1 2 true
execute if score @s self_burn_damage matches 31..40 run effect give @s instant_health 1 3 true
execute if score @s self_burn_damage matches 41.. run effect give @s instant_health 1 4 true

effect give @s regeneration 20 3 true
effect give @s absorption 30 9 true

# SUCCESS BUFFS (30 seconds)
effect give @s strength 30 2 true
effect give @s speed 30 2 true
effect give @s resistance 30 1 true
effect give @s fire_resistance 30 0 true

# MASSIVE KNOCKBACK
execute as @e[tag=immolation_target] at @s facing entity @p[tag=phoenix_form] feet run tp @s ^ ^ ^-12
execute as @e[tag=immolation_target] run effect give @s levitation 2 2 true

# Set immolation targets on fire
execute as @e[tag=immolation_target] run effect give @s wither 10 1 true
execute as @e[tag=immolation_target] run data merge entity @s {Fire:200s}

# Explosion visuals on targets
execute as @e[tag=immolation_target] at @s run particle explosion_emitter ~ ~1 ~ 10 10 10 0 60 force
execute as @e[tag=immolation_target] at @s run particle flame ~ ~1 ~ 6 6 6 2 800 force
execute as @e[tag=immolation_target] at @s run particle soul_fire_flame ~ ~1 ~ 5 5 5 1 600 force

# VICTORY SOUND - Phoenix cry
execute at @s run playsound entity.ender_dragon.growl master @a ~ ~ ~ 5 2
execute at @s run playsound entity.blaze.death master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5
execute at @s run playsound item.totem.use master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ PHOENIX REBORN ⬥","color":"gold","bold":true}]
title @s subtitle [{"text":"From ash to inferno","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"   ⬥ PHOENIX REBIRTH ⬥","color":"gold","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Immolation Stacks: ","color":"gray"},{"score":{"name":"@s","objective":"phoenix_stacks_elite"},"color":"gold"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Fire Damage: 40-60 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Self-Burn Healed: +","color":"green"},{"score":{"name":"@s","objective":"self_burn_damage"},"color":"yellow"},{"text":" HP","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Strength III (30s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# Notify targets
execute as @e[tag=immolation_target,type=player] run title @s title {"text":"☠ IMMOLATED ☠","color":"red","bold":true}
execute as @e[tag=immolation_target,type=player] run title @s subtitle {"text":"The phoenix consumes you","color":"dark_red"}

# Cleanup
tag @s remove phoenix_form
tag @s remove phoenix_immune
tag @e remove immolation_target
scoreboard players reset @s phoenix_stacks_elite
scoreboard players reset @s self_burn_damage
scoreboard players reset @s rebirth_ready_elite
scoreboard players reset @s immolation_target_count
scoreboard players reset #heal_amount self_burn_damage