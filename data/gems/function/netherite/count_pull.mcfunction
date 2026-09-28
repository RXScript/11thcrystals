# ==========================================
# COUNT THIS PULL
# ==========================================

# Add to anchor's count
execute as @p[tag=anchor_point] run scoreboard players add @s pulled_count 1

# Feedback
execute as @p[tag=anchor_point] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1.5 0.5