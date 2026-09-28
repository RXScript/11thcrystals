# ==========================================
# GUARDIAN'S FOCUS CHANNELING
# ==========================================

# Charge increases every tick if not broken
execute if score @s focus_broken matches 0 run scoreboard players add @s focus_charge 1

# Charging beam particles (intensity increases)
execute if score @s focus_charge matches ..20 run particle bubble_pop ~ ~1 ~ 0.5 0.5 0.5 0.1 10 force
execute if score @s focus_charge matches 21..40 run particle bubble_pop ~ ~1 ~ 0.8 0.8 0.8 0.2 15 force
execute if score @s focus_charge matches 41..60 run particle bubble_pop ~ ~1 ~ 1 1 1 0.3 20 force
execute if score @s focus_charge matches 61.. run particle bubble_pop ~ ~1 ~ 1.5 1.5 1.5 0.4 30 force

# Eye glow effect
particle dust{color:[0.0,0.7,1.0],scale:2} ~ ~1.6 ~ 0.2 0.1 0.2 0 5 force
particle electric_spark ~ ~1.6 ~ 0.3 0.1 0.3 0 3 force

# Laser beam to target (visual only, gets stronger)
execute if entity @e[tag=laser_target] run function gems:prismarine/laser_beam_visual

# Ground anchor circle (shows you must stay still)
execute if score @s focus_broken matches 0 run particle dust{color:[0.0,0.7,1.0],scale:3} ~ ~0.1 ~ 1.5 0.1 1.5 0 20 force
execute if score @s focus_broken matches 0 run particle bubble_pop ~ ~0.1 ~ 1.5 0.1 1.5 0 15 force

# Display charge status
execute if score @s focus_broken matches 0 if score @s focus_charge matches ..39 run title @s actionbar [{"text":"⬥ CHARGING: ","color":"red","bold":true},{"score":{"name":"@s","objective":"focus_charge"},"color":"yellow"},{"text":"% | DON'T MOVE!","color":"red"}]
execute if score @s focus_broken matches 0 if score @s focus_charge matches 40..59 run title @s actionbar [{"text":"⬥ CHARGING: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"focus_charge"},"color":"yellow"},{"text":"% | HOLD!","color":"gold"}]
execute if score @s focus_broken matches 0 if score @s focus_charge matches 90.. run title @s actionbar [{"text":"⬥ CHARGED: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"focus_charge"},"color":"gold","bold":true},{"text":"% | READY!","color":"green"}]
execute if score @s focus_broken matches 1 run title @s actionbar [{"text":"⚠ FOCUS BROKEN ⚠","color":"red","bold":true}]

# Charging sound (pitch increases)
execute if score @s focus_charge matches 20 run playsound entity.guardian.ambient master @s ~ ~ ~ 1 1
execute if score @s focus_charge matches 40 run playsound entity.guardian.ambient master @s ~ ~ ~ 1.2 1.2
execute if score @s focus_charge matches 80 run playsound entity.guardian.ambient master @s ~ ~ ~ 1.5 1.5
execute if score @s focus_charge matches 90 run playsound block.conduit.activate master @s ~ ~ ~ 2 2