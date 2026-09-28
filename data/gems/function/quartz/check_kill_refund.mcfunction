# ==========================================
# CHECK IF VICTIM DIED - REFUND COOLDOWN
# ==========================================

# Check if the tagged victim still exists
execute unless entity @e[tag=precision_kill_check] run function gems:quartz/kill_confirmed

# Cleanup
tag @s remove precision_charged
tag @s remove quartz2_immune
tag @e remove precision_target
tag @e remove precision_victim
tag @e remove precision_kill_check
scoreboard players reset @s precision_window
scoreboard players reset @s precision_used
scoreboard players reset @s precision_kill_timer