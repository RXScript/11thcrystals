# ==========================================
# SUCCESS - DEVASTATING COUNTER-ATTACK
# ==========================================

# MASSIVE EXPLOSION
particle explosion_emitter ~ ~1 ~ 12 12 12 0 200 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 30 force
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 0 0 0 5 5000 force
particle end_rod ~ ~1 ~ 0 0 0 3 3000 force
particle firework ~ ~1 ~ 12 12 12 2 2000 force

# DAMAGE CALCULATION (based on hits absorbed)
# 1-3 hits = 40 damage
# 4-6 hits = 50 damage
# 7+ hits = 60 damage
execute if score @s fortress_hits matches 1..3 as @e[tag=fortress_target] run damage @s 40 player_attack by @p[tag=fortress_active]
execute if score @s fortress_hits matches 4..6 as @e[tag=fortress_target] run damage @s 50 player_attack by @p[tag=fortress_active]
execute if score @s fortress_hits matches 7.. as @e[tag=fortress_target] run damage @s 60 player_attack by @p[tag=fortress_active]

# MASSIVE KNOCKBACK
execute as @e[tag=fortress_target] at @s facing entity @p[tag=fortress_active] feet run tp @s ^ ^ ^-10
execute as @e[tag=fortress_target] run effect give @s levitation 2 2 true

# Explosion visuals on targets
execute as @e[tag=fortress_target] at @s run particle explosion_emitter ~ ~1 ~ 6 6 6 0 40 force
execute as @e[tag=fortress_target] at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 4 4 4 1 300 force

# SUCCESS BUFFS (30 seconds)
effect give @s strength 30 1 true
effect give @s resistance 30 2 true
effect give @s regeneration 30 1 true
effect give @s speed 30 1 true

# HEAL based on damage absorbed (2 hearts per hit)
execute if score @s fortress_hits matches 1 run effect give @s instant_health 1 0 true
execute if score @s fortress_hits matches 2 run effect give @s instant_health 1 1 true
execute if score @s fortress_hits matches 3 run effect give @s instant_health 1 1 true
execute if score @s fortress_hits matches 4 run effect give @s instant_health 1 2 true
execute if score @s fortress_hits matches 5 run effect give @s instant_health 1 2 true
execute if score @s fortress_hits matches 6.. run effect give @s instant_health 1 3 true

# VICTORY SOUND
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound entity.ender_dragon.growl master @a ~ ~ ~ 2 1.5

# Messages
title @s title [{"text":"⬥ SUCCESS ⬥","color":"green","bold":true}]
title @s subtitle [{"text":"Counter-attack unleashed","color":"aqua"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @s [{"text":"   ⬥ FORTRESS SUCCESS ⬥","color":"green","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Hits Absorbed: ","color":"gray"},{"score":{"name":"@s","objective":"fortress_hits"},"color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Counter Damage: ","color":"gray"},{"text":"40-60 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Strength IV (30s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# Notify targets
execute as @e[tag=fortress_target,type=player] run title @s title {"text":"☠ COUNTER ☠","color":"red","bold":true}
execute as @e[tag=fortress_target,type=player] run title @s subtitle {"text":"The mountain strikes back","color":"dark_red"}

# Cleanup
tag @s remove fortress_active
tag @s remove fortress_immune
tag @e remove fortress_target
scoreboard players reset @s fortress_hits
scoreboard players reset @s damage_absorbed
scoreboard players reset @s fortress_x
scoreboard players reset @s fortress_y
scoreboard players reset @s fortress_z