# ==========================================
# GOOD OVERFLOW - 60-79% POWER
# ==========================================

# GOOD EXPLOSION
particle explosion ~ ~1 ~ 6 6 6 0 100 force
particle dust{color:[0.0,0.5,1.0],scale:4} ~ ~1 ~ 4 4 4 1.5 500 force
particle enchant ~ ~1 ~ 3 3 3 1 300 force

# SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 2 1.5
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1.5

# GOOD DAMAGE (28 HP)
execute at @s as @e[distance=0.1..18,tag=arcane_target] run damage @s 28 magic by @p[tag=arcane_charging]

# Medium knockback
execute at @s as @e[distance=0.1..18,tag=arcane_target] at @s facing entity @p[tag=arcane_charging] feet run tp @s ^ ^ ^-6

# MINOR BUFFS (8 seconds) + XP
effect give @s speed 8 1 true
effect give @s strength 8 0 true
experience add @s 15 levels

# Messages
title @s title [{"text":"⬥ GOOD OVERFLOW ⬥","color":"blue","bold":true}]
title @s subtitle [{"text":"Decent timing","color":"dark_blue"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"blue","bold":true}]
tellraw @s [{"text":"   ⬥ GOOD RELEASE ⬥","color":"blue","bold":true}]
tellraw @s [{"text":"  Power: ","color":"gray"},{"score":{"name":"@s","objective":"arcane_power"},"color":"yellow"},{"text":"%","color":"gray"}]
tellraw @s [{"text":"  Damage: 28 HP","color":"red"}]
tellraw @s [{"text":"  XP: +15 levels","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"blue","bold":true}]

# Cleanup
tag @s remove arcane_charging
tag @s remove lapis_immune
tag @e remove arcane_target
scoreboard players reset @s arcane_charge_timer
scoreboard players reset @s arcane_power
scoreboard players reset @s overflow_released