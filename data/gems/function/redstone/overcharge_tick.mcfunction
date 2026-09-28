# ==========================================
# OVERCHARGED - LIGHTNING FLOWS
# ==========================================

# MASSIVE electrical aura
particle electric_spark ~ ~1 ~ 6 7 6 2 120 force
particle dust{color:[1.0,0.0,0.0],scale:1} ~ ~1 ~ 5 6 5 1.5 90 force
particle flame ~ ~1 ~ 5 6 5 1 40 force
particle glow ~ ~1 ~ 4 5 4 0.8 45 force
particle end_rod ~ ~1 ~ 3 4 3 0.5 50 force

# Speed lines (motion blur from speed)
particle electric_spark ~ ~1 ~ 10 0.5 10 1 60 force
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 8 0.5 8 0.8 40 force

# Lightning arcing around player
particle electric_spark ~3 ~1 ~ 0.2 0.5 0.2 0.1 15 force
particle electric_spark ~-3 ~1 ~ 0.2 0.5 0.2 0.1 15 force
particle electric_spark ~ ~1 ~3 0.2 0.5 0.2 0.1 15 force
particle electric_spark ~ ~1 ~-3 0.2 0.5 0.2 0.1 15 force

# Ground redstone pulse
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~0.1 ~ 7 0.1 7 0.5 80 force
particle electric_spark ~ ~0.1 ~ 6 0.1 6 0.3 60 force

# Vertical lightning pillar every 2 seconds
execute if score @s overcharge_timer matches 100 run particle electric_spark ~ ~1 ~ 0.5 50 0.5 0 1200 force
execute if score @s overcharge_timer matches 100 run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s overcharge_timer matches 100 run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 2 2

execute if score @s overcharge_timer matches 60 run particle electric_spark ~ ~1 ~ 0.5 50 0.5 0 1200 force
execute if score @s overcharge_timer matches 60 run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 2 2

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..20,tag=!redstone4_immune] unless entity @s[tag=discharge_target] run tag @s add discharge_target
execute at @s as @e[distance=0.1..20,tag=!redstone4_immune] unless entity @s[tag=discharge_target] run scoreboard players set @s target_discharged 0
execute at @s as @e[distance=0.1..20,tag=!redstone4_immune] unless entity @s[tag=discharge_target] at @s run particle electric_spark ~ ~1 ~ 0.5 1 0.5 0.5 80 force

# Electrical particles on discharge targets
execute at @s as @e[distance=0.1..20,tag=discharge_target,scores={target_discharged=0}] at @s run particle electric_spark ~ ~1 ~ 0.3 0.6 0.3 0.2 12 force
execute at @s as @e[distance=0.1..20,tag=discharge_target,scores={target_discharged=0}] at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1.5 ~ 0.2 0.4 0.2 0.1 10 force
execute at @s as @e[distance=0.1..20,tag=discharge_target,scores={target_discharged=0}] at @s run particle flame ~ ~1 ~ 0.2 0.5 0.2 0.05 8 force

# Lightning arc particles between player and nearby targets
execute at @s as @e[distance=0.1..8,tag=discharge_target,scores={target_discharged=0},limit=3] at @s facing entity @p[tag=overcharged] feet run particle electric_spark ^ ^1 ^1 0.1 0.1 0.1 0.02 5 force

# Green particles for discharged targets
execute at @s as @e[distance=0.1..20,tag=discharge_target,scores={target_discharged=1}] at @s run particle glow ~ ~1 ~ 0.3 0.6 0.3 0.2 15 force

# Display progress with overload warning
execute if score @s discharge_hits matches ..6 if score @s overcharge_timer matches 80.. run title @s actionbar [{"text":"⚡ OVERCHARGE: ","color":"red","bold":true},{"score":{"name":"@s","objective":"overcharge_timer"},"color":"yellow"},{"text":" | Hits: ","color":"gray"},{"score":{"name":"@s","objective":"discharge_hits"},"color":"gold"},{"text":"/7 | Overload: -","color":"gray"},{"score":{"name":"@s","objective":"overload_damage"},"color":"red"},{"text":" HP","color":"gray"}]
execute if score @s discharge_hits matches ..6 if score @s overcharge_timer matches 40..79 run title @s actionbar [{"text":"⚠ OVERCHARGE: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"overcharge_timer"},"color":"yellow"},{"text":" | Hits: ","color":"gray"},{"score":{"name":"@s","objective":"discharge_hits"},"color":"gold"},{"text":"/7 | Overload: -","color":"gray"},{"score":{"name":"@s","objective":"overload_damage"},"color":"red"},{"text":" HP","color":"gray"}]
execute if score @s discharge_hits matches ..6 if score @s overcharge_timer matches ..39 run title @s actionbar [{"text":"⚠ BURNOUT: ","color":"dark_red","bold":true},{"score":{"name":"@s","objective":"overcharge_timer"},"color":"red"},{"text":" | Hits: ","color":"gray"},{"score":{"name":"@s","objective":"discharge_hits"},"color":"gold"},{"text":"/7 | Overload: -","color":"gray"},{"score":{"name":"@s","objective":"overload_damage"},"color":"red"},{"text":" HP","color":"gray"}]
execute if score @s discharge_hits matches 7.. run title @s actionbar [{"text":"✓ READY: ","color":"green","bold":true},{"score":{"name":"@s","objective":"discharge_hits"},"color":"yellow"},{"text":" discharged!","color":"gray"}]

# Ambient sound (electrical buzzing)
execute if score @s overcharge_timer matches 90 run playsound block.redstone_torch.burnout master @s ~ ~ ~ 1 1.5
execute if score @s overcharge_timer matches 70 run playsound block.redstone_torch.burnout master @s ~ ~ ~ 1.5 1.5
execute if score @s overcharge_timer matches 50 run playsound block.redstone_torch.burnout master @s ~ ~ ~ 2 2
execute if score @s overcharge_timer matches 30 run playsound entity.creeper.primed master @s ~ ~ ~ 2 2
execute if score @s overcharge_timer matches 10 run playsound entity.lightning_bolt.thunder master @s ~ ~ ~ 2 2