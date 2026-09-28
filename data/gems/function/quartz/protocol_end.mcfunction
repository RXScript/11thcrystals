# ==========================================
# PROTOCOL ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Success: Hit ALL targets exactly once AND protocol not failed
execute if score @s protocol_failed matches 1 run function gems:quartz/protocol_failure
execute if score @s protocol_failed matches 0 if score @s targets_hit_elite >= @s efficiency_target_total run function gems:quartz/protocol_success
execute if score @s protocol_failed matches 0 unless score @s targets_hit_elite >= @s efficiency_target_total run function gems:quartz/protocol_failure