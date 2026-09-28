execute unless entity @s[tag=has_emerald] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_emerald] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_emerald] run return fail

# ==========================================
# EMERALD ADVANCED: "VITAL EXCHANGE"
# 90 Second Cooldown - 150 Mastery Points
# REQUIRES TIMING: Sacrifice HP → Hit within 3s → Drain double
# SUCCESS: Massive life steal
# FAILURE: Lose sacrificed HP permanently
# ==========================================

# 1. Cooldown Check
execute if score @s cd_90s matches 1.. run title @s actionbar [{"text":"⬥ EXCHANGE READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_90s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_90s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_90s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 150.. run title @s actionbar {"text":"⬥ Requires 150 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 150.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 150.. run return fail

# 3. Health Check (need at least 10 HP to sacrifice)
execute store result score #current_hp exchange_health run data get entity @s Health 1
execute if score #current_hp exchange_health matches ..9 run title @s actionbar {"text":"⬥ Not enough health to sacrifice!","color":"red","bold":true}
execute if score #current_hp exchange_health matches ..9 run playsound entity.villager.no master @s ~ ~ ~ 1 0.5
execute if score #current_hp exchange_health matches ..9 run return fail

# 4. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ BARGAIN SEALED ⬥","color":"green","bold":true}]
title @s subtitle {"text":"Pay the price!","color":"dark_green","italic":true}
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @s [{"text":"   ⬥ VITAL EXCHANGE ⬥","color":"green","bold":true}]
tellraw @s [{"text":"  SACRIFICE WINDOW: 1.5 seconds","color":"yellow"}]
tellraw @s [{"text":"  Hit an enemy to drain double!","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# 5. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle happy_villager ~ ~1 ~ 3 3 3 1 300 force
execute at @s run particle dust{color:[0.0,1.0,0.0],scale:3} ~ ~1 ~ 2 2 2 0.8 200 force
execute at @s run particle glow ~ ~1 ~ 2 2 2 0.3 150 force

# 6. SOUND SEQUENCE
execute at @s run playsound entity.player.hurt master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.beacon.activate master @a ~ ~ ~ 2 2
execute at @s run playsound entity.villager.trade master @a ~ ~ ~ 2 1.5

# 7. SACRIFICE HEALTH (40% of current HP)
execute store result score @s exchange_health run data get entity @s Health 1
scoreboard players operation @s exchange_sacrificed = @s exchange_health
scoreboard players operation @s exchange_sacrificed *= #40 exchange_health
scoreboard players operation @s exchange_sacrificed /= #100 exchange_health

# Apply sacrifice damage
execute store result storage exchange temp_damage int 1 run scoreboard players get @s exchange_sacrificed
function gems:emerald/apply_sacrifice with storage exchange

# 8. TAG SYSTEM
tag @s add vital_exchange_active
tag @s add exchange_immune
scoreboard players set @s exchange_window 30
scoreboard players set @s exchange_drained 0

# 9. VISUAL INDICATOR - Green aura
execute at @s run particle happy_villager ~ ~1 ~ 1 1 1 0 100 force

# 10. SET COOLDOWN (90 seconds = 1800 ticks)
scoreboard players set @s cd_90s 1800