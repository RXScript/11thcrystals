# ==========================================
# CASCADE ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Failure if cascade was broken OR < 5 different targets
execute if score @s cascade_failed matches 1 run function gems:lapis/cascade_failure
execute if score @s cascade_failed matches 0 if score @s cascade_targets_hit matches 5.. run function gems:lapis/cascade_success
execute if score @s cascade_failed matches 0 if score @s cascade_targets_hit matches ..4 run function gems:lapis/cascade_failure