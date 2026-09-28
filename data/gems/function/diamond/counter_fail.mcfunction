# ==========================================
# COUNTER FAILED - MISTIMED!
# ==========================================

# Only fail if NOT triggered
execute if score @s counter_triggered matches 1.. run return fail

# FAILURE VISUALS
particle explosion ~ ~1 ~ 2 2 2 0 30 force
particle smoke ~ ~1 ~ 2 2 2 0.3 100 force
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 1 1 1 0.5 50 force

# HARSH SOUND
playsound entity.item.break master @a ~ ~ ~ 2 0.5
playsound block.glass.break master @a ~ ~ ~ 2 1
playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# RECOIL DAMAGE (5 HP for mistiming)
execute at @s run damage @s 5 generic

# PUNISHMENT DEBUFFS (10 seconds)
effect give @s slowness 10 1 true
effect give @s weakness 10 1 true

# Messages
title @s title [{"text":"⬥ MISTIMED ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Counter failed","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ COUNTER FAILED ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  You weren't hit in time!","color":"gray"}]
tellraw @s [{"text":"  Recoil: -5 HP","color":"red"}]
tellraw @s [{"text":"  Debuffs: 10 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove diamond_counter_ready
tag @s remove counter_immune
scoreboard players reset @s counter_window
scoreboard players reset @s counter_triggered