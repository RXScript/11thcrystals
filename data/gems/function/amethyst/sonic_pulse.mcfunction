# SONIC PULSE - Expanding wave of sound damage
particle sonic_boom ~ ~1 ~ 0 0 0 0 5 force
particle portal ~ ~1 ~ 8 1 8 1 100 force
particle dragon_breath ~ ~1 ~ 6 1 6 0.5 80 force
particle sweep_attack ~ ~1 ~ 8 0.1 8 0.5 50 force

# Base damage: 12 + (resonance_stacks * 2)
execute as @e[distance=0.1..35,tag=resonance_target] run damage @s 12 player_attack by @p[tag=resonance_master]

# Add resonance stack amplification damage
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=1..}] run damage @s 2 player_attack by @p[tag=resonance_master]
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=2..}] run damage @s 2 player_attack by @p[tag=resonance_master]
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=3..}] run damage @s 2 player_attack by @p[tag=resonance_master]
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=4..}] run damage @s 2 player_attack by @p[tag=resonance_master]
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=5..}] run damage @s 2 player_attack by @p[tag=resonance_master]
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=6..}] run damage @s 2 player_attack by @p[tag=resonance_master]
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=7..}] run damage @s 2 player_attack by @p[tag=resonance_master]
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=8..}] run damage @s 2 player_attack by @p[tag=resonance_master]
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=9..}] run damage @s 2 player_attack by @p[tag=resonance_master]
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=10..}] run damage @s 2 player_attack by @p[tag=resonance_master]

# Increase resonance stacks (max 10)
execute as @e[distance=0.1..35,tag=resonance_target,scores={resonance_stacks=..9}] run scoreboard players add @s resonance_stacks 1

# Track total damage
scoreboard players add @s total_damage_dealt 12

# Visual feedback on targets
execute as @e[distance=0.1..35,tag=resonance_target] at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 2 force
execute as @e[distance=0.1..35,tag=resonance_target] at @s run particle portal ~ ~1 ~ 0.5 0.8 0.5 0.5 20 force

# Knockback pulse
execute at @s as @e[distance=0.1..35,tag=resonance_target] at @s facing entity @p[tag=resonance_master] feet run tp @s ^ ^ ^-0.3

# Sound
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 2 1.2
execute at @s run playsound block.amethyst_block.chime master @a ~ ~ ~ 1.5 0.5

# Display damage to caster
title @s actionbar [{"text":"💜 RESONANCE PULSE ","color":"light_purple","bold":true},{"text":"[Targets: ","color":"gray"},{"score":{"name":"@e[tag=resonance_target,limit=1]","objective":"resonance_stacks"},"color":"yellow"},{"text":"x stacks]","color":"gray"}]