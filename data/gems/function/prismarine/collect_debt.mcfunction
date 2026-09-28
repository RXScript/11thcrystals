# DEBT HOLDER WAS HIT - Collect payment
# Get damage dealt (approximation based on HurtTime)
scoreboard players add @p[tag=debt_collector] debt_collected 1

# MASSIVE visual feedback - payment received
particle splash ~ ~1 ~ 1 1 1 1 100 force
particle bubble ~ ~1 ~ 0.8 0.8 0.8 0.8 80 force
particle falling_water ~ ~1 ~ 0.6 0.6 0.6 0.5 60 force
particle glow ~ ~1 ~ 0.5 0.5 0.5 0.3 40 force

# Sound - collecting
execute at @s run playsound entity.player.splash.high_speed master @a ~ ~ ~ 1.5 1.5
execute at @s run playsound entity.experience_orb.pickup master @p[tag=debt_collector] ~ ~ ~ 1 1.5
execute at @s run playsound block.conduit.ambient master @a ~ ~ ~ 0.8 2

# Feedback to player
execute as @p[tag=debt_collector] run title @s actionbar [{"text":"🌊 COLLECTED: +1 ","color":"aqua","bold":true},{"text":"[Total: ","color":"gray"},{"score":{"name":"@s","objective":"debt_collected"},"color":"yellow"},{"text":"]","color":"gray"}]