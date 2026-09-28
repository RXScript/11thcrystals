# ==========================================
# FAILURE - BURN TO ASH
# ==========================================

# FAILURE VISUALS (fading fire)
particle explosion ~ ~1 ~ 4 4 4 1 100 force
particle smoke ~ ~1 ~ 5 5 5 0.5 400 force
particle large_smoke ~ ~1 ~ 4 4 4 0.3 300 force
particle flame ~ ~1 ~ 3 3 3 0.2 200 force

# FINAL BURN DAMAGE (additional 5 hearts)
damage @s 10 on_fire
scoreboard players add @s self_burn_damage 10

# HARSH BURNING SOUND
execute at @s run playsound entity.blaze.death master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.generic.burn master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.player.hurt master @s ~ ~ ~ 2 0.5

# PUNISHMENT DEBUFFS (30 seconds)
effect give @s slowness 30 2 true
effect give @s weakness 30 2 true
effect give @s hunger 30 3 true
effect give @s mining_fatigue 30 1 true
effect give @s unluck 30 0 true
effect clear @s fire_resistance

# Keep burning for a bit
data merge entity @s {Fire:100s}

# Messages
title @s title [{"text":"⬥ BURNED TO ASH ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"No rebirth, only death","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ PHOENIX FAILURE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  Stacks: ","color":"gray"},{"score":{"name":"@s","objective":"phoenix_stacks_elite"},"color":"yellow"},{"text":"/6","color":"gray"}]
tellraw @s [{"text":"  Required: 6 immolation stacks","color":"red"}]
tellraw @s [{"text":"  Total Burn Damage: -","color":"dark_red"},{"score":{"name":"@s","objective":"self_burn_damage"},"color":"red"},{"text":" HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  • Slowness III","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness III","color":"dark_red"}]
tellraw @s [{"text":"  • Hunger IV","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove phoenix_form
tag @s remove phoenix_immune
tag @e remove immolation_target
scoreboard players reset @s phoenix_stacks_elite
scoreboard players reset @s self_burn_damage
scoreboard players reset @s rebirth_ready_elite
scoreboard players reset @s immolation_target_count