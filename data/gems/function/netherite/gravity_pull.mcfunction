# GRAVITY TARGET WAS HIT - Pull them toward you

# Get nearest gravity well
execute as @e[tag=gravity_target,sort=nearest] at @s facing entity @a[tag=gravity_well,limit=1,sort=nearest] eyes run tp @s ^ ^ ^3

# Track that this target was pulled
scoreboard players add @s pulled_distance 1

# MASSIVE visual feedback - gravitational pull
particle block{block_state:{Name:"minecraft:netherite_block"}} ~ ~1 ~ 1 1 1 1 100 force
particle smoke ~ ~1 ~ 0.8 0.8 0.8 0.8 80 force
particle lava ~ ~1 ~ 0.6 0.6 0.6 0.5 60 force
particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.3 40 force

# Sound - being pulled
execute at @s run playsound entity.wither.shoot master @a ~ ~ ~ 1.5 0.5
execute at @s run playsound block.anvil.use master @a ~ ~ ~ 1 1
execute at @s run playsound entity.experience_orb.pickup master @p[tag=gravity_well] ~ ~ ~ 1 0.5

# Feedback to player
execute as @p[tag=gravity_well] run title @s actionbar [{"text":"⚓ PULLED: ","color":"black","bold":true},{"score":{"name":"@s","objective":"gravity_pulled"},"color":"yellow"},{"text":" nearby","color":"gray"}]