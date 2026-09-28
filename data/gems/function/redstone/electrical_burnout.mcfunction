# ==========================================
# FAILURE - ELECTRICAL BURNOUT
# ==========================================

# FAILURE VISUALS (short circuit)
particle explosion ~ ~1 ~ 4 4 4 1 100 force
particle electric_spark ~ ~1 ~ 5 5 5 1 500 force
particle smoke ~ ~1 ~ 4 4 4 0.5 400 force
particle large_smoke ~ ~1 ~ 3 3 3 0.3 300 force

# BURNOUT DAMAGE (additional 15 HP)
execute at @s run damage @s 15 lightning_bolt
scoreboard players add @s overload_damage 15

# HARSH ELECTRICAL SOUND
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 3 1
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.creeper.death master @s ~ ~ ~ 2 1

# PUNISHMENT DEBUFFS (30 seconds) - Burnt out
effect give @s slowness 30 3 true
effect give @s weakness 30 2 true
effect give @s mining_fatigue 30 3 true
effect give @s hunger 30 2 true
effect give @s unluck 30 0 true

# Messages
title @s title [{"text":"⬥ BURNT OUT ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"The circuit fails","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ DISCHARGE FAILURE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  Discharges: ","color":"gray"},{"score":{"name":"@s","objective":"discharge_hits"},"color":"yellow"},{"text":"/7","color":"gray"}]
tellraw @s [{"text":"  Required: 7 discharges","color":"red"}]
tellraw @s [{"text":"  Total Overload: -","color":"dark_red"},{"score":{"name":"@s","objective":"overload_damage"},"color":"red"},{"text":" HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  • Slowness IV","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness III","color":"dark_red"}]
tellraw @s [{"text":"  • Mining Fatigue IV","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove overcharged
tag @s remove redstone4_immune
tag @e remove discharge_target
scoreboard players reset @e target_discharged
scoreboard players reset @s discharge_hits
scoreboard players reset @s overload_damage
scoreboard players reset @s discharge_target_count