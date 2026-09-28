# ==========================================
# PERFECT COUNTER - HIT DURING WINDOW!
# ==========================================

# Mark as triggered
scoreboard players set @s counter_triggered 1

# MASSIVE SUCCESS VISUALS
particle explosion_emitter ~ ~1 ~ 5 5 5 0 100 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 20 force
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 0 0 0 3 1000 force
particle end_rod ~ ~1 ~ 0 0 0 2 800 force
particle glow ~ ~1 ~ 5 5 5 1 500 force

# VICTORY SOUND
playsound entity.player.levelup master @a ~ ~ ~ 3 2
playsound block.anvil.land master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ PERFECT COUNTER ⬥","color":"aqua","bold":true}]
title @s subtitle [{"text":"Unbreakable!","color":"blue"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @s [{"text":"   ⬥ COUNTER SUCCESS ⬥","color":"aqua","bold":true}]
tellraw @s [{"text":"  Perfect timing!","color":"green"}]
tellraw @s [{"text":"  • Invulnerability: 3 seconds","color":"green"}]
tellraw @s [{"text":"  • Counter blast activated","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]

# APPLY BUFFS (brief but powerful)
effect give @s resistance 3 255 true
effect give @s strength 3 2 true
effect give @s absorption 3 9 true
effect give @s regeneration 5 2 true

# COUNTER BLAST - Damage all nearby enemies
execute at @s as @e[distance=0.1..6,tag=!counter_immune] run damage @s 25 player_attack by @p[tag=diamond_counter_ready]

# Knockback blast
execute at @s as @e[distance=0.1..6,tag=!counter_immune] at @s facing entity @p[tag=diamond_counter_ready] feet run tp @s ^ ^ ^-6
execute at @s as @e[distance=0.1..6,tag=!counter_immune] run effect give @s levitation 1 20 true

# Explosion visuals on enemies
execute at @s as @e[distance=0.1..6,tag=!counter_immune] at @s run particle explosion ~ ~1 ~ 2 2 2 0 20 force
execute at @s as @e[distance=0.1..6,tag=!counter_immune] at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 2 2 2 1 200 force

# Cleanup
tag @s remove diamond_counter_ready
tag @s remove counter_immune
scoreboard players reset @s counter_window
scoreboard players reset @s counter_triggered