# ==========================================
# SILENT HUNT ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Success: 8+ fragments
execute if score @s scream_fragments matches 8.. run function gems:echo/silence_detonates
execute if score @s scream_fragments matches ..7 run function gems:echo/scream_overwhelm