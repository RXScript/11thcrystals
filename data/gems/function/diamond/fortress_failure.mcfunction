# ==========================================
# FAILURE - SEVERE PUNISHMENT
# ==========================================

# FAILURE VISUALS (much weaker)
particle smoke ~ ~1 ~ 3 3 3 0.2 200 force
particle cloud ~ ~1 ~ 3 3 3 0.2 150 force

# DEBUFF SOUND
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.player.hurt master @s ~ ~ ~ 1 0.5

# PUNISHMENT DEBUFFS (30 seconds)
effect give @s slowness 30 2 true
effect give @s weakness 30 1 true
effect give @s mining_fatigue 30 1 true
effect give @s unluck 30 0 true

# Messages
title @s title [{"text":"⬥ FAILURE ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"You braced for nothing","color":"gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ FORTRESS FAILURE ⬥","color":"dark_red","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Hits Taken: ","color":"gray"},{"text":"0","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"No counter-attack triggered","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Debuffs: ","color":"dark_red"},{"text":"30 seconds","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Slowness III","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Weakness II","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Mining Fatigue II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove fortress_active
tag @s remove fortress_immune
tag @e remove fortress_target
scoreboard players reset @s fortress_hits
scoreboard players reset @s damage_absorbed
scoreboard players reset @s fortress_x
scoreboard players reset @s fortress_y
scoreboard players reset @s fortress_z