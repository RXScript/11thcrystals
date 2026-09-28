execute unless entity @s[tag=has_echo] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_echo] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_echo] run return fail

# ==========================================
# ECHO SHARD ULTIMATE: "VOID WALKER"
# 10 Minute Cooldown - 500 Mastery Points
# "You walk between moments. They cannot find you."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ VOID DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a[distance=0.1..100] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"#1a1a2e","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0.1..100] subtitle {"text":"ENTERS THE VOID","color":"#0f3460","bold":true}
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"       ⬥ VOID WALKER AWAKENED ⬥","color":"#0f3460","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"          ","color":"gray"},{"selector":"@s","color":"#1a1a2e"},{"text":" steps between time","color":"gray"}]
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","bold":true}]

# 3. ACTIVATION SEQUENCE - REALITY FRACTURE
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 100 force
execute at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 30 force
execute at @s run particle sculk_soul ~ ~1 ~ 12 12 12 2 2000 force
execute at @s run particle soul_fire_flame ~ ~1 ~ 10 10 10 1.5 1500 force
execute at @s run particle reverse_portal ~ ~1 ~ 10 10 10 2 1500 force
execute at @s run particle smoke ~ ~1 ~ 10 10 10 1 1200 force
execute at @s run particle dragon_breath ~ ~1 ~ 8 8 8 1 1000 force

# Vertical void tear
execute at @s run particle sculk_soul ~ ~1 ~ 0.5 90 0.5 0 1500 force
execute at @s run particle reverse_portal ~ ~1 ~ 0.5 90 0.5 0 1200 force
execute at @s run particle smoke ~ ~1 ~ 0.5 90 0.5 0 1000 force

# Darkness spreading on ground
execute at @s run particle soul_fire_flame ~ ~0.1 ~ 15 0.1 15 0 1000 force
execute at @s run particle sculk_soul ~ ~0.1 ~ 12 0.1 12 0 800 force
execute at @s run particle smoke ~ ~0.1 ~ 10 0.1 10 0 600 force

# 4. INITIAL VOID PULSE
execute at @s run particle sweep_attack ~ ~1 ~ 20 0.1 20 1 400 force
execute at @s run particle explosion ~ ~1 ~ 20 0.1 20 1 350 force
execute at @s run particle sonic_boom ~ ~1 ~ 12 5 12 0 80 force

# 5. TAG SYSTEM
tag @s add void_master
tag @s add void_immune

# 6. MARK ALL NEARBY ENTITIES - SCULK INFECTION
execute at @s as @e[distance=0.1..30,tag=!void_immune] run tag @s add sculk_infected
execute at @s as @e[distance=0.1..30,tag=sculk_infected] run scoreboard players set @s void_damage 0

# Initial massive damage burst
execute at @s as @e[distance=0.1..30,tag=sculk_infected] run damage @s 30 player_attack by @p[tag=void_master]

# Apply sculk infection effects
execute at @s as @e[distance=0.1..30,tag=sculk_infected] run effect give @s darkness 60 0 true
execute at @s as @e[distance=0.1..30,tag=sculk_infected] run effect give @s slowness 60 1 true
execute at @s as @e[distance=0.1..30,tag=sculk_infected] run effect give @s weakness 60 1 true

# Knockback
execute at @s as @e[distance=0.1..30,tag=sculk_infected] at @s facing entity @p[tag=void_master] feet run tp @s ^ ^ ^-5

# Visual feedback
execute at @s as @e[distance=0.1..30,tag=sculk_infected] at @s run particle sculk_soul ~ ~1 ~ 0.5 1 0.5 1 100 force
execute at @s as @e[distance=0.1..30,tag=sculk_infected] at @s run particle soul_fire_flame ~ ~1 ~ 0.5 1 0.5 0.5 80 force
execute at @s as @e[distance=0.1..30,tag=sculk_infected] at @s run particle smoke ~ ~1 ~ 0.5 1 0.5 0.3 60 force

# 7. VOID SOUND SEQUENCE
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.warden.emerge master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.enderman.scream master @a ~ ~ ~ 3 0.5
execute at @s run playsound block.sculk_shrieker.shriek master @a ~ ~ ~ 3 1
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound item.totem.use master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.warden.death master @a ~ ~ ~ 2 2

# 8. GIVE VOID WALKER BUFFS (60 seconds)
effect give @s strength 60 3 true
effect give @s speed 60 3 true
effect give @s invisibility 60 0 true
effect give @s resistance 60 2 true
effect give @s absorption 60 9 true
effect give @s regeneration 60 2 true
effect give @s night_vision 60 0 true

# 9. APPLY VOID TAG
tag @s add void_walker
scoreboard players set @s void_timer 1200
scoreboard players set @s total_void_damage 0
scoreboard players set @s void_kills 0

# 10. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 11. NOTIFY MARKED TARGETS
execute as @e[tag=sculk_infected,type=player] run title @s title {"text":"⚠ SCULK INFECTED ⚠","color":"#0f3460","bold":true}
execute as @e[tag=sculk_infected,type=player] run title @s subtitle {"text":"The void consumes you","color":"dark_gray","italic":true}

# 12. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━     ","color":"dark_gray","bold":true}]
tellraw @s [{"text":"     ⬥ VOID WALKER ⬥","color":"#0f3460","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength IV + Speed IV","color":"#0f3460"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Invisibility (walk unseen)","color":"#0f3460"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• 30-block Void Domain","color":"#0f3460"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Void Decay: 7 damage/1.5s","color":"#0f3460"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Sonic Scream: 12 damage/3s","color":"#0f3460"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Sculk Spread: Infects all","color":"#0f3460"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Silent Death: Final void collapse","color":"red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"You walk between moments. They cannot find you.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━          ","color":"dark_gray","bold":true}]