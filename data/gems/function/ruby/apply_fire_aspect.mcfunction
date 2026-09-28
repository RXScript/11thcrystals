# ==========================================
# APPLY FIRE ASPECT TO HIT TARGET
# ==========================================

# SET TARGET ON FIRE
execute as @e[tag=ember_target,limit=1,sort=nearest] run damage @s 8 on_fire by @p[tag=ruby_immune]

# IGNITION VISUALS
execute as @e[tag=ember_target,limit=1,sort=nearest] at @s run particle flame ~ ~1 ~ 1 1 1 0.3 80 force
execute as @e[tag=ember_target,limit=1,sort=nearest] at @s run particle lava ~ ~1 ~ 0.8 0.8 0.8 0.5 40 force
execute as @e[tag=ember_target,limit=1,sort=nearest] at @s run particle dust{color:[1.0,0.3,0.0],scale:3} ~ ~1 ~ 1 1 1 0.5 60 force
execute as @e[tag=ember_target,limit=1,sort=nearest] at @s run particle explosion ~ ~1 ~ 0.5 0.5 0.5 0 10 force

# Phoenix fire rising from ignited target
execute as @e[tag=ember_target,limit=1,sort=nearest] at @s run particle flame ~ ~0.1 ~ 0.5 0.1 0.5 0.2 30 force
execute as @e[tag=ember_target,limit=1,sort=nearest] at @s run particle flame ~ ~0.8 ~ 0.4 0.1 0.4 0.2 25 force
execute as @e[tag=ember_target,limit=1,sort=nearest] at @s run particle flame ~ ~1.5 ~ 0.3 0.1 0.3 0.2 20 force

# IGNITION SOUND
execute at @s run playsound entity.blaze.shoot master @a ~ ~ ~ 2 2
execute at @s run playsound block.fire.ambient master @a ~ ~ ~ 2 1.5
execute at @s run playsound entity.generic.burn master @a ~ ~ ~ 1.5 1

# Feedback
title @s actionbar [{"text":"🔥 IGNITED! ","color":"gold","bold":true},{"text":"Phoenix flame","color":"red"}]