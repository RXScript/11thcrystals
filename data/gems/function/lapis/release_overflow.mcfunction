# ==========================================
# PLAYER RELEASED OVERFLOW MANUALLY
# ==========================================

# Remove release item
clear @s *[custom_data={lapis_release:1b}]

# Mark as released
scoreboard players set @s overflow_released 1

# Release based on power level
execute if score @s arcane_power matches 80.. run function gems:lapis/peak_overflow
execute if score @s arcane_power matches 60..79 run function gems:lapis/good_overflow
execute if score @s arcane_power matches 40..59 run function gems:lapis/low_overflow
execute if score @s arcane_power matches ..39 run function gems:lapis/weak_overflow