# ==========================================
# FAILURE - WEAK CURRENT
# ==========================================

# WEAK SPLASH
particle explosion ~ ~1 ~ 2 2 2 0 30 force
particle falling_water ~ ~1 ~ 2 2 2 0.5 100 force
particle smoke ~ ~1 ~ 2 2 2 0.3 80 force

# HARSH SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 2 1
execute at @s run playsound entity.villager.no master @s ~ ~ ~ 2 0.5

# WEAK DAMAGE (10 HP)
execute at @s as @e[distance=0.1..18,tag=laser_target] run damage @s 10 indirect_magic by @p[tag=guardian_focusing]

# PUNISHMENT DEBUFFS (8 seconds)
effect give @s slowness 8 1 true
effect give @s weakness 8 1 true
effect give @s hunger 8 1 true

# Messages
title @s title [{"text":"⬥ INSUFFICIENT DEBT ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"The ocean is not satisfied","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ COLLECTION FAILED ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Debt: ","color":"gray"},{"score":{"name":"@s","objective":"focus_charge"},"color":"yellow"},{"text":"%","color":"gray"}]
tellraw @s [{"text":"  Not enough damage taken!","color":"red"}]
tellraw @s [{"text":"  Weak Damage: 10 HP","color":"dark_red"}]
tellraw @s [{"text":"  Debuffs: 8 seconds","color":"red"}]
tellraw @s [{"text":"  • Slowness II","color":"dark_red"}]
tellraw @s [{"text":"  • Weakness II","color":"dark_red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# Cleanup
tag @s remove guardian_focusing
tag @s remove prismarine_immune
tag @e remove laser_target
scoreboard players reset @s focus_timer
scoreboard players reset @s focus_charge
scoreboard players reset @s focus_broken
scoreboard players reset @s focus_pos_x
scoreboard players reset @s focus_pos_y
scoreboard players reset @s focus_pos_z