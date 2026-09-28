# ==========================================
# TARGET HIT - APPLY FIRE ASPECT
# ==========================================

# Find the ember heart player nearby
execute if entity @p[tag=ember_heart_active,distance=..20] as @p[tag=ember_heart_active,distance=..20] run function gems:ruby/apply_fire_aspect