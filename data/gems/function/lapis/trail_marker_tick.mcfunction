# ==========================================
# ARCANE TRAIL MARKER - DAMAGE ZONE
# ==========================================

# Arcane trail visuals
particle dust{color:[0.0,0.0,1.0],scale:2} ~ ~0.5 ~ 1 0.5 1 0.3 15 force
particle enchant ~ ~0.5 ~ 0.8 0.5 0.8 1 20 force
particle dust{color:[0.2,0.2,1.0],scale:1.5} ~ ~0.1 ~ 1.2 0.1 1.2 0 10 force
particle glow ~ ~0.5 ~ 0.8 0.5 0.8 0.2 8 force

# Flowing arcane energy
particle dust{color:[0.0,0.5,1.0],scale:2} ~ ~0.3 ~ 0.5 0.3 0.5 0.1 5 force

# Damage enemies standing in trail (5 HP every 20 ticks = 1 second)
execute if score @s trail_lifetime matches 60 run function gems:lapis/trail_damage
execute if score @s trail_lifetime matches 40 run function gems:lapis/trail_damage
execute if score @s trail_lifetime matches 20 run function gems:lapis/trail_damage

# Countdown lifetime
scoreboard players remove @s trail_lifetime 1

# Remove when expired
execute if score @s trail_lifetime matches ..0 run function gems:lapis/trail_expire