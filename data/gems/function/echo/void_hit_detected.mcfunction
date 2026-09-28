# ==========================================
# HIT DETECTED - Execute void break
# ==========================================

# Tag this specific entity as the victim for the pulse
tag @s add void_pulse_victim

# Execute void break on the stepping player
execute as @p[tag=void_stepping,distance=..20] run function gems:echo/void_break