# ==========================================
# PHOENIX REBIRTH - RESURRECTION
# ==========================================

# Remove rebirth flag (can only happen once)
scoreboard players set @s rebirth_ready 0

# MASSIVE RESURRECTION EXPLOSION
particle explosion_emitter ~ ~1 ~ 8 8 8 0 100 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 20 force
particle flame ~ ~1 ~ 0 0 0 3 2500 force
particle soul_fire_flame ~ ~1 ~ 0 0 0 2 2000 force
particle lava ~ ~1 ~ 10 10 10 2 400 force
particle firework ~ ~1 ~ 10 10 10 1.5 1000 force

# Vertical rebirth pillar
particle flame ~ ~1 ~ 0.5 100 0.5 0 2000 force
particle soul_fire_flame ~ ~1 ~ 0.5 100 0.5 0 1500 force

# RESURRECT - Full heal
effect give @s instant_health 1 20 true
effect give @s regeneration 10 5 true
effect give @s absorption 10 9 true
effect give @s resistance 10 2 true
effect give @s fire_resistance 10 0 true

# Damage everything nearby (rebirth explosion)
execute as @e[distance=0.1..15,tag=!phoenix_immune] run damage @s 40 on_fire by @s
execute as @e[distance=0.1..15,tag=!phoenix_immune] run data merge entity @s {Fire:200s}

# Massive knockback
execute as @e[distance=0.1..15,tag=!phoenix_immune] at @s facing entity @p[tag=phoenix_master] feet run tp @s ^ ^ ^-8
execute as @e[distance=0.1..15,tag=!phoenix_immune] run effect give @s levitation 2 20 true

# Explosion visuals on targets
execute as @e[distance=0.1..15,tag=!phoenix_immune] at @s run particle flame ~ ~1 ~ 2 2 2 0.5 200 force
execute as @e[distance=0.1..15,tag=!phoenix_immune] at @s run particle lava ~ ~1 ~ 1.5 1.5 1.5 0.5 80 force

# APOCALYPTIC REBIRTH SOUND
execute at @s run playsound entity.ender_dragon.death master @a ~ ~ ~ 5 2
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute at @s run playsound item.totem.use master @a ~ ~ ~ 5 1
execute at @s run playsound entity.phoenix.death master @a ~ ~ ~ 5 1.5
execute at @s run playsound block.fire.ambient master @a ~ ~ ~ 3 2

# SERVER ANNOUNCEMENT
title @a title [{"selector":"@s","color":"dark_red","bold":true}]
title @a subtitle {"text":"RISES FROM THE ASHES","color":"gold","bold":true}
tellraw @a [{"text":"☄ ","color":"red"},{"selector":"@s","color":"dark_red","bold":true},{"text":" has been REBORN from death!","color":"gold"}]

# Message to phoenix
title @s title {"text":"⚠ REBIRTH ⚠","color":"gold","bold":true}
title @s subtitle {"text":"From ash, you rise","color":"red","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @s [{"text":"  ⚠ PHOENIX REBIRTH ACTIVATED ⚠","color":"gold","bold":true}]
tellraw @s [{"text":"  You have risen from death.","color":"gray"}]
tellraw @s [{"text":"  This can only happen once.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]