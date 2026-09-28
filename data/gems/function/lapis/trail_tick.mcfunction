# ==========================================
# ARCANE TRAIL ACTIVE - FLOWING ENERGY
# ==========================================

# Display trail status
execute if score @s rush_trail_timer matches 30.. run title @s actionbar [{"text":"≈ TRAIL: ","color":"blue","bold":true},{"score":{"name":"@s","objective":"rush_trail_timer"},"color":"green"},{"text":" ticks","color":"gray"}]
execute if score @s rush_trail_timer matches 15..29 run title @s actionbar [{"text":"≈ TRAIL: ","color":"blue","bold":true},{"score":{"name":"@s","objective":"rush_trail_timer"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s rush_trail_timer matches ..14 run title @s actionbar [{"text":"≈ TRAIL: ","color":"blue","bold":true},{"score":{"name":"@s","objective":"rush_trail_timer"},"color":"red"},{"text":" ticks","color":"gray"}]

# Cleanup when done
execute if score @s rush_trail_timer matches ..0 run scoreboard players reset @s rush_trail_timer