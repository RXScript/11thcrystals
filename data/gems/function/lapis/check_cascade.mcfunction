# ==========================================
# CHECK CASCADE VALIDITY
# ==========================================

# If cascade already failed, ignore
execute if score @s cascade_failed matches 1 run return fail

# Get the hit entity
execute as @e[tag=cascade_marked,nbt={HurtTime:10s},limit=1,sort=nearest] run function gems:lapis/process_hit