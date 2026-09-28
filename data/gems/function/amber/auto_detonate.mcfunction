# ==========================================
# AUTO DETONATE - Time ran out
# ==========================================

# Remove item
clear @s *[custom_data={amber_detonate:1b}]

# Detonate
execute if score @s trapped_count matches 3.. run function gems:amber/trap_success
execute if score @s trapped_count matches ..2 run function gems:amber/trap_fail