# ==========================================
# SUCCESS - RESONANT SHOCKWAVE!
# ==========================================

# Mark as triggered
scoreboard players set @s frequency_triggered 1

# Get position of hit target for shockwave center
execute as @e[tag=frequency_target,nbt={HurtTime:10s},limit=1,sort=nearest] at @s run tag @s add shockwave_center

# MASSIVE RESONANT SHOCKWAVE
execute at @e[tag=shockwave_center,limit=1] run particle explosion_emitter ~ ~1 ~ 0 0 0 0 30 force
execute at @e[tag=shockwave_center,limit=1] run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 10 force
execute at @e[tag=shockwave_center,limit=1] run particle dust{color:[0.5,0.0,1.0],scale:4} ~ ~1 ~ 0 0 0 3 1000 force
execute at @e[tag=shockwave_center,limit=1] run particle end_rod ~ ~1 ~ 0 0 0 5 800 force
execute at @e[tag=shockwave_center,limit=1] run particle sonic_boom ~ ~1 ~ 0 0 0 0 5 force

# Expanding shockwave rings
execute at @e[tag=shockwave_center,limit=1] run particle dust{color:[0.5,0.0,1.0],scale:4} ~ ~1 ~ 1 0.1 1 0 100 force
execute at @e[tag=shockwave_center,limit=1] run particle dust{color:[0.5,0.0,1.0],scale:4} ~ ~1 ~ 2 0.1 2 0 150 force
execute at @e[tag=shockwave_center,limit=1] run particle dust{color:[0.5,0.0,1.0],scale:4} ~ ~1 ~ 3 0.1 3 0 200 force
execute at @e[tag=shockwave_center,limit=1] run particle dust{color:[0.5,0.0,1.0],scale:4} ~ ~1 ~ 4 0.1 4 0 250 force
execute at @e[tag=shockwave_center,limit=1] run particle dust{color:[0.5,0.0,1.0],scale:4} ~ ~1 ~ 5 0.1 5 0 300 force

# Shattering glass effect
execute at @e[tag=shockwave_center,limit=1] run particle block{block_state:"minecraft:amethyst_block"} ~ ~1 ~ 5 5 5 2 500 force
execute at @e[tag=shockwave_center,limit=1] run particle block{block_state:"minecraft:glass"} ~ ~1 ~ 4 4 4 1.5 300 force

# SHATTER SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 1
execute at @s run playsound block.glass.break master @a ~ ~ ~ 3 2
execute at @s run playsound block.amethyst_block.break master @a ~ ~ ~ 3 1
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ SHATTER! ⬥","color":"light_purple","bold":true}]
title @s subtitle [{"text":"Resonant shockwave!","color":"dark_purple"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @s [{"text":"   ⬥ RESONANT SHOCKWAVE ⬥","color":"light_purple","bold":true}]
tellraw @s [{"text":"  Direct Damage: 12 HP","color":"red"}]
tellraw @s [{"text":"  AoE Stun: 3 seconds","color":"dark_purple"}]
tellraw @s [{"text":"  Radius: 5 blocks","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]

# DIRECT DAMAGE TO HIT TARGET (12 HP)
execute as @e[tag=shockwave_center,limit=1] run damage @s 12 sonic_boom by @p[tag=frequency_charged]

# AOE STUN - All enemies within 5 blocks
execute at @e[tag=shockwave_center,limit=1] as @e[distance=0.1..5,type=!#minecraft:arrows,type=!item,tag=!amethyst_immune] run function gems:amethyst/apply_stun

# KNOCKBACK PRIMARY TARGET
execute as @e[tag=shockwave_center,limit=1] at @s facing entity @p[tag=frequency_charged] feet run tp @s ^ ^ ^-4
execute as @e[tag=shockwave_center,limit=1] run effect give @s levitation 2 2 true

# Cleanup
tag @s remove frequency_charged
tag @s remove amethyst_immune
tag @e remove frequency_target
tag @e remove shockwave_center
scoreboard players reset @s frequency_window
scoreboard players reset @s frequency_triggered