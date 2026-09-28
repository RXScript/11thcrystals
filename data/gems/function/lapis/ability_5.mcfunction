execute unless entity @s[tag=has_lapis] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_lapis] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_lapis] run return fail

# ==========================================
# LAPIS ULTIMATE: "ARCANE DOMINION"
# 10 Minute Cooldown - 500 Mastery Points
# "You write the laws. Reality obeys."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ ARCANE DORMANT: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a[distance=0.1..100] title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"dark_blue","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a[distance=0.1..100] subtitle {"text":"REWRITES THE LAWS OF MAGIC","color":"#0080FF","bold":true}
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_blue","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"       ⬥ ARCANE DOMINION AWAKENED ⬥","color":"#0080FF","bold":true}]
tellraw @a[distance=0.1..100] [{"text":"          ","color":"gray"},{"selector":"@s","color":"dark_blue"},{"text":" commands reality itself","color":"gray"}]
tellraw @a[distance=0.1..100] [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_blue","bold":true}]

# 3. ACTIVATION SEQUENCE - REALITY REWRITE
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 12 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 50 force
execute at @s run particle enchant ~ ~1 ~ 10 10 10 3 1500 force
execute at @s run particle witch ~ ~1 ~ 8 8 8 1.5 1000 force
execute at @s run particle soul ~ ~1 ~ 8 8 8 1 800 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 2 800 force
execute at @s run particle glow ~ ~1 ~ 10 10 10 1 1000 force
execute at @s run particle reverse_portal ~ ~1 ~ 8 8 8 2 1200 force
execute at @s run particle dragon_breath ~ ~1 ~ 6 6 6 1 800 force

# Celestial pillar (stars falling from sky)
execute at @s run particle enchant ~ ~1 ~ 0.5 70 0.5 0 1000 force
execute at @s run particle soul ~ ~1 ~ 0.5 70 0.5 0 800 force
execute at @s run particle glow ~ ~50 ~ 10 10 10 0.5 500 force

# Arcane circle on ground
execute at @s run particle enchant ~ ~0.1 ~ 15 0.1 15 0 800 force
execute at @s run particle witch ~ ~0.1 ~ 12 0.1 12 0 600 force
execute at @s run particle soul ~ ~0.1 ~ 10 0.1 10 0 500 force

# 4. INITIAL ARCANE WAVE
execute at @s run particle sweep_attack ~ ~1 ~ 20 0.1 20 1 300 force
execute at @s run particle explosion ~ ~1 ~ 20 0.1 20 1 250 force
execute at @s run particle enchant ~ ~1 ~ 15 5 15 2 1000 force

# 5. TAG SYSTEM
tag @s add arcane_master
tag @s add arcane_immune

# 6. MARK ALL NEARBY ENTITIES - DRAIN THEIR KNOWLEDGE
execute at @s as @e[distance=0.1..30,tag=!arcane_immune] run tag @s add arcane_victim
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run scoreboard players set @s arcane_drain 0

# Initial damage and XP drain
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run damage @s 25 player_attack by @p[tag=arcane_master]
execute at @s as @e[distance=0.1..30,tag=arcane_victim,type=player] run xp add @s -10 levels

# Visual feedback for marked targets
execute at @s as @e[distance=0.1..30,tag=arcane_victim] at @s run particle enchant ~ ~1 ~ 0.5 1 0.5 2 150 force
execute at @s as @e[distance=0.1..30,tag=arcane_victim] at @s run particle witch ~ ~2 ~ 0.5 1 0.5 1 100 force
execute at @s as @e[distance=0.1..30,tag=arcane_victim] at @s run particle soul ~ ~1 ~ 0.5 1 0.5 0.5 80 force

# 7. APOCALYPTIC SOUND SEQUENCE
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 5 0.5
execute at @s run playsound entity.evoker.prepare_summon master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound entity.illusioner.cast_spell master @a ~ ~ ~ 3 1
execute at @s run playsound block.end_portal.spawn master @a ~ ~ ~ 3 1.5
execute at @s run playsound item.totem.use master @a ~ ~ ~ 3 0.8
execute at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 2 2
execute at @s run playsound block.respawn_anchor.charge master @a ~ ~ ~ 3 2

# 8. GIVE ARCANE MASTER BUFFS (60 seconds)
effect give @s strength 60 4 true
effect give @s speed 60 2 true
effect give @s resistance 60 2 true
effect give @s absorption 60 9 true
effect give @s regeneration 60 2 true
effect give @s fire_resistance 60 0 true
effect give @s night_vision 60 0 true
effect give @s water_breathing 60 0 true

# 9. APPLY DOMINION TAG
tag @s add arcane_dominion
scoreboard players set @s dominion_timer 1200
scoreboard players set @s xp_stolen 0
scoreboard players set @s dominion_kills 0

# 10. APPLY "LAWS OF MAGIC" - Crippling debuffs
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run effect give @s slowness 60 2 true
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run effect give @s weakness 60 2 true
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run effect give @s mining_fatigue 60 2 true
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run effect give @s unluck 60 2 true

# 11. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 12. NOTIFY MARKED TARGETS
execute as @e[tag=arcane_victim,type=player] run title @s title {"text":"⚠ DOMINATED ⚠","color":"dark_blue","bold":true}
execute as @e[tag=arcane_victim,type=player] run title @s subtitle {"text":"Your knowledge is being drained","color":"blue","italic":true}

# 13. INSTANT XP BOOST TO CASTER
xp add @s 50 levels

# 14. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━     ","color":"dark_blue","bold":true}]
tellraw @s [{"text":"     ⬥ ARCANE DOMINION ⬥","color":"#0080FF","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Strength V (godlike damage)","color":"dark_blue"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• 30-block Dominion Zone","color":"dark_blue"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Arcane Drain: 10 damage + XP theft","color":"dark_blue"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Laws of Magic: Massive debuffs","color":"dark_blue"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Reality Nullification: Clear buffs","color":"dark_blue"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Cosmic Rift: Final arcane explosion","color":"red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"You write the laws. Reality obeys.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━          ","color":"dark_blue","bold":true}]