# ==========================================
# SCREAM MARKED WAS HIT - Drop fragment
# ==========================================

# Check if already dropped fragment (can only drop once)
execute if score @s fragment_dropped matches 1 run return fail

# Mark as fragment dropped
scoreboard players set @s fragment_dropped 1

# Give fragment to hunter
execute as @a[tag=silent_hunter,limit=1,sort=nearest] run scoreboard players add @s scream_fragments 1

# MASSIVE visual feedback - fragment collection
particle squid_ink ~ ~1 ~ 1 1 1 1 100 force
particle sculk_soul ~ ~1 ~ 0.8 0.8 0.8 0.8 80 force
particle warped_spore ~ ~1 ~ 0.6 0.6 0.6 0.6 60 force
particle glow ~ ~1 ~ 0.5 0.5 0.5 0.4 40 force
particle smoke ~ ~1 ~ 0.4 0.4 0.4 0.2 30 force

# Sound - fragment collected
execute at @s run playsound block.sculk_sensor.clicking master @a ~ ~ ~ 2 2
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1.5 2
execute at @s run playsound particle.soul_escape master @a ~ ~ ~ 1 1.5

# Feedback to player
execute as @a[tag=silent_hunter,limit=1,sort=nearest] run title @s actionbar [{"text":"⬛ FRAGMENT: ","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"scream_fragments"},"color":"yellow"},{"text":"/8","color":"gray"}]