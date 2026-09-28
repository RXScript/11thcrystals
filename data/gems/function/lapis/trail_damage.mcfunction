# ==========================================
# TRAIL DAMAGES ENEMIES
# ==========================================

# Damage enemies in area (5 HP)
execute as @e[distance=..2,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] run damage @s 5 magic
execute as @e[distance=..2,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] run effect give @s slowness 1 0 true

# Damage visuals
execute as @e[distance=..2,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] at @s run particle enchant ~ ~1 ~ 0.5 0.8 0.5 0.5 30 force
execute as @e[distance=..2,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] at @s run particle dust{color:[0.0,0.0,1.0],scale:2} ~ ~1 ~ 0.5 0.8 0.5 0.3 20 force

# Damage sound
execute if entity @e[distance=..2,type=!#minecraft:arrows,type=!item,tag=!lapis2_immune] run playsound block.enchantment_table.use master @a ~ ~ ~ 1 2