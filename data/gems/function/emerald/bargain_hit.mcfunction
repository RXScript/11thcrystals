# MARKED TARGET WAS HIT
execute as @a[tag=bargain_active,limit=1,sort=nearest] run scoreboard players add @s bargain_hits 1

# Visual feedback
particle happy_villager ~ ~1 ~ 0.5 0.8 0.5 0.5 30 force
particle composter ~ ~1 ~ 0.4 0.6 0.4 0.3 20 force
particle glow ~ ~1 ~ 0.3 0.5 0.3 0.2 15 force

# Sound
execute at @s run playsound entity.villager.yes master @a ~ ~ ~ 1 1.5
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 0.8 2

# Feedback to player
execute as @a[tag=bargain_active,limit=1,sort=nearest] run title @s actionbar [{"text":"✓ HIT: ","color":"green","bold":true},{"score":{"name":"@s","objective":"bargain_hits"},"color":"yellow"},{"text":"/10","color":"gray"}]