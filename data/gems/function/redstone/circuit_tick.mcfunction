# ==========================================
# DEAD CIRCUIT ACTIVE - TARGET DESYNCED
# ==========================================

# Red energy particles around player
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 15 force
particle electric_spark ~ ~1 ~ 1 1 1 0.2 8 force

# Beam to target
execute at @s facing entity @e[tag=circuit_marked,limit=1] eyes run particle dust{color:[1.0,0.0,0.0],scale:1.5} ^ ^1 ^1 0.1 0.1 0.1 0 3 force
execute at @s facing entity @e[tag=circuit_marked,limit=1] eyes run particle dust{color:[1.0,0.0,0.0],scale:1.5} ^ ^1 ^2 0.1 0.1 0.1 0 3 force
execute at @s facing entity @e[tag=circuit_marked,limit=1] eyes run particle dust{color:[1.0,0.0,0.0],scale:1.5} ^ ^1 ^3 0.1 0.1 0.1 0 3 force
execute at @s facing entity @e[tag=circuit_marked,limit=1] eyes run particle dust{color:[1.0,0.0,0.0],scale:1.5} ^ ^1 ^4 0.1 0.1 0.1 0 3 force

# Red flicker on target (desync effect)
execute as @e[tag=circuit_marked,limit=1] at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 0.8 1 0.8 0.5 20 force
execute as @e[tag=circuit_marked,limit=1] at @s run particle electric_spark ~ ~1 ~ 0.5 0.8 0.5 0.1 10 force
execute as @e[tag=circuit_marked,limit=1] at @s run particle smoke ~ ~1 ~ 0.3 0.5 0.3 0 5 force

# Circuit breaking particles
execute as @e[tag=circuit_marked,limit=1] at @s run particle dust{color:[0.5,0.0,0.0],scale:2} ~ ~0.5 ~ 0.5 0.5 0.5 0 5 force

# Display status
execute if score @s circuit_window matches 20.. run title @s actionbar [{"text":"⬥ CIRCUIT: ","color":"red","bold":true},{"score":{"name":"@s","objective":"circuit_window"},"color":"green"},{"text":" ticks","color":"gray"}]
execute if score @s circuit_window matches 10..19 run title @s actionbar [{"text":"⬥ CIRCUIT: ","color":"red","bold":true},{"score":{"name":"@s","objective":"circuit_window"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s circuit_window matches ..9 run title @s actionbar [{"text":"⚠ CIRCUIT: ","color":"red","bold":true},{"score":{"name":"@s","objective":"circuit_window"},"color":"red"},{"text":" ticks!","color":"gray"}]

# Warning sounds
execute if score @s circuit_window matches 20 run playsound block.note_block.hat master @s ~ ~ ~ 1.5 2
execute if score @s circuit_window matches 10 run playsound block.note_block.hat master @s ~ ~ ~ 2 2
execute if score @s circuit_window matches 5 run playsound entity.elder_guardian.curse master @s ~ ~ ~ 1 2