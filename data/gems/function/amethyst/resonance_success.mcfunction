# ==========================================
# SUCCESS - SONIC DEVASTATION
# ==========================================

# CATASTROPHIC SONIC BOOM
particle explosion_emitter ~ ~1 ~ 18 18 18 0 300 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 50 force
particle sonic_boom ~ ~1 ~ 0 0 0 0 100 force
particle sculk_soul ~ ~1 ~ 0 0 0 10 10000 force
particle block{block_state:{Name:"minecraft:amethyst_block"}} ~ ~1 ~ 0 0 0 8 8000 force
particle note ~ ~1 ~ 18 18 18 3 5000 force
particle end_rod ~ ~1 ~ 15 15 15 2 3000 force

# MASSIVE DAMAGE (based on stacks)
# 6-7 stacks = 40 damage
# 8-9 stacks = 50 damage
# 10+ stacks = 60 damage
execute if score @s resonance4_stacks matches 6..7 as @e[tag=resonance_marked] run damage @s 40 sonic_boom by @p[tag=resonance_active]
execute if score @s resonance4_stacks matches 8..9 as @e[tag=resonance_marked] run damage @s 50 sonic_boom by @p[tag=resonance_active]
execute if score @s resonance4_stacks matches 10.. as @e[tag=resonance_marked] run damage @s 60 sonic_boom by @p[tag=resonance_active]

# MASSIVE KNOCKBACK
execute as @e[tag=resonance_marked] at @s facing entity @p[tag=resonance_active] feet run tp @s ^ ^ ^-12
execute as @e[tag=resonance_marked] run effect give @s levitation 2 2 true

# SUCCESS BUFFS (30 seconds)
effect give @s strength 30 2 true
effect give @s speed 30 2 true
effect give @s resistance 30 1 true
effect give @s regeneration 30 0 true

# Explosion visuals on targets
execute as @e[tag=resonance_marked] at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 20 force
execute as @e[tag=resonance_marked] at @s run particle explosion_emitter ~ ~1 ~ 8 8 8 0 50 force
execute as @e[tag=resonance_marked] at @s run particle sculk_soul ~ ~1 ~ 5 5 5 2 500 force

# VICTORY SOUND - Perfect harmony
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 1.0
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 1.5
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5
execute at @s run playsound block.amethyst_cluster.break master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ PERFECT RESONANCE ⬥","color":"light_purple","bold":true}]
title @s subtitle [{"text":"The universe sings","color":"dark_purple"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]
tellraw @s [{"text":"   ⬥ RESONANCE SUCCESS ⬥","color":"light_purple","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Perfect Hits: ","color":"gray"},{"score":{"name":"@s","objective":"resonance4_stacks"},"color":"light_purple"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Sonic Damage: 40-60 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Strength III (30s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"light_purple","bold":true}]

# Notify targets
execute as @e[tag=resonance_marked,type=player] run title @s title {"text":"☠ SHATTERED ☠","color":"red","bold":true}
execute as @e[tag=resonance_marked,type=player] run title @s subtitle {"text":"The rhythm breaks you","color":"dark_red"}

# Cleanup
tag @s remove resonance_active
tag @s remove resonance_immune
tag @e remove resonance_marked
scoreboard players reset @s resonance_stacks
scoreboard players reset @s rhythm_cooldown
scoreboard players reset @s rhythm_broken
scoreboard players reset @s resonance_target_count