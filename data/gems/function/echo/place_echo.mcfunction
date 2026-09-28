# ==========================================
# PLACE VOID ECHO AT ENEMY LOCATION
# ==========================================

# Summon invisible marker at this location
summon marker ~ ~ ~ {Tags:["void_echo_marker","new_echo"]}

# Initialize marker scores
scoreboard players set @e[tag=new_echo] echo_resonance 0

# Tag enemy
tag @s add has_void_echo

# Visual - dark void sphere
particle soul ~ ~1 ~ 0.5 0.8 0.5 0.1 40 force
particle sculk_charge{roll:5.0} ~ ~1 ~ 0.3 0.5 0.3 0 30 force
particle dust{color:[0.3,0.0,0.5],scale:3} ~ ~1 ~ 0.4 0.6 0.4 0 50 force

# Sound
execute at @s run playsound particle.soul_escape master @a ~ ~ ~ 1.5 0.5
execute at @s run playsound block.sculk_sensor.clicking master @a ~ ~ ~ 1.5 1

# Remove new tag
tag @e[tag=new_echo] remove new_echo