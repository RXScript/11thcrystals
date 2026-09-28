# ==========================================
# HIT DETECTED - Execute voltage strike
# ==========================================

# Tag this specific entity as the victim
tag @s add voltage_victim

# Execute voltage strike on the charged player
execute as @p[tag=voltage_charging,distance=..20] run function gems:redstone/execute_voltage