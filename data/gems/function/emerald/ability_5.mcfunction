execute unless entity @s[tag=has_emerald] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_emerald] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_emerald] run return fail

# ==========================================
# EMERALD ULTIMATE: "EMERALD HARVEST"
# 10 Minute Cooldown - 500 Mastery Points
# "Life has a price. You are the collector."
# ==========================================

# 1. Cooldown Check
execute if score @s cd_10m matches 1.. run title @s actionbar [{"text":"⬥ HARVEST DEPLETED: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_10m"},"color":"yellow"},{"text":" ticks remaining","color":"gray"}]
execute if score @s cd_10m matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_10m matches 1.. run return fail

# 2. SERVER-WIDE ANNOUNCEMENT
title @a title [{"text":"⬥ ","color":"white","bold":true},{"selector":"@s","color":"green","bold":true},{"text":" ⬥","color":"white","bold":true}]
title @a subtitle {"text":"HARVESTS THE LIVING GREEN","color":"#00FF00","bold":true}
tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @a [{"text":"       ⬥ EMERALD HARVEST AWAKENED ⬥","color":"#00FF00","bold":true}]
tellraw @a [{"text":"          ","color":"gray"},{"selector":"@s","color":"green"},{"text":" reaps the price of life","color":"gray"}]
tellraw @a [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# 3. ACTIVATION EXPLOSION - LIFE SURGE
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 8 force
execute at @s run particle explosion_emitter ~ ~1 ~ 0 0 0 0 30 force
execute at @s run particle happy_villager ~ ~1 ~ 8 8 8 2 1000 force
execute at @s run particle composter ~ ~1 ~ 6 6 6 1.5 800 force
execute at @s run particle glow ~ ~1 ~ 8 8 8 0.5 600 force
execute at @s run particle end_rod ~ ~1 ~ 0 0 0 1.5 500 force
execute at @s run particle enchant ~ ~1 ~ 6 6 6 2 800 force
execute at @s run particle heart ~ ~1 ~ 5 5 5 0.5 200 force

# Living vines growing upward
execute at @s run particle happy_villager ~ ~1 ~ 0.5 50 0.5 0 500 force
execute at @s run particle composter ~ ~1 ~ 0.5 50 0.5 0 400 force

# Roots spreading outward
execute at @s run particle composter ~ ~0.1 ~ 12 0.1 12 1 600 force
execute at @s run particle happy_villager ~ ~0.1 ~ 10 0.1 10 0.5 400 force

# 4. INITIAL LIFE DRAIN WAVE
execute at @s run particle sweep_attack ~ ~1 ~ 15 0.1 15 1 200 force
execute at @s run particle explosion ~ ~1 ~ 15 0.1 15 1 150 force
execute at @s run particle happy_villager ~ ~1 ~ 12 5 12 1 800 force

# 5. TAG SYSTEM
tag @s add harvest_master
tag @s add harvest_immune

# 6. MARK ALL NEARBY ENTITIES AS HARVEST TARGETS
execute at @s as @e[distance=0.1..30,tag=!harvest_immune] run tag @s add life_source
execute at @s as @e[distance=0.1..30,tag=life_source] run effect give @s glowing 60 0 true

# Initial damage wave
execute at @s as @e[distance=0.1..30,tag=life_source] run damage @s 15 player_attack by @p[tag=harvest_master]

# Visual feedback for marked targets
execute at @s as @e[distance=0.1..30,tag=life_source] at @s run particle angry_villager ~ ~2 ~ 0.5 0.5 0.5 0 10 force
execute at @s as @e[distance=0.1..30,tag=life_source] at @s run particle happy_villager ~ ~1 ~ 0.5 1 0.5 0.5 50 force

# 7. EPIC SOUND SEQUENCE
execute at @s run playsound entity.evoker.prepare_summon master @a ~ ~ ~ 3 0.5
execute at @s run playsound entity.villager.celebrate master @a ~ ~ ~ 3 0.8
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 3 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.grass.break master @a ~ ~ ~ 3 0.5
execute at @s run playsound item.totem.use master @a ~ ~ ~ 2 0.8
execute at @s run playsound entity.evoker.cast_spell master @a ~ ~ ~ 2 1

# 8. GIVE HARVEST BUFFS (60 seconds)
effect give @s regeneration 60 5 true
effect give @s absorption 60 9 true
effect give @s resistance 60 1 true
effect give @s strength 60 2 true
effect give @s speed 60 1 true
effect give @s saturation 60 0 true
effect give @s fire_resistance 60 0 true

# 9. APPLY HARVEST TAG
tag @s add emerald_harvest
scoreboard players set @s harvest_timer 1200
scoreboard players set @s life_stolen 0
scoreboard players set @s harvest_kills 0

# 10. SET COOLDOWN (10 minutes = 12000 ticks)
scoreboard players set @s cd_10m 12000

# 11. NOTIFY MARKED TARGETS
execute as @e[tag=life_source,type=player] run title @s title {"text":"⚠ MARKED FOR HARVEST ⚠","color":"dark_green","bold":true}
execute as @e[tag=life_source,type=player] run title @s subtitle {"text":"Your life force is being drained","color":"green","italic":true}

# 12. INSTANT HEAL CASTER
effect give @s instant_health 1 10 true

# 13. PLAYER FEEDBACK
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @s [{"text":"     ⬥ EMERALD HARVEST ⬥","color":"#00FF00","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Duration: ","color":"gray"},{"text":"60 seconds","color":"yellow"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Regeneration VI (insane healing)","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Absorption X (20 hearts)","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Life Drain: Heal from all damage dealt","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Passive Harvest: Drain 30-block radius","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Effect Theft: Steal beneficial effects","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"• Nature's Wrath: Final explosion on end","color":"red"}]
tellraw @s [{"text":"  ","color":"dark_gray","italic":true},{"text":"Life has a price. You collect the debt.","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]