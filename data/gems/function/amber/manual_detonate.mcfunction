# ==========================================
# MANUAL DETONATION
# ==========================================

# Remove item
clear @s *[custom_data={amber_detonate:1b}]

# Mark as detonated
scoreboard players set @s trap_detonated 1

# Detonate based on trapped count
execute if score @s trapped_count matches 3.. run function gems:amber/trap_success
execute if score @s trapped_count matches ..2 run function gems:amber/trap_fail