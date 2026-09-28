# ==========================================
# VOID STEP ACTIVE - IN THE VOID
# ==========================================

# Void particles (dark, silent, invisible)
particle dust{color:[0.1,0.0,0.2],scale:2} ~ ~1 ~ 1 1 1 0.3 15 force
particle portal ~ ~1 ~ 0.8 0.8 0.8 2 20 force
particle sculk_charge_pop ~ ~0.5 ~ 0.5 0.5 0.5 0 8 force

# Dark void trail
particle dust{color:[0.0,0.0,0.0],scale:2} ~ ~0.5 ~ 0.5 0.5 0.5 0 10 force
particle dust{color:[0.05,0.0,0.1],scale:1.5} ~ ~1 ~ 0.8 0.8 0.8 0.2 8 force

# Sculk-like particles
particle sculk_soul ~ ~1 ~ 0.5 0.5 0.5 0 5 force

# Silent movement effect
particle dust{color:[0.1,0.0,0.2],scale:1.5} ~ ~0.1 ~ 0.8 0.1 0.8 0 12 force

# Mark potential targets
execute at @s as @e[distance=0.1..18,type=!#minecraft:arrows,type=!item,tag=!echo2_immune] run tag @s add void_target

# Show targets with dark aura (player can see them)
execute at @s as @e[distance=0.1..18,tag=void_target] at @s run particle dust{color:[0.2,0.0,0.3],scale:1.5} ~ ~1.5 ~ 0.3 0.4 0.3 0 3 force
execute at @s as @e[distance=0.1..18,tag=void_target] at @s run particle sculk_soul ~ ~1 ~ 0.2 0.3 0.2 0 2 force

# CHECK FOR HIT ENTITIES (FIXED - direct check in tick)
execute if score @s void_broken matches 0 at @s as @e[distance=0.1..18,tag=void_target,nbt={HurtTime:10s}] run function gems:echo/void_hit_detected

# Void sound (subtle, eerie)
execute if score @s void2_timer matches 50 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 1 0.5
execute if score @s void2_timer matches 40 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 1 0.5
execute if score @s void2_timer matches 30 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 1.2 0.5
execute if score @s void2_timer matches 20 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 1.5 0.5
execute if score @s void2_timer matches 10 run playsound entity.warden.heartbeat master @s ~ ~ ~ 2 0.5

# Display status
execute if score @s void_broken matches 0 if score @s void2_timer matches 30.. run title @s actionbar [{"text":"◈ VOID: ","color":"dark_purple","bold":true},{"score":{"name":"@s","objective":"void2_timer"},"color":"dark_gray"},{"text":" ticks","color":"gray"}]
execute if score @s void_broken matches 0 if score @s void2_timer matches 15..29 run title @s actionbar [{"text":"◈ VOID: ","color":"dark_purple","bold":true},{"score":{"name":"@s","objective":"void2_timer"},"color":"gray"},{"text":" ticks","color":"gray"}]
execute if score @s void_broken matches 0 if score @s void2_timer matches ..14 run title @s actionbar [{"text":"◈ VOID: ","color":"dark_purple","bold":true},{"score":{"name":"@s","objective":"void2_timer"},"color":"dark_red"},{"text":" ticks","color":"gray"}]
execute if score @s void_broken matches 1 run title @s actionbar [{"text":"⚫ BREAKING... ⚫","color":"black","bold":true}]