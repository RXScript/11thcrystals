# ==========================================
# THE OCEAN DEMANDS PAYMENT
# ==========================================

# MASSIVE ocean aura
particle splash ~ ~1 ~ 6 7 6 1.5 150 force
particle falling_water ~ ~1 ~ 5 6 5 1 100 force
particle bubble ~ ~1 ~ 5 6 5 0.8 120 force
particle glow ~ ~1 ~ 4 5 4 0.5 80 force
particle end_rod ~ ~1 ~ 3 4 3 0.3 60 force

# Drowning bubbles rising from player
particle bubble ~ ~1 ~ 0.5 1 0.5 0.3 30 force
particle splash ~ ~1.5 ~ 0.3 0.5 0.3 0.2 20 force

# Ground ocean floor
particle splash ~ ~0.1 ~ 7 0.1 7 0.5 60 force
particle bubble ~ ~0.1 ~ 6 0.1 6 0.3 40 force

# Vertical water pillar every 2 seconds
execute if score @s debt_timer matches 100 run particle falling_water ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s debt_timer matches 100 run particle splash ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s debt_timer matches 100 run playsound block.water.ambient master @a ~ ~ ~ 2 0.5

execute if score @s debt_timer matches 60 run particle falling_water ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s debt_timer matches 60 run playsound block.water.ambient master @a ~ ~ ~ 2 0.5

execute if score @s debt_timer matches 20 run particle falling_water ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s debt_timer matches 20 run playsound entity.player.hurt_drown master @s ~ ~ ~ 2 1

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..20,tag=!debt_immune] unless entity @s[tag=debt_holder] run tag @s add debt_holder
execute at @s as @e[distance=0.1..20,tag=!debt_immune] unless entity @s[tag=debt_holder] at @s run particle splash ~ ~1 ~ 0.5 1 0.5 0.5 60 force

# Ocean particles on debt holders
execute at @s as @e[distance=0.1..20,tag=debt_holder] at @s run particle splash ~ ~1 ~ 0.3 0.6 0.3 0.2 10 force
execute at @s as @e[distance=0.1..20,tag=debt_holder] at @s run particle bubble ~ ~1.5 ~ 0.2 0.4 0.2 0.1 8 force
execute at @s as @e[distance=0.1..20,tag=debt_holder] at @s run particle falling_water ~ ~1 ~ 0.2 0.5 0.2 0.05 6 force

# Display progress with drowning warning
execute if score @s debt_collected matches ..49 if score @s debt_timer matches 80.. run title @s actionbar [{"text":"🌊 DROWNING: ","color":"dark_aqua","bold":true},{"score":{"name":"@s","objective":"debt_timer"},"color":"yellow"},{"text":" | Debt: ","color":"gray"},{"score":{"name":"@s","objective":"debt_collected"},"color":"aqua"},{"text":"/30 | Drowned: -","color":"gray"},{"score":{"name":"@s","objective":"drowning_damage"},"color":"red"},{"text":" HP","color":"gray"}]
execute if score @s debt_collected matches ..49 if score @s debt_timer matches 40..79 run title @s actionbar [{"text":"⚠ DROWNING: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"debt_timer"},"color":"yellow"},{"text":" | Debt: ","color":"gray"},{"score":{"name":"@s","objective":"debt_collected"},"color":"aqua"},{"text":"/30 | Drowned: -","color":"gray"},{"score":{"name":"@s","objective":"drowning_damage"},"color":"red"},{"text":" HP","color":"gray"}]
execute if score @s debt_collected matches ..49 if score @s debt_timer matches ..39 run title @s actionbar [{"text":"⚠ DYING: ","color":"red","bold":true},{"score":{"name":"@s","objective":"debt_timer"},"color":"red"},{"text":" | Debt: ","color":"gray"},{"score":{"name":"@s","objective":"debt_collected"},"color":"aqua"},{"text":"/30 | Drowned: -","color":"gray"},{"score":{"name":"@s","objective":"drowning_damage"},"color":"red"},{"text":" HP","color":"gray"}]
execute if score @s debt_collected matches 50.. run title @s actionbar [{"text":"✓ DEBT PAID: ","color":"green","bold":true},{"score":{"name":"@s","objective":"debt_collected"},"color":"yellow"},{"text":" collected!","color":"gray"}]

# Ambient sound (drowning)
execute if score @s debt_timer matches 90 run playsound entity.player.hurt_drown master @s ~ ~ ~ 1 1
execute if score @s debt_timer matches 70 run playsound entity.player.hurt_drown master @s ~ ~ ~ 1 1
execute if score @s debt_timer matches 50 run playsound entity.player.hurt_drown master @s ~ ~ ~ 1.5 1
execute if score @s debt_timer matches 30 run playsound entity.player.hurt_drown master @s ~ ~ ~ 2 1
execute if score @s debt_timer matches 10 run playsound entity.player.hurt_drown master @s ~ ~ ~ 2 1.5

execute if score @s debt_collected matches 35.. run effect give @s instant_health 1 1 true