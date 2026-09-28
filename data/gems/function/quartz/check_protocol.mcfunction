# ==========================================
# CHECK PROTOCOL EXECUTION
# ==========================================

# If protocol already failed, ignore
execute if score @s protocol_failed matches 1 run return fail

# Get the hit entity
execute as @e[tag=efficiency_target,nbt={HurtTime:10s},limit=1,sort=nearest] run function gems:quartz/process_protocol_hit