# ==========================================
# HIT DETECTED - Tag this victim and execute
# ==========================================

# Tag this specific entity as the victim
tag @s add precision_victim

# Execute precision strike on the charged player
execute as @p[tag=precision_charged,distance=..20] run function gems:quartz/execute_precision