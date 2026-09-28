# ==========================================
# VERIFY IF TARGET WAS KILLED
# ==========================================

# Check if any precision target died (no longer exists or health <= 0)
execute unless entity @e[tag=precision_target,distance=..20] run function gems:quartz/kill_confirmed

# Cleanup if no kill
tag @s remove precision_charged
tag @s remove quartz_immune
tag @e remove precision_target
scoreboard players reset @s precision_window
scoreboard players reset @s precision_used
scoreboard players reset @s target_health