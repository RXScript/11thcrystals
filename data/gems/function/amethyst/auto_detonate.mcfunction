# ==========================================
# AUTO DETONATE - Time ran out
# ==========================================

# Detonate based on vibration count
execute if score @s vibration_count matches 80.. run function gems:amethyst/seismic_blast
execute if score @s vibration_count matches 40..79 run function gems:amethyst/medium_pulse
execute if score @s vibration_count matches ..39 run function gems:amethyst/weak_tremor