# IMMOLATION TARGET WAS HIT
execute as @a[tag=phoenix_form,limit=1,sort=nearest] run scoreboard players add @s phoenix_stacks_elite 1

# MASSIVE visual feedback
particle flame ~ ~1 ~ 1 1 1 1 100 force
particle soul_fire_flame ~ ~1 ~ 0.8 0.8 0.8 0.8 80 force
particle lava ~ ~1 ~ 0.6 0.6 0.6 0 20 force
particle smoke ~ ~1 ~ 0.5 0.5 0.5 0.2 60 force
particle glow ~ ~1 ~ 0.4 0.4 0.4 0.2 40 force

# Sound - Building intensity
execute at @s run playsound entity.blaze.shoot master @a ~ ~ ~ 2 1.5
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.fire.ambient master @a ~ ~ ~ 1 2

# Feedback to player
execute as @a[tag=phoenix_form,limit=1,sort=nearest] run title @s actionbar [{"text":"🔥 IMMOLATION: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"phoenix_stacks_elite"},"color":"yellow"},{"text":"/6","color":"gray"}]