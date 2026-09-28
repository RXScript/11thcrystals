# ==========================================
# OVERCHARGE ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Success: 7+ discharges
execute if score @s discharge_hits matches 7.. run function gems:redstone/chain_lightning
execute if score @s discharge_hits matches ..6 run function gems:redstone/electrical_burnout