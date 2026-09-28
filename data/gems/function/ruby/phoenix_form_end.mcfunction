# ==========================================
# PHOENIX FORM ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Success: 6+ stacks
execute if score @s phoenix_stacks_elite matches 6.. run function gems:ruby/phoenix_rebirth
execute if score @s phoenix_stacks_elite matches ..5 run function gems:ruby/phoenix_death