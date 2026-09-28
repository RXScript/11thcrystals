# ==========================================
# SUCCESS - PERFECT EFFICIENCY
# ==========================================

# CATASTROPHIC PRECISION BURST
particle explosion_emitter ~ ~1 ~ 18 18 18 0 300 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 50 force
particle firework ~ ~1 ~ 0 0 0 10 10000 force
particle end_rod ~ ~1 ~ 0 0 0 8 8000 force
particle electric_spark ~ ~1 ~ 0 0 0 8 8000 force
particle glow ~ ~1 ~ 18 18 18 2 5000 force

# MASSIVE DAMAGE (based on targets hit perfectly)
# 1-3 targets = 45 damage
# 4-5 targets = 55 damage
# 6+ targets = 65 damage
execute if score @s targets_hit_elite matches 1..3 as @e[tag=efficiency_target] run damage @s 45 player_attack by @p[tag=protocol_active]
execute if score @s targets_hit_elite matches 4..5 as @e[tag=efficiency_target] run damage @s 55 player_attack by @p[tag=protocol_active]
execute if score @s targets_hit_elite matches 6.. as @e[tag=efficiency_target] run damage @s 65 player_attack by @p[tag=protocol_active]

# SUCCESS BUFFS (30 seconds) - Overclock state
effect give @s strength 30 2 true
effect give @s speed 30 3 true
effect give @s haste 30 2 true
effect give @s regeneration 30 1 true
effect give @s resistance 30 0 true

# MASSIVE KNOCKBACK - Precision blast
execute as @e[tag=efficiency_target] at @s facing entity @p[tag=protocol_active] feet run tp @s ^ ^ ^-10
execute as @e[tag=efficiency_target] run effect give @s levitation 2 2 true

# Explosion visuals on targets
execute as @e[tag=efficiency_target] at @s run particle explosion_emitter ~ ~1 ~ 8 8 8 0 50 force
execute as @e[tag=efficiency_target] at @s run particle firework ~ ~1 ~ 5 5 5 2 500 force
execute as @e[tag=efficiency_target] at @s run particle electric_spark ~ ~1 ~ 4 4 4 1.5 400 force

# VICTORY SOUND - Perfect execution
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 5 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5
execute at @s run playsound block.note_block.chime master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ PROTOCOL COMPLETE ⬥","color":"white","bold":true}]
title @s subtitle [{"text":"100% efficiency achieved","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @s [{"text":"   ⬥ PROTOCOL SUCCESS ⬥","color":"white","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Targets Executed: ","color":"gray"},{"score":{"name":"@s","objective":"targets_hit_elite"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"efficiency_target_total"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Precision: 100%","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Burst Damage: 45-65 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Overclock State (30s)","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  • Strength III + Speed IV + Haste III","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]

# Notify targets
execute as @e[tag=efficiency_target,type=player] run title @s title {"text":"☠ ELIMINATED ☠","color":"red","bold":true}
execute as @e[tag=efficiency_target,type=player] run title @s subtitle {"text":"Perfect execution","color":"dark_red"}

# Cleanup
tag @s remove protocol_active
tag @s remove protocol_immune
tag @e remove efficiency_target
scoreboard players reset @e target_hit_status
scoreboard players reset @s targets_hit_elite
scoreboard players reset @s protocol_failed
scoreboard players reset @s efficiency_target_total