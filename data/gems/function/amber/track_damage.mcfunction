# ==========================================
# SIMPLE DAMAGE TRACKING - JUST WORKS
# ==========================================

# Get total health (health + absorption)
execute store result score #current_health damage_stored run data get entity @s Health 1
execute store result score #current_absorption damage_stored run data get entity @s AbsorptionAmount 1
scoreboard players operation #current_total damage_stored = #current_health damage_stored
scoreboard players operation #current_total damage_stored += #current_absorption damage_stored

# Calculate damage (previous total - current total)
scoreboard players operation #damage_diff damage_stored = @s health_before
scoreboard players operation #damage_diff damage_stored -= #current_total damage_stored

# Add damage to stored (only if positive)
execute if score #damage_diff damage_stored matches 1.. run scoreboard players operation @s damage_stored += #damage_diff damage_stored

# Visual feedback
execute if score #damage_diff damage_stored matches 1.. run particle falling_honey ~ ~1 ~ 1 1 1 0.5 50 force
execute if score #damage_diff damage_stored matches 1.. run particle dust{color:[1.0,0.7,0.0],scale:2} ~ ~1 ~ 0.8 0.8 0.8 0.3 40 force
execute if score #damage_diff damage_stored matches 1.. run playsound block.honey_block.slide master @a ~ ~ ~ 1.5 1
execute if score #damage_diff damage_stored matches 1.. run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1.5

# Update baseline (store current total for next check)
scoreboard players operation @s health_before = #current_total damage_stored