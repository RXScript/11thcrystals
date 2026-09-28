execute unless entity @s[tag=has_redstone] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_redstone] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_redstone] run return fail

# ==========================================
# REDSTONE ULTIMATE: "OVERCLOCK"
# 10 Minute Cooldown - 500 Mastery Points
# "The world stands still. You are lightning."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ CIRCUIT DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a[distance=0..100] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"dark_red","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0..100] subtitle {"text":"OVERCLOCKS REALITY","color":"red","bold":true}
tellraw @a[distance=0..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @a[distance=0..100] [{"text":"       ⬥ OVERCLOCK ACTIVATED ⬥","color":"red","bold":true}]
tellraw @a[distance=0..100] [{"text":"          ","color":"gray"},{"selector":"@s","color":"dark_red"},{"text":" becomes the living wire","color":"gray"}]
tellraw @a[distance=0..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# 3. ACTIVATION SEQUENCE - CIRCUIT IGNITION
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 30 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 150 force
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 12 12 12 2 3000 force
execute at @s run particle electric_spark ~ ~1 ~ 12 12 12 2 2000 force
execute at @s run particle end_rod ~ ~1 ~ 10 10 10 1 1500 force
execute at @s run particle firework ~ ~1 ~ 10 10 10 1 1200 force
execute at @s run particle glow ~ ~1 ~ 10 10 10 0.8 1000 force

# Vertical energy beam
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 0.5 100 0.5 0 2000 force
execute at @s run particle electric_spark ~ ~1 ~ 0.5 100 0.5 0 1500 force

# Redstone circuit pattern on ground
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~0.1 ~ 15 0.1 15 0 1500 force
execute at @s run particle electric_spark ~ ~0.1 ~ 12 0.1 12 0 1000 force

# 4. INITIAL ENERGY PULSE
execute at @s run particle sweep_attack ~ ~1 ~ 22 0.1 22 1 500 force
execute at @s run particle explosion ~ ~1 ~ 22 0.1 22 1 450 force
execute at @s run particle electric_spark ~ ~1 ~ 18 5 18 2 1500 force

# 5. TAG SYSTEM
tag @s add redstone_master
tag @s add redstone_immune

# 6. MARK ALL NEARBY ENTITIES - CIRCUIT OVERLOAD
execute at @s as @e[distance=0.1..30,tag=!redstone_immune] run tag @s add circuit_target
execute at @s as @e[distance=0.1..30,tag=circuit_target] run scoreboard players set @s circuit_hits 0

# Initial massive damage burst
execute at @s as @e[distance=0.1..30,tag=circuit_target] run damage @s 30 player_attack by @p[tag=redstone_master]

# Apply circuit disruption
execute at @s as @e[distance=0.1..30,tag=circuit_target] run effect give @s slowness 60 4 true
execute at @s as @e[distance=0.1..30,tag=circuit_target] run effect give @s mining_fatigue 60 3 true
execute at @s as @e[distance=0.1..30,tag=circuit_target] run effect give @s weakness 60 2 true

# Knockback
execute at @s as @e[distance=0.1..30,tag=circuit_target] at @s facing entity @p[tag=redstone_master] feet run tp @s ^ ^ ^-5

# Visual feedback
execute at @s as @e[distance=0.1..30,tag=circuit_target] at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s as @e[distance=0.1..30,tag=circuit_target] at @s run particle electric_spark ~ ~1 ~ 0.5 1 0.5 0.5 80 force

execute at @s run function gems:redstone/surge_rings_display

# 7. ELECTRIC SOUND SEQUENCE
execute at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound entity.creeper.primed master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.respawn_anchor.charge master @a ~ ~ ~ 3 2

# 8. GIVE OVERCLOCK BUFFS (60 seconds)
effect give @s speed 60 4 true
effect give @s haste 60 3 true
effect give @s strength 60 3 true
effect give @s resistance 60 2 true
effect give @s absorption 60 9 true
effect give @s regeneration 60 1 true
effect give @s night_vision 60 0 true

# 9. APPLY OVERCLOCK TAG
tag @s add redstone_overclock
scoreboard players set @s overclock_timer 1200
scoreboard players set @s total_circuit_damage 0
scoreboard players set @s overclock_kills 0

# 10. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 11. NOTIFY MARKED TARGETS
execute as @e[tag=circuit_target,type=player] run title @s title {"text":"⚠ CIRCUIT DISRUPTED ⚠","color":"red","bold":true}
execute as @e[tag=circuit_target,type=player] run title @s subtitle {"text":"Your nervous system is fried","color":"dark_red","italic":true}

# 12. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"     ⬥ OVERCLOCK ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Speed V + Haste IV (lightning fast)","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength IV (massive damage)","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• 30-block Circuit Domain","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Rapid Pulse: 3 damage/0.5s","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Redstone Surge: 8 damage/3s","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Enemies slowed to near-standstill","color":"red"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Circuit Meltdown: Final overload","color":"dark_red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"The world stands still. You are lightning.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]