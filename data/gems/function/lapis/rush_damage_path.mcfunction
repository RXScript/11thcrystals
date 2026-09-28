# ==========================================
# DAMAGE ENEMIES IN DASH PATH
# ==========================================

# Rush visual explosion
particle explosion ~ ~1 ~ 3 3 3 0 40 force
particle dust{color:[0.0,0.0,1.0],scale:4} ~ ~1 ~ 3 3 3 1.5 400 force
particle enchant ~ ~1 ~ 2 2 2 3 500 force
particle block{block_state:"minecraft:lapis_block"} ~ ~1 ~ 2 2 2 1.5 300 force
particle glow ~ ~1 ~ 3 3 3 1 200 force

# Arcane wave effect
particle dust{color:[0.2,0.2,1.0],scale:3} ~ ~1 ~ 4 0.1 4 0 100 force
particle enchant ~ ~1 ~ 3 0.1 3 2 150 force

# RUSH SOUND
execute at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 2 2
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1.5
execute at @s run playsound entity.player.attack.sweep master @a ~ ~ ~ 2 2

# DAMAGE ENEMIES IN RADIUS (10 HP)
execute as @e[distance=..5,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] run damage @s 10 player_attack by @p[tag=lapis2_immune]
execute as @e[distance=..5,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] run effect give @s glowing 2 0 true

# Impact visuals on hit enemies
execute as @e[distance=..5,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] at @s run particle explosion ~ ~1 ~ 1 1 1 0 15 force
execute as @e[distance=..5,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] at @s run particle enchant ~ ~1 ~ 1 1 1 1.5 100 force
execute as @e[distance=..5,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] at @s run particle dust{color:[0.0,0.0,1.0],scale:3} ~ ~1 ~ 1 1 1 0.8 80 force

# Messages
tellraw @p[tag=lapis2_immune] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"blue","bold":true}]
tellraw @p[tag=lapis2_immune] [{"text":"   ⬥ ARCANE RUSH ⬥","color":"blue","bold":true}]
tellraw @p[tag=lapis2_immune] [{"text":"  Dash Damage: 10 HP","color":"red"}]
tellraw @p[tag=lapis2_immune] [{"text":"  Trail Damage: 5 HP/s (3s)","color":"dark_red"}]
tellraw @p[tag=lapis2_immune] [{"text":"  • Speed II (3s)","color":"green"}]
tellraw @p[tag=lapis2_immune] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"blue","bold":true}]

# Remove immunity tag after damage
tag @p remove lapis2_immune