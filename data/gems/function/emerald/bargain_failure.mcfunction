# ==========================================
# FAILURE - LIFE DEBT COLLECTED
# ==========================================

# FAILURE VISUALS (draining life)
particle smoke ~ ~1 ~ 3 3 3 0.2 300 force
particle falling_dust{block_state:{Name:"minecraft:emerald_block"}} ~ ~1 ~ 2 2 2 0.3 200 force
particle cloud ~ ~1 ~ 2 2 2 0.2 150 force

# LIFE DEBT - LOSE 10 HEARTS
execute at @s run damage @s 20 magic

# DEBUFF SOUND
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.player.hurt master @s ~ ~ ~ 2 0.5
execute at @s run playsound block.soul_sand.break master @a ~ ~ ~ 2 0.5

# PUNISHMENT DEBUFFS (30 seconds)
effect give @s weakness 30 1 true
effect give @s slowness 30 1 true
effect give @s hunger 30 2 true
effect give @s mining_fatigue 30 0 true
effect give @s unluck 30 0 true

# Messages
title @s title [{"text":"⬥ DEBT UNPAID ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"Life collects its price","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ MERCHANT'S FAILURE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Hits: ","color":"gray"},{"score":{"name":"@s","objective":"bargain_hits"},"color":"yellow"},{"text":"/10","color":"gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Required: 10 hits","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Life Debt: -10 hearts","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Debuffs: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Weakness II","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Hunger III","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove bargain_active
tag @s remove bargain_immune
tag @e remove bargain_marked
scoreboard players reset @s bargain_hits
scoreboard players reset @s bargain_target_count