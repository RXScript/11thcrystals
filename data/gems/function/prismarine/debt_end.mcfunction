# ==========================================
# DEBT ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Success: 50+ debt collected
execute if score @s debt_collected matches 30.. run function gems:prismarine/tidal_wave
execute if score @s debt_collected matches ..29 run function gems:prismarine/drown_death