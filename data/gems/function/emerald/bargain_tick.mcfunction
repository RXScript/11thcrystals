# ==========================================
# THE BARGAIN IS ACTIVE
# ==========================================

# MASSIVE life/nature aura
particle happy_villager ~ ~1 ~ 6 7 6 1.5 150 force
particle composter ~ ~1 ~ 5 6 5 1 100 force
particle dust{color:[0.2,0.8,0.2],scale:2} ~ ~1 ~ 4 5 4 0.5 80 force
particle end_rod ~ ~1 ~ 3 4 3 0.3 30 force

# Ground life circle
particle happy_villager ~ ~0.1 ~ 7 0.1 7 0.5 60 force
particle composter ~ ~0.1 ~ 6 0.1 6 0.3 40 force

# Vertical life beam every 3 seconds
execute if score @s bargain_timer matches 140 run particle happy_villager ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s bargain_timer matches 140 run particle composter ~ ~1 ~ 0.5 50 0.5 0 600 force
execute if score @s bargain_timer matches 140 run playsound entity.villager.work_farmer master @a ~ ~ ~ 2 1.5

execute if score @s bargain_timer matches 80 run particle happy_villager ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s bargain_timer matches 80 run playsound entity.villager.work_farmer master @a ~ ~ ~ 2 1.5

# MAINTAIN MARKS - Refresh if new enemies enter
execute at @s as @e[distance=0.1..18,tag=!bargain_immune] unless entity @s[tag=bargain_marked] run tag @s add bargain_marked
execute at @s as @e[distance=0.1..18,tag=!bargain_immune] unless entity @s[tag=bargain_marked] at @s run particle happy_villager ~ ~1 ~ 0.5 1 0.5 0.5 60 force

# Marked particles on targets
execute at @s as @e[distance=0.1..18,tag=bargain_marked] at @s run particle happy_villager ~ ~1 ~ 0.3 0.6 0.3 0.2 10 force
execute at @s as @e[distance=0.1..18,tag=bargain_marked] at @s run particle composter ~ ~1.5 ~ 0.2 0.4 0.2 0.1 8 force
execute at @s as @e[distance=0.1..18,tag=bargain_marked] at @s run particle glow ~ ~2 ~ 0.2 0.2 0.2 0.05 6 force

# Display progress
execute if score @s bargain_timer matches 120.. run title @s actionbar [{"text":"⬥ BARGAIN: ","color":"green","bold":true},{"score":{"name":"@s","objective":"bargain_timer"},"color":"yellow"},{"text":" ticks | Hits: ","color":"gray"},{"score":{"name":"@s","objective":"bargain_hits"},"color":"green"},{"text":"/10","color":"gray"}]
execute if score @s bargain_timer matches 60..119 run title @s actionbar [{"text":"⚠ BARGAIN: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"bargain_timer"},"color":"yellow"},{"text":" | Hits: ","color":"gray"},{"score":{"name":"@s","objective":"bargain_hits"},"color":"green"},{"text":"/10","color":"gray"}]
execute if score @s bargain_timer matches ..59 run title @s actionbar [{"text":"⚠ TIME LOW: ","color":"red","bold":true},{"score":{"name":"@s","objective":"bargain_timer"},"color":"red"},{"text":" | Hits: ","color":"gray"},{"score":{"name":"@s","objective":"bargain_hits"},"color":"green"},{"text":"/10","color":"gray"}]

# Ambient sound
execute if score @s bargain_timer matches 150 run playsound entity.villager.ambient master @s ~ ~ ~ 1 1.5
execute if score @s bargain_timer matches 100 run playsound entity.villager.ambient master @s ~ ~ ~ 1 1.5
execute if score @s bargain_timer matches 50 run playsound entity.villager.ambient master @s ~ ~ ~ 1.5 1.5
execute if score @s bargain_timer matches 20 run playsound entity.villager.ambient master @s ~ ~ ~ 2 2

execute if score @s bargain_hits matches 10.. run effect give @s instant_health 1 1 true