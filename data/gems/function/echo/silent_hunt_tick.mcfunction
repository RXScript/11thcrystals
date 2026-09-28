# ==========================================
# HUNTING IN SILENCE
# ==========================================

# MASSIVE darkness aura
particle squid_ink ~ ~1 ~ 6 7 6 1.5 150 force
particle sculk_soul ~ ~1 ~ 5 6 5 1 100 force
particle warped_spore ~ ~1 ~ 4 5 4 0.8 80 force
particle smoke ~ ~1 ~ 4 5 4 0.5 60 force

# Ground darkness circle
particle squid_ink ~ ~0.1 ~ 7 0.1 7 0.5 60 force
particle sculk_soul ~ ~0.1 ~ 6 0.1 6 0.3 40 force

# Vertical darkness pillar every 3 seconds
execute if score @s silent_hunt_timer matches 120 run particle squid_ink ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s silent_hunt_timer matches 120 run particle sculk_soul ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s silent_hunt_timer matches 120 run playsound entity.warden.heartbeat master @a ~ ~ ~ 2 0.5

execute if score @s silent_hunt_timer matches 70 run particle squid_ink ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s silent_hunt_timer matches 70 run playsound entity.warden.heartbeat master @a ~ ~ ~ 2 0.5

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..20,tag=!echo_immune] unless entity @s[tag=scream_marked] run tag @s add scream_marked
execute at @s as @e[distance=0.1..20,tag=!echo_immune] unless entity @s[tag=scream_marked] run scoreboard players set @s fragment_dropped 0
execute at @s as @e[distance=0.1..20,tag=!echo_immune] unless entity @s[tag=scream_marked] at @s run particle squid_ink ~ ~1 ~ 0.5 1 0.5 0.5 60 force

# Darkness particles on marked targets (not collected yet)
execute at @s as @e[distance=0.1..20,tag=scream_marked,scores={fragment_dropped=0}] at @s run particle squid_ink ~ ~1 ~ 0.3 0.6 0.3 0.2 10 force
execute at @s as @e[distance=0.1..20,tag=scream_marked,scores={fragment_dropped=0}] at @s run particle sculk_soul ~ ~1.5 ~ 0.2 0.4 0.2 0.1 8 force
execute at @s as @e[distance=0.1..20,tag=scream_marked,scores={fragment_dropped=0}] at @s run particle warped_spore ~ ~1 ~ 0.2 0.5 0.2 0.05 6 force

# Green particles for collected targets
execute at @s as @e[distance=0.1..20,tag=scream_marked,scores={fragment_dropped=1}] at @s run particle glow ~ ~1 ~ 0.3 0.6 0.3 0.2 15 force

# Display progress
execute if score @s scream_fragments matches ..7 if score @s silent_hunt_timer matches 100.. run title @s actionbar [{"text":"⬛ HUNTING: ","color":"dark_gray","bold":true},{"score":{"name":"@s","objective":"silent_hunt_timer"},"color":"yellow"},{"text":" | Fragments: ","color":"gray"},{"score":{"name":"@s","objective":"scream_fragments"},"color":"dark_gray"},{"text":"/8","color":"gray"}]
execute if score @s scream_fragments matches ..7 if score @s silent_hunt_timer matches 50..99 run title @s actionbar [{"text":"⚠ HUNTING: ","color":"gray","bold":true},{"score":{"name":"@s","objective":"silent_hunt_timer"},"color":"yellow"},{"text":" | Fragments: ","color":"gray"},{"score":{"name":"@s","objective":"scream_fragments"},"color":"dark_gray"},{"text":"/8","color":"gray"}]
execute if score @s scream_fragments matches ..7 if score @s silent_hunt_timer matches ..49 run title @s actionbar [{"text":"⚠ TIME LOW: ","color":"red","bold":true},{"score":{"name":"@s","objective":"silent_hunt_timer"},"color":"red"},{"text":" | Fragments: ","color":"gray"},{"score":{"name":"@s","objective":"scream_fragments"},"color":"dark_gray"},{"text":"/8","color":"gray"}]
execute if score @s scream_fragments matches 8.. run title @s actionbar [{"text":"✓ HUNT COMPLETE: ","color":"green","bold":true},{"score":{"name":"@s","objective":"scream_fragments"},"color":"yellow"},{"text":" fragments!","color":"gray"}]

# Ambient sound (silence)
execute if score @s silent_hunt_timer matches 100 run playsound entity.warden.ambient master @s ~ ~ ~ 1 0.5
execute if score @s silent_hunt_timer matches 70 run playsound entity.warden.ambient master @s ~ ~ ~ 1.5 0.5
execute if score @s silent_hunt_timer matches 40 run playsound entity.warden.agitated master @s ~ ~ ~ 2 0.5
execute if score @s silent_hunt_timer matches 20 run playsound block.sculk_shrieker.shriek master @s ~ ~ ~ 2 1

execute if score @s scream_fragments matches 8.. run effect give @s instant_health 1 1 true