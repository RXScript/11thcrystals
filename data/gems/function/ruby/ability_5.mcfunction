execute unless entity @s[tag=has_ruby] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_ruby] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_ruby] run return fail

# ==========================================
# RUBY ULTIMATE: "PHOENIX PROTOCOL"
# 10 Minute Cooldown - 500 Mastery Points
# "Death is not the end. It is fuel."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ PHOENIX DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a[distance=0.1..100] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"dark_red","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0.1..100] subtitle {"text":"BECOMES THE PHOENIX","color":"#FF4500","bold":true}
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"       ⬥ PHOENIX PROTOCOL ACTIVATED ⬥","color":"#FF4500","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"          ","color":"gray"},{"selector":"@s","color":"dark_red"},{"text":" embraces the cycle","color":"gray"}]
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_red","bold":true}]

# 3. ACTIVATION SEQUENCE - PHOENIX IGNITION
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 60 force
execute at @s run particle flame ~ ~1 ~ 10 10 10 0.8 2000 force
execute at @s run particle soul_fire_flame ~ ~1 ~ 8 8 8 0.6 1500 force
execute at @s run particle lava ~ ~1 ~ 8 8 8 1 300 force
execute at @s run particle smoke ~ ~1 ~ 10 10 10 0.5 1000 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 2 800 force
execute at @s run particle firework ~ ~1 ~ 8 8 8 1 1000 force

# Phoenix rising (vertical fire pillar)
execute at @s run particle flame ~ ~1 ~ 0.5 80 0.5 0 1500 force
execute at @s run particle soul_fire_flame ~ ~1 ~ 0.5 80 0.5 0 1000 force
execute at @s run particle lava ~ ~30 ~ 8 10 8 1 200 force

# Inferno wave on ground
execute at @s run particle flame ~ ~0.1 ~ 15 0.1 15 0.5 800 force
execute at @s run particle soul_fire_flame ~ ~0.1 ~ 12 0.1 12 0.3 600 force
execute at @s run particle lava ~ ~0.1 ~ 10 0.1 10 0.5 200 force

# 4. INITIAL IGNITION WAVE
execute at @s run particle sweep_attack ~ ~1 ~ 20 0.1 20 1 300 force
execute at @s run particle explosion ~ ~1 ~ 20 0.1 20 1 250 force
execute at @s run particle flame ~ ~1 ~ 15 5 15 1 1500 force

# 5. TAG SYSTEM
tag @s add phoenix_master
tag @s add phoenix_immune
tag @s add has_rebirth

# 6. MARK AND IGNITE ALL NEARBY ENTITIES
execute at @s as @e[distance=0.1..30,tag=!phoenix_immune] run tag @s add burning_target
execute at @s as @e[distance=0.1..30,tag=burning_target] run scoreboard players set @s burn_stacks 0

# Initial massive damage and ignition
execute at @s as @e[distance=0.1..30,tag=burning_target] run damage @s 20 player_attack by @p[tag=phoenix_master]
execute at @s as @e[distance=0.1..30,tag=burning_target] run effect give @s wither 10 2 true

# Set on fire
execute at @s as @e[distance=0.1..30,tag=burning_target] run data merge entity @s {Fire:600s}

# Knockback from inferno
execute at @s as @e[distance=0.1..30,tag=burning_target] at @s facing entity @p[tag=phoenix_master] feet run tp @s ^ ^ ^-4
execute at @s as @e[distance=0.1..30,tag=burning_target] run effect give @s levitation 1 8 true

# Visual feedback
execute at @s as @e[distance=0.1..30,tag=burning_target] at @s run particle flame ~ ~1 ~ 0.5 1 0.5 0.5 100 force
execute at @s as @e[distance=0.1..30,tag=burning_target] at @s run particle soul_fire_flame ~ ~1 ~ 0.5 1 0.5 0.3 80 force
execute at @s as @e[distance=0.1..30,tag=burning_target] at @s run particle lava ~ ~1 ~ 0.5 1 0.5 0.5 30 force

# 7. INFERNO SOUND SEQUENCE
execute at @s run playsound entity.blaze.death master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.generic.explode master @a ~ ~ ~ 3 0.5
execute at @s run playsound item.firecharge.use master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 3 2
execute at @s run playsound block.fire.ambient master @a ~ ~ ~ 3 1
execute at @s run playsound item.totem.use master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.phoenix.death master @a ~ ~ ~ 3 1
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2

# 8. GIVE PHOENIX BUFFS (60 seconds)
effect give @s strength 60 3 true
effect give @s speed 60 2 true
effect give @s resistance 60 1 true
effect give @s absorption 60 9 true
effect give @s regeneration 60 3 true
effect give @s fire_resistance 60 0 true

# 9. APPLY PHOENIX TAG
tag @s add phoenix_protocol
scoreboard players set @s phoenix_timer 1200
scoreboard players set @s burn_damage_dealt 0
scoreboard players set @s phoenix_kills 0
scoreboard players set @s rebirth_ready 1

# 10. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 11. NOTIFY MARKED TARGETS
execute as @e[tag=burning_target,type=player] run title @s title {"text":"⚠ IGNITED ⚠","color":"dark_red","bold":true}
execute as @e[tag=burning_target,type=player] run title @s subtitle {"text":"Your flesh burns to ash","color":"red","italic":true}

# 12. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━     ","color":"dark_red","bold":true}]
tellraw @s [{"text":"     ⬥ PHOENIX PROTOCOL ⬥","color":"#FF4500","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength IV (massive damage)","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• 30-block Inferno Zone","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Immolation: 8 fire damage/1.5s","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Phoenix Rebirth: Resurrect once","color":"gold","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Burn damage heals you","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Supernova: Final explosion","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"Death is not the end. It is fuel.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━          ","color":"dark_red","bold":true}]

give @s heart_of_the_sea[custom_name=[{"text":"Phoenix Rebirth Crystal","bold":true,"italic":false,"color":"dark_red"}],lore=[[{"text":"A crystal only worthy for those who wield","italic":false}],[{"text":"the fiery blaze of the Ruby Crystal, this","italic":false}],[{"text":"crystal is capable of bringing the dead back","italic":false}],[{"text":"to life and in the process making them","italic":false}],[{"text":"stronger than before.","italic":false}]],rarity=epic,enchantment_glint_override=true,unbreakable={},custom_model_data={floats:[5]},death_protection={death_effects:[{type:"minecraft:apply_effects",effects:[{id:"minecraft:absorption",amplifier:9,duration:600},{id:"minecraft:fire_resistance",amplifier:1,duration:600},{id:"minecraft:instant_health",amplifier:1,duration:600},{id:"minecraft:regeneration",amplifier:6,duration:600},{id:"minecraft:resistance",amplifier:3,duration:600},{id:"minecraft:strength",amplifier:2,duration:600}]}]}]