# DISCHARGE TARGET WAS HIT

# Check if already discharged (can only count once)
execute if score @s target_discharged matches 1 run return fail

# Mark as discharged
scoreboard players set @s target_discharged 1

# Add to player's discharge count
execute as @a[tag=overcharged,limit=1,sort=nearest] run scoreboard players add @s discharge_hits 1

# MASSIVE visual feedback - electrical discharge
particle electric_spark ~ ~1 ~ 1.5 1.5 1.5 1.5 150 force
particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 1 1 1 1 120 force
particle flame ~ ~1 ~ 0.8 0.8 0.8 0.8 100 force
particle glow ~ ~1 ~ 0.6 0.6 0.6 0.5 80 force
particle explosion ~ ~1 ~ 0 0 0 0 5 force

# Chain lightning to nearby targets (visual only)
execute at @s as @e[distance=0.1..6,tag=discharge_target,limit=2] at @s run particle electric_spark ~ ~1 ~ 0.5 0.5 0.5 0.3 40 force

# Sound - discharge
execute at @s run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 2 2
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.note_block.pling master @a ~ ~ ~ 1 2

# Feedback to player
execute as @a[tag=overcharged,limit=1,sort=nearest] run title @s actionbar [{"text":"⚡ DISCHARGED: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"discharge_hits"},"color":"yellow"},{"text":"/7","color":"gray"}]