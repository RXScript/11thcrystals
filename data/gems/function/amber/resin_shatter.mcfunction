# ==========================================
# RESIN SHATTERS - PRESERVED TIME ENDS
# ==========================================

# MASSIVE SHATTER EXPLOSION
particle explosion ~ ~1 ~ 2 2 2 0 40 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 8 force
particle block{block_state:"minecraft:honey_block"} ~ ~1 ~ 2 2 2 2 400 force
particle block{block_state:"minecraft:glass"} ~ ~1 ~ 2 2 2 1.5 300 force
particle item{item:"minecraft:honey_bottle"} ~ ~1 ~ 1.5 1.5 1.5 1 200 force
particle dust{color:[1.0,0.7,0.0],scale:4} ~ ~1 ~ 2 2 2 1 250 force

# Amber shards
particle dust{color:[0.8,0.4,0.0],scale:3} ~ ~1 ~ 2 2 2 1 150 force
particle crit ~ ~1 ~ 2 2 2 0.5 100 force

# SHATTER SOUND
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 1
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.honey_block.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.slime.death master @a ~ ~ ~ 2 1

# SHATTER DAMAGE (8 HP)
damage @s 8 player_attack by @p[tag=resin_binding,distance=..30]

# KNOCKBACK
execute at @s facing entity @p[tag=resin_binding,distance=..30] feet run tp @s ^ ^ ^-3

# Messages to binder
execute as @p[tag=resin_binding,distance=..30] run title @s title [{"text":"⬥ SHATTER! ⬥","color":"gold","bold":true}]
execute as @p[tag=resin_binding,distance=..30] run title @s subtitle [{"text":"Amber breaks","color":"dark_red"}]
execute as @p[tag=resin_binding,distance=..30] run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
execute as @p[tag=resin_binding,distance=..30] run tellraw @s [{"text":"   ⬥ RESIN SHATTERED ⬥","color":"gold","bold":true}]
execute as @p[tag=resin_binding,distance=..30] run tellraw @s [{"text":"  Shatter Damage: 8 HP","color":"red"}]
execute as @p[tag=resin_binding,distance=..30] run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# Cleanup
tag @s remove resin_bound
scoreboard players reset @s resin_duration