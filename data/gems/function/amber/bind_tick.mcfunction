# ==========================================
# RESIN BIND ACTIVE - MAINTAINING STASIS
# ==========================================

# Golden resin energy around player
particle dust{color:[1.0,0.7,0.0],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.5 15 force
particle item{item:"minecraft:honey_bottle"} ~ ~1 ~ 1 1 1 0.3 10 force

# Resin stream to target
execute at @s facing entity @e[tag=resin_bound,limit=1] eyes run particle dripping_honey ^ ^1 ^1 0.1 0.1 0.1 0 3 force
execute at @s facing entity @e[tag=resin_bound,limit=1] eyes run particle dust{color:[1.0,0.7,0.0],scale:1.5} ^ ^1 ^2 0.1 0.1 0.1 0 3 force
execute at @s facing entity @e[tag=resin_bound,limit=1] eyes run particle item{item:"minecraft:honey_bottle"} ^ ^1 ^3 0.1 0.1 0.1 0 2 force

# Display status
execute if score @s bind_timer matches 30.. run title @s actionbar [{"text":"⬥ BINDING: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"bind_timer"},"color":"green"},{"text":" ticks","color":"gray"}]
execute if score @s bind_timer matches 15..29 run title @s actionbar [{"text":"⬥ BINDING: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"bind_timer"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s bind_timer matches ..14 run title @s actionbar [{"text":"⚠ BINDING: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"bind_timer"},"color":"red"},{"text":" ticks!","color":"gray"}]