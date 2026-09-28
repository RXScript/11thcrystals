# ==========================================
# SYSTEM OVERLOAD - CATASTROPHIC FAILURE
# ==========================================

# MASSIVE OVERLOAD EXPLOSION
particle explosion_emitter ~ ~1 ~ 18 18 18 0 300 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 60 force
particle firework ~ ~1 ~ 0 0 0 6 6000 force
particle electric_spark ~ ~1 ~ 0 0 0 5 5000 force
particle end_rod ~ ~1 ~ 0 0 0 4 4000 force
particle glow ~ ~1 ~ 18 18 18 2 2000 force

# System crash wave
particle explosion ~ ~1 ~ 20 0.1 20 1 400 force

# Final damage based on hits landed (30-50 damage)
execute if score @s rapid_damage_dealt matches ..300 as @e[tag=time_slowed] run damage @s 30 player_attack by @p[tag=overclock_master]
execute if score @s rapid_damage_dealt matches 301..450 as @e[tag=time_slowed] run damage @s 40 player_attack by @p[tag=overclock_master]
execute if score @s rapid_damage_dealt matches 451.. as @e[tag=time_slowed] run damage @s 50 player_attack by @p[tag=overclock_master]

# Massive knockback overload
execute as @e[tag=time_slowed] at @s facing entity @p[tag=overclock_master] feet run tp @s ^ ^ ^-12
execute as @e[tag=time_slowed] run effect give @s levitation 2 2 true

# Explosion on each target
execute as @e[tag=time_slowed] at @s run particle explosion_emitter ~ ~1 ~ 6 6 6 0 50 force
execute as @e[tag=time_slowed] at @s run particle electric_spark ~ ~1 ~ 4 4 4 2 300 force
execute as @e[tag=time_slowed] at @s run particle firework ~ ~1 ~ 3 3 3 1 200 force

# SYSTEM FAILURE SOUND
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 2
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 3 1
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 2 2
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 0.5

# Messages
title @s title [{"text":"⬥ SYSTEM OVERLOAD ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Total Damage: ","color":"dark_gray"},{"score":{"name":"@s","objective":"rapid_damage_dealt"},"color":"yellow"},{"text":" HP","color":"dark_gray"}]
tellraw @s [{"text":"The overclock fails. You dealt ","color":"gray"},{"score":{"name":"@s","objective":"rapid_damage_dealt"},"color":"yellow"},{"text":" rapid damage.","color":"gray"}]

# Notify targets
execute as @e[tag=time_slowed,type=player] run title @s title {"text":"☠ OVERLOAD ☠","color":"red","bold":true}
execute as @e[tag=time_slowed,type=player] run title @s subtitle {"text":"System critical failure","color":"dark_red"}

# Remove all tags
tag @s remove overclock_protocol
tag @s remove overclock_master
tag @s remove overclock_immune
tag @e remove time_slowed
scoreboard players reset @e overclock_hits

# Reset scores
scoreboard players set @s rapid_damage_dealt 0
scoreboard players set @s overclock_kills 0