# ==========================================
# ECHO MARKER RESONATING
# ==========================================

# Build resonance over time
scoreboard players add @s echo_resonance 1

# Visual effects (intensity increases)
execute if score @s echo_resonance matches ..20 run particle soul ~ ~0.5 ~ 0.3 0.5 0.3 0.02 3 force
execute if score @s echo_resonance matches 21..40 run particle soul ~ ~0.5 ~ 0.4 0.6 0.4 0.03 5 force
execute if score @s echo_resonance matches 41..60 run particle soul ~ ~0.5 ~ 0.5 0.8 0.5 0.05 8 force
execute if score @s echo_resonance matches 61.. run particle soul ~ ~0.5 ~ 0.6 1 0.6 0.08 12 force

# Sculk pulses
particle sculk_charge{roll:1.0} ~ ~0.5 ~ 0.3 0.5 0.3 0 2 force
particle dust{color:[0.3,0.0,0.5],scale:2} ~ ~0.5 ~ 0.4 0.6 0.4 0 3 force

# Pulsing sound (gets louder)
execute if score @s echo_resonance matches 40 run playsound block.sculk_sensor.clicking master @a ~ ~ ~ 0.5 0.8
execute if score @s echo_resonance matches 60 run playsound block.sculk_sensor.clicking master @a ~ ~ ~ 0.8 1
execute if score @s echo_resonance matches 80 run playsound block.sculk_sensor.clicking master @a ~ ~ ~ 1.2 1.2