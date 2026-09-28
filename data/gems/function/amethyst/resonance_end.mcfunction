# ==========================================
# FINAL CRESCENDO - REALITY SHATTERS
# ==========================================

# CATASTROPHIC SONIC EXPLOSION
particle explosion_emitter ~ ~1 ~ 12 12 12 0 150 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 30 force
particle sonic_boom ~ ~1 ~ 0 0 0 0 100 force
particle portal ~ ~1 ~ 0 0 0 5 2000 force
particle dragon_breath ~ ~1 ~ 12 12 12 2 1500 force
particle witch ~ ~1 ~ 10 10 10 1.5 1000 force
particle end_rod ~ ~1 ~ 0 0 0 3 1000 force
particle reverse_portal ~ ~1 ~ 10 10 10 2 1200 force

# Final damage based on resonance stacks (10-80 damage per target)
execute as @e[tag=resonance_target,scores={resonance_stacks=0}] run damage @s 20 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=1}] run damage @s 28 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=2}] run damage @s 36 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=3}] run damage @s 44 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=4}] run damage @s 52 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=5}] run damage @s 60 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=6}] run damage @s 68 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=7}] run damage @s 76 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=8}] run damage @s 84 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=9}] run damage @s 92 player_attack by @p[tag=resonance_master]
execute as @e[tag=resonance_target,scores={resonance_stacks=10..}] run damage @s 100 player_attack by @p[tag=resonance_master]

# Massive knockback (reality rejection)
execute as @e[tag=resonance_target] at @s facing entity @p[tag=resonance_master] feet run tp @s ^ ^ ^-12
execute as @e[tag=resonance_target] run effect give @s levitation 2 2 true

# Explosion visuals on each target
execute as @e[tag=resonance_target] at @s run particle explosion_emitter ~ ~1 ~ 3 3 3 0 20 force
execute as @e[tag=resonance_target] at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 10 force
execute as @e[tag=resonance_target] at @s run particle portal ~ ~1 ~ 2 2 2 1 200 force

kill @e[type=armor_stand,tag=amethyst_spike]

# CATASTROPHIC SOUND FINALE
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 1.0
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 1.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.beacon.deactivate master @a ~ ~ ~ 3 1
execute at @s run playsound entity.ender_dragon.death master @a ~ ~ ~ 2 0.5

# Messages
title @s title [{"text":"⬥ CRESCENDO COMPLETE ⬥","color":"gray","bold":true}]
title @s subtitle [{"text":"Total Damage: ","color":"dark_gray"},{"score":{"name":"@s","objective":"total_damage_dealt"},"color":"yellow"},{"text":" HP","color":"dark_gray"}]
tellraw @s [{"text":"The resonance collapses. You dealt ","color":"gray"},{"score":{"name":"@s","objective":"total_damage_dealt"},"color":"yellow"},{"text":" total damage.","color":"gray"}]

# Notify previously marked players
execute as @e[tag=resonance_target,type=player] run title @s title {"text":"☠ SHATTERED ☠","color":"red","bold":true}
execute as @e[tag=resonance_target,type=player] run title @s subtitle {"text":"Your atoms collapsed","color":"dark_red"}

# Remove all tags
tag @s remove resonant_collapse
tag @s remove resonance_master
tag @s remove sonic_immune
tag @e remove resonance_target
scoreboard players reset @e resonance_stacks

# Reset scores
scoreboard players set @s total_damage_dealt 0
scoreboard players set @s resonance_kills 0