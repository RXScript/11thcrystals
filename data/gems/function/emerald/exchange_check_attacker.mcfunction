# ==========================================
# PLAYER WAS HIT - Check if they hit back
# ==========================================

# This runs when player takes damage
# We need to detect if THEY damaged someone in this same tick

# Mark that we should check for damage dealt
tag @s add exchange_checking

# Run check next tick
schedule function gems:emerald/exchange_process_hit 1t