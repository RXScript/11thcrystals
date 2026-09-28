# ==========================================
# ADD VIBRATION TO NEAREST PLAYER
# ==========================================

# Add vibration to nearest sensing player
execute as @p[tag=seismic_sensing,distance=..20] run scoreboard players add @s vibration_count 1

# Visual feedback
particle sculk_charge{roll:1.0} ~ ~0.5 ~ 0.3 0.3 0.3 0 5 force
particle dust{color:[0.5,0.0,0.5],scale:1.5} ~ ~0.5 ~ 0.2 0.2 0.2 0 3 force

# Subtle sound
execute at @s run playsound block.sculk_sensor.clicking master @p[tag=seismic_sensing,distance=..20] ~ ~ ~ 0.3 2