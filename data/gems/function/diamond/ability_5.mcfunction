execute unless entity @s[tag=has_diamond] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_diamond] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_diamond] run return fail

# ==========================================
# DIAMOND ULTIMATE: "IMMOVABLE MOUNTAIN"
# 10 Minute Cooldown - 500 Mastery Points
# "You do not resist force. You absorb it."
# PVP ONLY - No allies, pure 1v1+ combat
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ MOUNTAIN DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"aqua","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a subtitle {"text":"STANDS AS THE IMMOVABLE MOUNTAIN","color":"gold","bold":true}
tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @a [{"text":"       ⬥ IMMOVABLE MOUNTAIN AWAKENED ⬥","color":"gold","bold":true}]
tellraw @a [{"text":"          ","color":"gray"},{"selector":"@s","color":"aqua"},{"text":" becomes an anchor","color":"gray"}]
tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]

# 3. ACTIVATION EXPLOSION
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 3 3 3 1 500 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 1 300 force
execute at @s run particle enchant ~ ~1 ~ 4 4 4 2 600 force
execute at @s run particle cloud ~ ~1 ~ 3 3 3 0.3 200 force

# Ground slam effect
execute at @s run particle block{block_state:{Name:"minecraft:stone"}} ~ ~0.1 ~ 5 0.1 5 1 300 force
execute at @s run particle explosion ~ ~0.1 ~ 5 0.1 5 0 40 force

# Vertical pillar of light
execute at @s run particle end_rod ~ ~1 ~ 0.2 50 0.2 0 400 force
execute at @s run particle enchant ~ ~1 ~ 0.3 50 0.3 0 300 force

# 4. MASSIVE SHOCKWAVE (PVP DAMAGE)
execute at @s run particle sweep_attack ~ ~1 ~ 10 0.1 10 0.5 150 force
execute at @s run particle cloud ~ ~0.1 ~ 10 0.1 10 0.5 400 force
execute at @s run particle explosion ~ ~1 ~ 10 0.1 10 0.5 100 force

# Tag self to prevent self-damage
execute at @s run tag @s add mountain_user

# Damage and push other players
execute at @s as @e[distance=0.1..15,tag=!mountain_user] run damage @s 20 player_attack by @p[tag=mountain_user]
execute at @s positioned ~ ~1 ~ as @a[distance=0.1..15,tag=!mountain_user] at @s run tp @s ^ ^ ^-8
execute at @s as @e[distance=0.1..15,tag=!mountain_user] run effect give @s levitation 2 2 true

# 5. EPIC SOUND SEQUENCE
execute at @s run playsound entity.warden.emerge master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.ender_dragon.growl master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 2 0.7
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 0.8
execute at @s run playsound entity.iron_golem.death master @a ~ ~ ~ 2 0.5

# 6. BECOME THE MOUNTAIN (60 seconds)
effect give @s resistance 60 4 true
effect give @s absorption 60 19 true
effect give @s regeneration 60 4 true
effect give @s fire_resistance 60 0 true
effect give @s water_breathing 60 0 true
effect give @s saturation 60 0 true
effect give @s slowness 60 4 true
effect give @s strength 60 1 true
attribute @s minecraft:jump_strength base set 0

# 7. APPLY MOUNTAIN TAG
tag @s add immovable_mountain
scoreboard players set @s mountain_timer 1200
scoreboard players set @s absorbed_damage 0

# 8. MARK ALL OTHER PLAYERS AS ENEMIES
execute at @s as @e[distance=0.1..15,tag=!mountain_user] run tag @s add mountain_enemy

# 9. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 10. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]
tellraw @s [{"text":"     ⬥ IMMOVABLE MOUNTAIN ⬥","color":"gold","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Resistance V (96% damage reduction)","color":"aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Absorption XX (40 extra hearts)","color":"aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Regeneration V (rapid healing)","color":"aqua"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Damage Absorption: Every hit makes you stronger","color":"gold"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Taunt Pulse: Pull enemies toward you","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Final Release: Absorbed damage unleashed","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"You cannot move. You cannot fall. You absorb all.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"aqua","bold":true}]