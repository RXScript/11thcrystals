# ==========================================
# FAILURE - SPARKS BACKFIRE!
# ==========================================

# BACKFIRE EXPLOSION
particle explosion ~ ~1 ~ 3 3 3 0 60 force
particle flame ~ ~1 ~ 3 3 3 0.5 200 force
particle smoke ~ ~1 ~ 3 3 3 0.3 150 force
particle lava ~ ~1 ~ 2 2 2 0 50 force

# HARSH SOUND
execute at @s run playsound entity.blaze.death master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.generic.burn master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# BACKFIRE DAMAGE (10 HP to self)
execute at @s run damage @s 10 on_fire
data merge entity @s {Fire:100s}

# WEAK DAMAGE to enemies (only 12 HP)
execute at @s as @e[distance=0.1..20,tag=spark_marked] run damage @s 12 on_fire by @p[tag=ruby_igniter]

# Small knockback
execute at @s as @e[distance=0.1..20,tag=spark_marked] at @s facing entity @p[tag=ruby_igniter] feet run tp @s ^ ^ ^-3

# PUNISHMENT DEBUFFS (8 seconds)
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true
effect give @s hunger 8 1 true

# Messages
title @s title [{"text":"⬥ BACKFIRE ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Not enough sparks!","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ IGNITION FAILURE ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Sparks Ignited: ","color":"gray"},{"score":{"name":"@s","objective":"sparks_ignited"},"color":"yellow"},{"text":"/6","color":"gray"}]
tellraw @s [{"text":"  Required: 6+ sparks","color":"red"}]
tellraw @s [{"text":"  Backfire: -10 HP","color":"dark_red"}]
tellraw @s [{"text":"  Weak Damage: 12 HP only","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove ruby_igniter
tag @s remove ruby_immune
tag @e remove spark_marked
scoreboard players reset @e spark_ignited
scoreboard players reset @s ignition_timer
scoreboard players reset @s sparks_ignited
scoreboard players reset @s spark_total