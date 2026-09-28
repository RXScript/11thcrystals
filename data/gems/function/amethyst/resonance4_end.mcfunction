# ==========================================
# RESONANCE ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Failure if rhythm was broken OR < 6 stacks
execute if score @s rhythm_broken matches 1 run function gems:amethyst/resonance_failure
execute if score @s rhythm_broken matches 0 if score @s resonance4_stacks matches 6.. run function gems:amethyst/resonance_success
execute if score @s rhythm_broken matches 0 if score @s resonance4_stacks matches ..5 run function gems:amethyst/resonance_failure