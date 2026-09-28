# ==========================================
# SUCCESS - DEVASTATING LASER!
# ==========================================

# MASSIVE LASER BLAST
execute at @e[tag=laser_target] run particle explosion_emitter ~ ~1 ~ 0 0 0 0 50 force
execute at @e[tag=laser_target] run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 10 force
execute at @e[tag=laser_target] run particle bubble_pop ~ ~1 ~ 0 0 0 10 2000 force
execute at @e[tag=laser_target] run particle dust{color:[0.0,0.7,1.0],scale:4} ~ ~1 ~ 0 0 0 3 1500 force
execute at @e[tag=laser_target] run particle electric_spark ~ ~1 ~ 0 0 0 5 1000 force
execute at @e[tag=laser_target] run particle glow ~ ~1 ~ 5 5 5 2 800 force

# Laser beam trail
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:4} ^ ^1.6 ^1 0 0 0 0 100 force
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:4} ^ ^1.6 ^2 0 0 0 0 100 force
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:4} ^ ^1.6 ^3 0 0 0 0 100 force
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:4} ^ ^1.6 ^4 0 0 0 0 100 force
execute facing entity @e[tag=laser_target,limit=1] eyes run particle dust{color:[0.0,0.7,1.0],scale:4} ^ ^1.6 ^5 0 0 0 0 100 force

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound entity.guardian.death master @a ~ ~ ~ 3 1
execute at @s run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 2

# Messages
title @s title [{"text":"⬥ LASER FIRED ⬥","color":"dark_aqua","bold":true}]
title @s subtitle [{"text":"Devastating!","color":"aqua"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"   ⬥ DEVASTATING LASER ⬥","color":"dark_aqua","bold":true}]
tellraw @s [{"text":"  Charge: ","color":"gray"},{"score":{"name":"@s","objective":"focus_charge"},"color":"gold"},{"text":"%","color":"gray"}]
tellraw @s [{"text":"  Laser Damage: 42 HP","color":"red"}]
tellraw @s [{"text":"  • Regeneration II (8s)","color":"green"}]
tellraw @s [{"text":"  • Absorption III (8s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_aqua","bold":true}]

# DAMAGE (42 HP - highest advanced)
execute as @e[tag=laser_target] run damage @s 42 magic by @p[tag=guardian_focusing]

# MASSIVE KNOCKBACK
execute as @e[tag=laser_target] at @s facing entity @p[tag=guardian_focusing] feet run tp @s ^ ^ ^-10
execute as @e[tag=laser_target] run effect give @s levitation 2 2 true

# Apply guardian curse
execute as @e[tag=laser_target] run effect give @s slowness 10 3 true
execute as @e[tag=laser_target] run effect give @s mining_fatigue 10 2 true
execute as @e[tag=laser_target] run effect give @s glowing 10 0 true

# BUFFS
effect give @s regeneration 8 1 true
effect give @s absorption 8 2 true

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