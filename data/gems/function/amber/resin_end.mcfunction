# ==========================================
# RESIN ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Success: 40+ damage absorbed
execute if score @s damage_stored matches 40.. run function gems:amber/resin_burst
execute if score @s damage_stored matches ..39 run function gems:amber/resin_crush

kill @e[tag=amber_fossil]