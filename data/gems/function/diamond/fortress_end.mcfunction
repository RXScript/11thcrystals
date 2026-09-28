# ==========================================
# FORTRESS ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
execute if score @s fortress_hits matches 1.. run function gems:diamond/fortress_success
execute if score @s fortress_hits matches 0 run function gems:diamond/fortress_failure