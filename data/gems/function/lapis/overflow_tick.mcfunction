# ==========================================
# ARCANE POWER CHARGING
# ==========================================

# Blue arcane energy swirling (intensity increases with power)
execute if score @s arcane_power matches ..20 run particle dust{color:[0.0,0.0,1.0],scale:2} ~ ~1 ~ 1 1 1 0.3 10 force
execute if score @s arcane_power matches 21..40 run particle dust{color:[0.0,0.0,1.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 20 force
execute if score @s arcane_power matches 41..60 run particle dust{color:[0.0,0.5,1.0],scale:3} ~ ~1 ~ 2 2 2 0.7 30 force
execute if score @s arcane_power matches 61..80 run particle dust{color:[0.3,0.3,1.0],scale:3} ~ ~1 ~ 2.5 2.5 2.5 0.9 40 force
execute if score @s arcane_power matches 81.. run particle dust{color:[0.5,0.5,1.0],scale:4} ~ ~1 ~ 3 3 3 1.2 60 force

# Enchantment particles
particle enchant ~ ~1 ~ 1 1 1 0.5 15 force

# Rising energy particles
particle end_rod ~ ~0.5 ~ 0.5 0.5 0.5 0.1 8 force
particle glow ~ ~1 ~ 1 1 1 0.05 10 force

# Ground charging circle (expands with power)
execute if score @s arcane_power matches ..40 run particle dust{color:[0.0,0.0,1.0],scale:2} ~ ~0.1 ~ 2 0.1 2 0 15 force
execute if score @s arcane_power matches 41..80 run particle dust{color:[0.0,0.5,1.0],scale:3} ~ ~0.1 ~ 3 0.1 3 0 25 force
execute if score @s arcane_power matches 81.. run particle dust{color:[0.5,0.5,1.0],scale:4} ~ ~0.1 ~ 4 0.1 4 0 40 force

# Show arcane targets with increasing glow
execute at @s as @e[distance=0.1..18,tag=arcane_target] at @s run particle enchant ~ ~1.5 ~ 0.2 0.4 0.2 0 5 force
execute if score @s arcane_power matches 81.. at @s as @e[distance=0.1..18,tag=arcane_target] at @s run particle dust{color:[0.5,0.5,1.0],scale:2} ~ ~1 ~ 0.4 0.8 0.4 0 10 force

# Display power percentage with color coding
execute if score @s arcane_power matches ..39 run title @s actionbar [{"text":"⬥ POWER: ","color":"red","bold":true},{"score":{"name":"@s","objective":"arcane_power"},"color":"yellow"},{"text":"% | TOO WEAK","color":"dark_red"}]
execute if score @s arcane_power matches 40..59 run title @s actionbar [{"text":"⬥ POWER: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"arcane_power"},"color":"yellow"},{"text":"% | LOW","color":"gold"}]
execute if score @s arcane_power matches 60..79 run title @s actionbar [{"text":"⬥ POWER: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"arcane_power"},"color":"yellow"},{"text":"% | GOOD","color":"green"}]
execute if score @s arcane_power matches 80..100 run title @s actionbar [{"text":"⬥ POWER: ","color":"green","bold":true},{"score":{"name":"@s","objective":"arcane_power"},"color":"gold","bold":true},{"text":"% | PEAK!","color":"green","bold":true}]
execute if score @s arcane_power matches 101.. run title @s actionbar [{"text":"⬥ OVERFLOW: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"arcane_power"},"color":"gold","bold":true},{"text":"% | OVERCHARGED!","color":"light_purple","bold":true}]

# Sound feedback at power levels
execute if score @s arcane_power matches 20 run playsound block.enchantment_table.use master @s ~ ~ ~ 1 1
execute if score @s arcane_power matches 40 run playsound block.enchantment_table.use master @s ~ ~ ~ 1 1.2
execute if score @s arcane_power matches 60 run playsound block.enchantment_table.use master @s ~ ~ ~ 1.5 1.4
execute if score @s arcane_power matches 80 run playsound block.enchantment_table.use master @s ~ ~ ~ 2 1.6
execute if score @s arcane_power matches 80 run playsound block.note_block.chime master @s ~ ~ ~ 2 2
execute if score @s arcane_power matches 100 run playsound block.beacon.power_select master @s ~ ~ ~ 2 2

# Pulse sound
execute if score @s arcane_charge_timer matches 80 run playsound block.enchantment_table.use master @s ~ ~ ~ 1 1.5
execute if score @s arcane_charge_timer matches 60 run playsound block.enchantment_table.use master @s ~ ~ ~ 1.5 1.5
execute if score @s arcane_charge_timer matches 40 run playsound block.enchantment_table.use master @s ~ ~ ~ 2 2
execute if score @s arcane_charge_timer matches 20 run playsound block.note_block.pling master @s ~ ~ ~ 2 2