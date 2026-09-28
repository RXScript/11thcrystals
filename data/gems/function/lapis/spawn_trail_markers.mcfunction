# ==========================================
# SPAWN ARCANE TRAIL MARKERS
# ==========================================

# Spawn markers along the path (every block)
execute at @s positioned ^ ^ ^-1 run summon marker ~ ~ ~ {Tags:["arcane_trail_marker","arcane_trail_new"]}
execute at @s positioned ^ ^ ^-2 run summon marker ~ ~ ~ {Tags:["arcane_trail_marker","arcane_trail_new"]}
execute at @s positioned ^ ^ ^-3 run summon marker ~ ~ ~ {Tags:["arcane_trail_marker","arcane_trail_new"]}
execute at @s positioned ^ ^ ^-4 run summon marker ~ ~ ~ {Tags:["arcane_trail_marker","arcane_trail_new"]}
execute at @s positioned ^ ^ ^-5 run summon marker ~ ~ ~ {Tags:["arcane_trail_marker","arcane_trail_new"]}
execute at @s positioned ^ ^ ^-6 run summon marker ~ ~ ~ {Tags:["arcane_trail_marker","arcane_trail_new"]}
execute at @s positioned ^ ^ ^-7 run summon marker ~ ~ ~ {Tags:["arcane_trail_marker","arcane_trail_new"]}

# Initialize trail markers
execute as @e[tag=arcane_trail_new] run scoreboard players set @s trail_lifetime 60
execute as @e[tag=arcane_trail_new] run tag @s remove arcane_trail_new