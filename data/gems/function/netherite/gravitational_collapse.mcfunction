# ==========================================
# ANCHOR ENDS - COLLAPSE
# ==========================================

# Check pulled count
execute if score @s pulled_count matches 4.. run function gems:netherite/mountain_collapse
execute if score @s pulled_count matches 2..3 run function gems:netherite/tremor
execute if score @s pulled_count matches ..1 run function gems:netherite/weak_quake