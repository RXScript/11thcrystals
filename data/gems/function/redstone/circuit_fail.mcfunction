# ==========================================
# FAILURE - MISSED WINDOW!
# ==========================================

# BACKFIRE EXPLOSION
execute at @s run particle explosion ~ ~1 ~ 2 2 2 0 40 force
execute at @s run particle smoke ~ ~1 ~ 3 3 3 0.3 120 force
execute at @s run particle dust{color:[0.5,0.0,0.0],scale:3} ~ ~1 ~ 2 2 2 0.5 100 force
execute at @s run particle lava ~ ~1 ~ 2 2 2 0 60 force

# Target dissipates
execute as @e[tag=circuit_marked,limit=1] at @s run particle smoke ~ ~1 ~ 1 1 1 0.3 80 force
execute as @e[tag=circuit_marked,limit=1] at @s run particle dust{color:[0.3,0.0,0.0],scale:2} ~ ~1 ~ 0.8 0.8 0.8 0 40 force

# HARSH SOUND
execute at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5
execute at @s run playsound entity.generic.hurt master @s ~ ~ ~ 2 1

# Messages
title @s title [{"text":"⚠ CIRCUIT FAILED ⚠","color":"red","bold":true}]
title @s subtitle [{"text":"Missed the window!","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"  ⚠ CIRCUIT BACKFIRE ⚠","color":"red","bold":true}]
tellraw @s [{"text":"  You missed the 2s window!","color":"gray"}]
tellraw @s [{"text":"  Circuit collapsed on you!","color":"dark_red"}]
tellraw @s [{"text":"  Self Damage: 8 HP","color":"red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"  • Mining Fatigue II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# SELF DAMAGE (8 HP)
damage @s 8 lightning_bolt

# PUNISHMENT DEBUFFS (8 seconds)
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true
effect give @s mining_fatigue 8 1 true

# Cleanup
tag @s remove dead_circuit_active
tag @s remove redstone3_immune
tag @e remove circuit_marked
scoreboard players reset @s circuit_window
scoreboard players reset @s circuit_triggered