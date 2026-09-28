# ============================================
# ENHANCED CRYSTAL AWAKENING - FINISH TRIGGER
# ============================================

# When timer ends (200 ticks = 10 seconds of rolling)
execute if score @s roulette_timer matches 200 run function gems:roll/reveal
