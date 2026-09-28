# ==========================================
# SUCCESS - CHAIN LIGHTNING
# ==========================================

# CATASTROPHIC ELECTRICAL EXPLOSION
particle explosion_emitter ~ ~1 ~ 20 20 20 0 400 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 60 force
particle electric_spark ~ ~1 ~ 0 0 0 15 20000 force
particle dust{color:[1.0,0.0,0.0],scale:4} ~ ~1 ~ 0 0 0 12 15000 force
particle flame ~ ~1 ~ 0 0 0 10 10000 force
particle glow ~ ~1 ~ 20 20 20 2 8000 force
particle end_rod ~ ~1 ~ 18 18 18 1.5 5000 force

# MASSIVE DAMAGE (based on discharges)
# 7-8 discharges = 40 damage
# 9-10 discharges = 50 damage
# 11+ discharges = 60 damage
execute if score @s discharge_hits matches 7..8 as @e[tag=discharge_target] run damage @s 40 lightning_bolt by @p[tag=overcharged]
execute if score @s discharge_hits matches 9..10 as @e[tag=discharge_target] run damage @s 50 lightning_bolt by @p[tag=overcharged]
execute if score @s discharge_hits matches 11.. as @e[tag=discharge_target] run damage @s 60 lightning_bolt by @p[tag=overcharged]

# HEAL ALL OVERLOAD DAMAGE
execute if score @s overload_damage matches ..20 run effect give @s instant_health 1 1 true
execute if score @s overload_damage matches 21..30 run effect give @s instant_health 1 2 true
execute if score @s overload_damage matches 31.. run effect give @s instant_health 1 3 true

effect give @s regeneration 20 3 true
effect give @s absorption 30 9 true

# SUCCESS BUFFS (30 seconds) - Living Wire
effect give @s strength 30 1 true
effect give @s speed 30 3 true
effect give @s haste 30 2 true
effect give @s jump_boost 30 1 true

# MASSIVE KNOCKBACK - Lightning blast
execute as @e[tag=discharge_target] at @s facing entity @p[tag=overcharged] feet run tp @s ^ ^ ^-10
execute as @e[tag=discharge_target] run effect give @s levitation 2 2 true

# Apply electrical aftershock
execute as @e[tag=discharge_target] run effect give @s slowness 8 2 true

# Explosion visuals on targets - chain lightning
execute as @e[tag=discharge_target] at @s run particle explosion_emitter ~ ~1 ~ 8 8 8 0 60 force
execute as @e[tag=discharge_target] at @s run particle electric_spark ~ ~1 ~ 6 6 6 2 1000 force
execute as @e[tag=discharge_target] at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 5 5 5 1 800 force
execute as @e[tag=discharge_target] at @s run particle flame ~ ~1 ~ 4 4 4 1 600 force

# Lightning strikes from sky
execute as @e[tag=discharge_target] at @s run particle electric_spark ~ ~1 ~ 0.5 30 0.5 0 500 force

# VICTORY SOUND - Lightning storm
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 2
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 1.5
execute at @s run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 5 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5

# Messages
title @s title [{"text":"⬥ CHAIN LIGHTNING ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"The circuit completes","color":"gold"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ DISCHARGE SUCCESS ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Discharges: ","color":"gray"},{"score":{"name":"@s","objective":"discharge_hits"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Lightning Damage: 40-60 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Overload Healed: +","color":"green"},{"score":{"name":"@s","objective":"overload_damage"},"color":"yellow"},{"text":" HP","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Living Wire (30s)","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"  • Speed IV + Haste III","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Notify targets
execute as @e[tag=discharge_target,type=player] run title @s title {"text":"☠ ELECTROCUTED ☠","color":"red","bold":true}
execute as @e[tag=discharge_target,type=player] run title @s subtitle {"text":"Chain lightning strikes","color":"dark_red"}

# Cleanup
tag @s remove overcharged
tag @s remove redstone_immune
tag @e remove discharge_target
scoreboard players reset @e target_discharged
scoreboard players reset @s discharge_hits
scoreboard players reset @s overload_damage
scoreboard players reset @s discharge_target_count