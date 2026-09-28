# ==========================================
# AUTO RELEASE - Time ran out
# ==========================================

# Remove item
clear @s *[custom_data={lapis_release:1b}]

# Auto release at current power level
execute if score @s arcane_power matches 80.. run function gems:lapis/peak_overflow
execute if score @s arcane_power matches 60..79 run function gems:lapis/good_overflow
execute if score @s arcane_power matches 40..59 run function gems:lapis/low_overflow
execute if score @s arcane_power matches ..39 run function gems:lapis/weak_overflow