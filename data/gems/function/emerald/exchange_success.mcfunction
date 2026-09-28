# ==========================================
# EXCHANGE SUCCESS - DRAIN DOUBLE!
# ==========================================

# Mark as drained (prevent multiple triggers)
execute if score @s exchange_drained matches 1.. run return fail
scoreboard players set @s exchange_drained 1

# Calculate drain amount (double the sacrifice)
scoreboard players operation #drain_amount exchange_health = @s exchange_sacrificed
scoreboard players operation #drain_amount exchange_health *= #2 exchange_health

# MASSIVE SUCCESS VISUALS
particle explosion_emitter ~ ~1 ~ 5 5 5 0 100 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 20 force
particle happy_villager ~ ~1 ~ 0 0 0 3 1000 force
particle dust{color:[0.0,1.0,0.0],scale:4} ~ ~1 ~ 0 0 0 2 800 force
particle glow ~ ~1 ~ 5 5 5 1 500 force

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound entity.villager.yes master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 2 2

# Messages
title @s title [{"text":"⬥ EXCHANGE COMPLETE ⬥","color":"green","bold":true}]
title @s subtitle [{"text":"Life flows to you","color":"dark_green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @s [{"text":"   ⬥ EXCHANGE SUCCESS ⬥","color":"green","bold":true}]
tellraw @s [{"text":"  Sacrificed: ","color":"gray"},{"score":{"name":"@s","objective":"exchange_sacrificed"},"color":"red"},{"text":" HP","color":"gray"}]
tellraw @s [{"text":"  Drained: ","color":"gray"},{"score":{"name":"#drain_amount","objective":"exchange_health"},"color":"green"},{"text":" HP","color":"gray"}]
tellraw @s [{"text":"  • Life steal active: 8s","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# APPLY HEALING (based on drain amount)
execute if score #drain_amount exchange_health matches ..20 run effect give @s instant_health 1 1 true
execute if score #drain_amount exchange_health matches 21..30 run effect give @s instant_health 1 2 true
execute if score #drain_amount exchange_health matches 31..40 run effect give @s instant_health 1 3 true
execute if score #drain_amount exchange_health matches 41.. run effect give @s instant_health 1 4 true

# APPLY BUFFS (8 seconds)
effect give @s regeneration 8 2 true
effect give @s absorption 8 4 true
effect give @s strength 8 1 true

# DAMAGE ENEMIES NEARBY (the drain)
execute at @s as @e[distance=0.1..8,tag=!exchange_immune] run damage @s 30 magic by @p[tag=vital_exchange_active]

# Visual drain effect on enemies
execute at @s as @e[distance=0.1..8,tag=!exchange_immune] at @s run particle dust{color:[0.0,1.0,0.0],scale:3} ~ ~1 ~ 1 1 1 1 200 force
execute at @s as @e[distance=0.1..8,tag=!exchange_immune] at @s run particle happy_villager ~ ~1 ~ 1 1 1 0.5 150 force

# Green life stream from enemies to player
execute at @s as @e[distance=0.1..8,tag=!exchange_immune] at @s facing entity @p[tag=vital_exchange_active] feet run particle happy_villager ^ ^1 ^1 0.1 0.1 0.1 0.1 20 force
execute at @s as @e[distance=0.1..8,tag=!exchange_immune] at @s facing entity @p[tag=vital_exchange_active] feet run particle happy_villager ^ ^1 ^2 0.1 0.1 0.1 0.1 15 force

# Cleanup
tag @s remove vital_exchange_active
tag @s remove exchange_immune
scoreboard players reset @s exchange_window
scoreboard players reset @s exchange_sacrificed
scoreboard players reset @s exchange_drained
scoreboard players reset @s exchange_health
scoreboard players reset #drain_amount exchange_health