# ==========================================
# MANUAL COLLAPSE
# ==========================================

# Remove item
clear @s *[custom_data={echo_detonate:1b}]

# Mark as detonated
scoreboard players set @s echo_detonated 1

# Collapse based on resonance level
execute if score @s echo_count matches 4.. if score @s resonance_level matches 80.. run function gems:echo/void_collapse
execute if score @s echo_count matches 4.. if score @s resonance_level matches 50..79 run function gems:echo/partial_collapse
execute if score @s echo_count matches 4.. if score @s resonance_level matches ..49 run function gems:echo/premature_collapse
execute if score @s echo_count matches ..3 run function gems:echo/insufficient_echoes