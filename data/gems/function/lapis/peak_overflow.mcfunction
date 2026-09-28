# ==========================================
# PEAK OVERFLOW - 80-100%+ POWER!
# ==========================================

# MASSIVE ARCANE EXPLOSION
particle explosion_emitter ~ ~1 ~ 10 10 10 0 200 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 30 force
particle dust{color:[0.5,0.5,1.0],scale:4} ~ ~1 ~ 0 0 0 3 2000 force
particle enchant ~ ~1 ~ 0 0 0 5 1000 force
particle end_rod ~ ~1 ~ 0 0 0 2 800 force
particle glow ~ ~1 ~ 10 10 10 2 1000 force

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ PEAK OVERFLOW ⬥","color":"aqua","bold":true}]
title @s subtitle [{"text":"Perfect timing!","color":"blue"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @s [{"text":"   ⬥ OVERFLOW SUCCESS ⬥","color":"aqua","bold":true}]
tellraw @s [{"text":"  Power: ","color":"gray"},{"score":{"name":"@s","objective":"arcane_power"},"color":"gold"},{"text":"%","color":"gray"}]
tellraw @s [{"text":"  Arcane Damage: 40 HP","color":"red"}]
tellraw @s [{"text":"  • XP Bonus: +30 levels","color":"green"}]
tellraw @s [{"text":"  • Speed III (10s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]

# DAMAGE (40 HP)
execute at @s as @e[distance=0.1..18,tag=arcane_target] run damage @s 40 magic by @p[tag=arcane_charging]

# MASSIVE KNOCKBACK
execute at @s as @e[distance=0.1..18,tag=arcane_target] at @s facing entity @p[tag=arcane_charging] feet run tp @s ^ ^ ^-9
execute at @s as @e[distance=0.1..18,tag=arcane_target] run effect give @s levitation 2 2 true

# Apply arcane effects
execute at @s as @e[distance=0.1..18,tag=arcane_target] run effect give @s slowness 8 2 true
execute at @s as @e[distance=0.1..18,tag=arcane_target] run effect give @s glowing 8 0 true

# Explosion visuals on targets
execute at @s as @e[distance=0.1..18,tag=arcane_target] at @s run particle explosion ~ ~1 ~ 3 3 3 0 40 force
execute at @s as @e[distance=0.1..18,tag=arcane_target] at @s run particle dust{color:[0.5,0.5,1.0],scale:3} ~ ~1 ~ 2 2 2 1 300 force
execute at @s as @e[distance=0.1..18,tag=arcane_target] at @s run particle enchant ~ ~1 ~ 2 2 2 1 200 force

# BUFFS (10 seconds) + XP BONUS
effect give @s speed 10 2 true
effect give @s strength 10 1 true
effect give @s regeneration 10 1 true
experience add @s 30 levels

# Cleanup
tag @s remove arcane_charging
tag @s remove lapis_immune
tag @e remove arcane_target
scoreboard players reset @s arcane_charge_timer
scoreboard players reset @s arcane_power
scoreboard players reset @s overflow_released