# ==========================================
# ENEMY STEPPED IN TRAP - STUCK!
# ==========================================

# Mark as trapped
tag @s add resin_trapped

# Add to count
execute as @p[tag=trap_master] run scoreboard players add @s trapped_count 1

# TRAP VISUALS
particle explosion ~ ~1 ~ 1 1 1 0 10 force
particle falling_honey ~ ~0.5 ~ 1 1 1 0.3 100 force
particle block{block_state:{Name:"minecraft:honey_block"}} ~ ~0.5 ~ 0.8 0.8 0.8 0 80 force
particle dust{color:[1.0,0.7,0.0],scale:3} ~ ~1 ~ 0.5 0.5 0.5 0 50 force

# TRAP SOUND
execute at @s run playsound block.honey_block.slide master @a ~ ~ ~ 2 0.5
execute at @s run playsound entity.slime.squish master @a ~ ~ ~ 2 1
execute at @s run playsound block.stone.break master @a ~ ~ ~ 1 0.5

# APPLY STUCK EFFECTS
effect give @s slowness 10 4 true
effect give @s jump_boost 10 250 true
effect give @s weakness 10 1 true

# Visual stuck effect
particle falling_honey ~ ~0.1 ~ 0.5 0.1 0.5 0 30 force

# Feedback
execute as @p[tag=trap_master] run title @s actionbar [{"text":"🍯 TRAPPED: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"trapped_count"},"color":"yellow"},{"text":"/3","color":"gray"}]