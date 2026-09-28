execute unless entity @s[tag=has_quartz] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_quartz] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_quartz] run return fail

# ==========================================
# QUARTZ ULTIMATE: "OVERCLOCK PROTOCOL"
# 10 Minute Cooldown - 500 Mastery Points
# "Efficiency is violence. Logic is death."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ SYSTEM COOLING: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a[distance=0.1..100] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"white","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0.1..100] subtitle {"text":"ENTERS OVERCLOCK MODE","color":"gray","bold":true}
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"       ⬥ OVERCLOCK PROTOCOL INITIATED ⬥","color":"gray","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"          ","color":"gray"},{"selector":"@s","color":"white"},{"text":" achieves maximum efficiency","color":"gray"}]
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]

# 3. ACTIVATION SEQUENCE - SYSTEM BOOT
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 80 force
execute at @s run particle firework ~ ~1 ~ 10 10 10 1.5 2000 force
execute at @s run particle end_rod ~ ~1 ~ 10 10 10 1 1500 force
execute at @s run particle electric_spark ~ ~1 ~ 10 10 10 2 1500 force
execute at @s run particle glow ~ ~1 ~ 10 10 10 1 1000 force
execute at @s run particle cloud ~ ~1 ~ 8 8 8 0.5 800 force

# Vertical energy beam (machine activation)
execute at @s run particle firework ~ ~1 ~ 0.5 90 0.5 0 2000 force
execute at @s run particle end_rod ~ ~1 ~ 0.5 90 0.5 0 1500 force
execute at @s run particle electric_spark ~ ~1 ~ 0.5 90 0.5 0 1000 force

# Grid pattern on ground (machine precision)
execute at @s run particle firework ~ ~0.1 ~ 15 0.1 15 0 1000 force
execute at @s run particle electric_spark ~ ~0.1 ~ 12 0.1 12 0 800 force
execute at @s run particle end_rod ~ ~0.1 ~ 10 0.1 10 0 600 force

# 4. INITIAL ENERGY PULSE
execute at @s run particle sweep_attack ~ ~1 ~ 20 0.1 20 1 350 force
execute at @s run particle explosion ~ ~1 ~ 20 0.1 20 1 300 force
execute at @s run particle electric_spark ~ ~1 ~ 15 5 15 2 1000 force

# 5. TAG SYSTEM
tag @s add overclock_master
tag @s add overclock_immune

# 6. MARK ALL NEARBY ENTITIES - TIME DILATION
execute at @s as @e[distance=0.1..30,tag=!overclock_immune] run tag @s add time_slowed
execute at @s as @e[distance=0.1..30,tag=time_slowed] run scoreboard players set @s overclock_hits 0

# Initial damage burst
execute at @s as @e[distance=0.1..30,tag=time_slowed] run damage @s 25 player_attack by @p[tag=overclock_master]

# Apply time dilation (extreme slow)
execute at @s as @e[distance=0.1..30,tag=time_slowed] run effect give @s slowness 60 4 true
execute at @s as @e[distance=0.1..30,tag=time_slowed] run effect give @s mining_fatigue 60 4 true
execute at @s as @e[distance=0.1..30,tag=time_slowed] run effect give @s weakness 60 2 true
execute at @s as @e[distance=0.1..30,tag=time_slowed] run effect give @s jump_boost 60 250 true

# Knockback
execute at @s as @e[distance=0.1..30,tag=time_slowed] at @s facing entity @p[tag=overclock_master] feet run tp @s ^ ^ ^-3

# Visual feedback
execute at @s as @e[distance=0.1..30,tag=time_slowed] at @s run particle electric_spark ~ ~1 ~ 0.5 1 0.5 0.5 100 force
execute at @s as @e[distance=0.1..30,tag=time_slowed] at @s run particle firework ~ ~1 ~ 0.5 1 0.5 0.3 80 force
execute at @s as @e[distance=0.1..30,tag=time_slowed] at @s run particle cloud ~ ~1 ~ 0.5 1 0.5 0.2 60 force

# 7. MECHANICAL SOUND SEQUENCE
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 5 2
execute at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute at @s run playsound block.conduit.activate master @a ~ ~ ~ 3 2
execute at @s run playsound block.respawn_anchor.charge master @a ~ ~ ~ 3 2
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 2 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 3 1
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2

# 8. GIVE OVERCLOCK BUFFS (60 seconds)
effect give @s strength 60 4 true
effect give @s speed 60 3 true
effect give @s haste 60 2 true
effect give @s resistance 60 1 true
effect give @s absorption 60 9 true
effect give @s regeneration 60 1 true
effect give @s night_vision 60 0 true

# 9. APPLY OVERCLOCK TAG
tag @s add overclock_protocol
scoreboard players set @s overclock_timer 1200
scoreboard players set @s rapid_damage_dealt 0
scoreboard players set @s overclock_kills 0

# 10. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 11. NOTIFY MARKED TARGETS
execute as @e[tag=time_slowed,type=player] run title @s title {"text":"⚠ TIME DILATED ⚠","color":"gray","bold":true}
execute as @e[tag=time_slowed,type=player] run title @s subtitle {"text":"You move in slow motion","color":"white","italic":true}

# 12. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━     ","color":"white","bold":true}]
tellraw @s [{"text":"     ⬥ OVERCLOCK PROTOCOL ⬥","color":"gray","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength V (maximum output)","color":"white"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Speed IV + Haste III (overclocked)","color":"white"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• 30-block Efficiency Zone","color":"white"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Rapid Strike: 5 damage every 0.5s","color":"white"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Time Dilation: Enemies slowed","color":"white"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• System Overload: Final explosion","color":"red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"Efficiency is violence. Logic is death.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━           ","color":"white","bold":true}]