# ==========================================
# AUTO FIRE - Time's up
# ==========================================

# Remove item
clear @s *[custom_data={fire_laser:1b}]

# Fire based on charge level
execute if score @s focus_charge matches 90.. if score @s focus_broken matches 0 run function gems:prismarine/devastating_laser
execute if score @s focus_charge matches 40..59 if score @s focus_broken matches 0 run function gems:prismarine/charged_laser
execute if score @s focus_charge matches 20..39 if score @s focus_broken matches 0 run function gems:prismarine/weak_laser
execute if score @s focus_charge matches ..19 run function gems:prismarine/fizzle
execute if score @s focus_broken matches 1 run function gems:prismarine/fizzle