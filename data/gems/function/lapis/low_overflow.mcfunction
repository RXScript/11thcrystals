# ==========================================
# LOW OVERFLOW - 40-59% POWER
# ==========================================

# LOW EXPLOSION
particle explosion ~ ~1 ~ 3 3 3 0 50 force
particle dust{color:[0.0,0.0,1.0],scale:3} ~ ~1 ~ 3 3 3 1 200 force
particle enchant ~ ~1 ~ 2 2 2 0.5 150 force

# SOUND
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 2 1

# LOW DAMAGE (18 HP)
execute at @s as @e[distance=0.1..18,tag=arcane_target] run damage @s 18 magic by @p[tag=arcane_charging]

# Small knockback
execute at @s as @e[distance=0.1..18,tag=arcane_target] at @s facing entity @p[tag=arcane_charging] feet run tp @s ^ ^ ^-4

# VERY MINOR BUFFS (5 seconds) + Small XP
effect give @s speed 5 0 true
experience add @s 5 levels

# Messages
title @s title [{"text":"⬥ LOW OVERFLOW ⬥","color":"yellow","bold":true}]
title @s subtitle [{"text":"Too early","color":"gold"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"yellow","bold":true}]
tellraw @s [{"text":"   ⬥ LOW RELEASE ⬥","color":"yellow","bold":true}]
tellraw @s [{"text":"  Power: ","color":"gray"},{"score":{"name":"@s","objective":"arcane_power"},"color":"yellow"},{"text":"%","color":"gray"}]
tellraw @s [{"text":"  Damage: 18 HP","color":"red"}]
tellraw @s [{"text":"  XP: +5 levels","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"yellow","bold":true}]

# Cleanup
tag @s remove arcane_charging
tag @s remove lapis_immune
tag @e remove arcane_target
scoreboard players reset @s arcane_charge_timer
scoreboard players reset @s arcane_power
scoreboard players reset @s overflow_released