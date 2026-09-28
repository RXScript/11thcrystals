# ==========================================
# FAILURE - DEAFENING BACKLASH
# ==========================================

# FAILURE VISUALS (discordant explosion)
particle explosion ~ ~1 ~ 4 4 4 1 100 force
particle smoke ~ ~1 ~ 3 3 3 0.3 300 force
particle cloud ~ ~1 ~ 3 3 3 0.2 200 force

# BACKLASH DAMAGE - Hurt yourself
execute at @s run damage @s 15 sonic_boom

# HARSH DISCORDANT SOUND
execute at @s run playsound block.amethyst_block.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.villager.no master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 2 1
execute at @s run playsound entity.player.hurt master @s ~ ~ ~ 2 0.5

# PUNISHMENT DEBUFFS (30 seconds)
effect give @s slowness 30 2 true
effect give @s weakness 30 1 true
effect give @s nausea 30 0 true
effect give @s mining_fatigue 30 1 true
effect give @s unluck 30 0 true

# Messages
execute if score @s rhythm_broken matches 1 run title @s title [{"text":"⬥ RHYTHM SHATTERED ⬥","color":"dark_red","bold":true}]
execute if score @s rhythm_broken matches 0 run title @s title [{"text":"⬥ INSUFFICIENT RESONANCE ⬥","color":"dark_red","bold":true}]
title @s subtitle [{"text":"The sound turns against you","color":"red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"   ⬥ RESONANCE FAILURE ⬥","color":"dark_red","bold":true}]
execute if score @s rhythm_broken matches 1 run tellraw @s [{"text":"  Reason: ","color":"gray"},{"text":"Broken rhythm (hit too fast)","color":"red"}]
execute if score @s rhythm_broken matches 0 run tellraw @s [{"text":"  Hits: ","color":"gray"},{"score":{"name":"@s","objective":"resonance4_stacks"},"color":"yellow"},{"text":"/6","color":"gray"}]
execute if score @s rhythm_broken matches 0 run tellraw @s [{"text":"  Required: 6 perfect hits","color":"red"}]
tellraw @s [{"text":"  Backlash: -7.5 hearts","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 30 seconds","color":"dark_red"}]
tellraw @s [{"text":"  • Slowness III","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"  • Nausea","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# Cleanup
tag @s remove resonance_active
tag @s remove resonance_immune
tag @e remove resonance_marked
scoreboard players reset @s resonance4_stacks
scoreboard players reset @s rhythm_cooldown
scoreboard players reset @s rhythm_broken
scoreboard players reset @s resonance_target_count