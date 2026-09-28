# ==========================================
# SUCCESS - KNOWLEDGE STORM
# ==========================================

# CATASTROPHIC ARCANE EXPLOSION
particle explosion_emitter ~ ~1 ~ 18 18 18 0 300 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 50 force
particle enchant ~ ~1 ~ 0 0 0 10 10000 force
particle portal ~ ~1 ~ 0 0 0 8 8000 force
particle block{block_state:{Name:"minecraft:lapis_block"}} ~ ~1 ~ 0 0 0 8 8000 force
particle dragon_breath ~ ~1 ~ 18 18 18 3 5000 force
particle glow ~ ~1 ~ 15 15 15 2 3000 force

# MASSIVE DAMAGE (based on targets hit)
# 5-6 targets = 35 damage
# 7-8 targets = 45 damage
# 9+ targets = 55 damage
execute if score @s cascade_targets_hit matches 5..6 as @e[tag=cascade_marked] run damage @s 35 magic by @p[tag=cascade_active]
execute if score @s cascade_targets_hit matches 7..8 as @e[tag=cascade_marked] run damage @s 45 magic by @p[tag=cascade_active]
execute if score @s cascade_targets_hit matches 9.. as @e[tag=cascade_marked] run damage @s 55 magic by @p[tag=cascade_active]

# MASSIVE XP GAIN (based on targets hit)
# 5-6 targets = 30 levels
# 7-8 targets = 40 levels
# 9+ targets = 50 levels
execute if score @s cascade_targets_hit matches 5..6 run experience add @s 30 levels
execute if score @s cascade_targets_hit matches 7..8 run experience add @s 40 levels
execute if score @s cascade_targets_hit matches 9.. run experience add @s 50 levels

# SUCCESS BUFFS (30 seconds)
effect give @s strength 30 2 true
effect give @s speed 30 2 true
effect give @s haste 30 1 true
effect give @s regeneration 30 1 true
effect give @s night_vision 30 0 true

# MASSIVE KNOCKBACK
execute as @e[tag=cascade_marked] at @s facing entity @p[tag=cascade_active] feet run tp @s ^ ^ ^-10
execute as @e[tag=cascade_marked] run effect give @s levitation 2 2 true

# Explosion visuals on targets
execute as @e[tag=cascade_marked] at @s run particle explosion_emitter ~ ~1 ~ 8 8 8 0 50 force
execute as @e[tag=cascade_marked] at @s run particle enchant ~ ~1 ~ 5 5 5 2 500 force
execute as @e[tag=cascade_marked] at @s run particle portal ~ ~1 ~ 4 4 4 1 400 force

# VICTORY SOUND - Arcane harmony
execute at @s run playsound entity.evoker.prepare_attack master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 3 2
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 3 2

# Messages
title @s title [{"text":"⬥ ARCANE MASTERY ⬥","color":"dark_blue","bold":true}]
title @s subtitle [{"text":"Knowledge flows through you","color":"blue"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_blue","bold":true}]
tellraw @s [{"text":"   ⬥ CASCADE SUCCESS ⬥","color":"dark_blue","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Different Targets: ","color":"gray"},{"score":{"name":"@s","objective":"cascade_targets_hit"},"color":"blue"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Arcane Damage: 35-55 HP","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"XP Gained: 30-50 levels","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Strength III (30s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_blue","bold":true}]

# Notify targets
execute as @e[tag=cascade_marked,type=player] run title @s title {"text":"☠ OVERWHELMED ☠","color":"red","bold":true}
execute as @e[tag=cascade_marked,type=player] run title @s subtitle {"text":"The arcane consumes you","color":"dark_red"}

# Cleanup
tag @s remove cascade_active
tag @s remove cascade_immune
tag @e remove cascade_marked
scoreboard players reset @e cascade_hit_by_player
scoreboard players reset @s cascade_targets_hit
scoreboard players reset @s cascade_failed
scoreboard players reset @s cascade_target_count