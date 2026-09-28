# ==========================================
# GRAVITY ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Success: 6+ enemies within 5 blocks
execute if score @s gravity_pulled matches 6.. run function gems:netherite/reality_collapse
execute if score @s gravity_pulled matches ..5 run function gems:netherite/weight_crush