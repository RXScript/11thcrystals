# ==========================================
# FAILURE - CRUSHED BY RESIN
# ==========================================

# FAILURE VISUALS (resin collapse)
particle explosion ~ ~1 ~ 4 4 4 1 100 force
particle falling_honey ~ ~1 ~ 4 4 4 0.8 500 force
particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~1 ~ 3 3 3 0.5 400 force
particle dust{color:[1.0,0.7,0.0],scale:3} ~ ~1 ~ 3 3 3 0.3 300 force

# CRUSHING DAMAGE (based on how much was stored)
execute if score @s damage_stored matches ..10 run damage @s 5 cramming
execute if score @s damage_stored matches 11..20 run damage @s 10 cramming
execute if score @s damage_stored matches 21..30 run damage @s 15 cramming
execute if score @s damage_stored matches 31..39 run damage @s 20 cramming

# HARSH SOUND
execute at @s run playsound block.honey_block.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.player.hurt master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound block.anvil.land master @s ~ ~ ~ 2 0.5

# PUNISHMENT DEBUFFS (30 seconds)
effect give @s slowness 30 2 true
effect give @s weakness 30 2 true
effect give @s mining_fatigue 30 2 true
effect give @s hunger 30 2 true
effect give @s unluck 30 0 true

# Messages
title @s title [{"text":"⬥ CRUSHED ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"The resin collapses on you","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ REFLECTION FAILURE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  Absorbed: ","color":"gray"},{"score":{"name":"@s","objective":"damage_stored"},"color":"yellow"},{"text":"/40 HP","color":"gray"}]
tellraw @s [{"text":"  Required: 40 damage absorbed","color":"red"}]
tellraw @s [{"text":"  Crush Damage: -5 to -20 HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  • Slowness III","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness III","color":"dark_red"}]
tellraw @s [{"text":"  • Mining Fatigue III","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove resin_tank
tag @s remove resin_immune
tag @e remove resin_source
scoreboard players reset @s damage_stored
scoreboard players reset @s amber_weight_count
scoreboard players reset @s resin_source_count
scoreboard players reset @s health_before
scoreboard players reset @s health_current