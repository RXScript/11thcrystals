execute unless entity @s[tag=has_ruby] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_ruby] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_ruby] run return fail

# ==========================================
# RUBY TACTICAL: "EMBER HEART"
# 30 Second Cooldown - 50 Mastery Points
# Tactical self-burn heal
# Burn yourself (4 HP) → Heal more (8 HP)
# Gain fire aspect + strength for 5 seconds
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ HEART READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ EMBER HEART ⬥","color":"red","bold":true}]
title @s subtitle [{"text":"Blood to flame","color":"dark_red","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]
tellraw @s [{"text":"   ⬥ EMBER HEART ⬥","color":"red","bold":true}]
tellraw @s [{"text":"  Burn Cost: 4 HP","color":"dark_red"}]
tellraw @s [{"text":"  Heal Amount: 8 HP","color":"green"}]
tellraw @s [{"text":"  Net Gain: +4 HP","color":"gold"}]
tellraw @s [{"text":"  • Fire Damage (5s)","color":"yellow"}]
tellraw @s [{"text":"  • Strength II (5s)","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}]

# 4. ACTIVATION VISUALS - SELF IGNITION
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle flame ~ ~1 ~ 2 2 2 0.3 500 force
execute at @s run particle lava ~ ~1 ~ 1.5 1.5 1.5 1 300 force
execute at @s run particle dust{color:[1.0,0.0,0.0],scale:3} ~ ~1 ~ 2 2 2 1 400 force
execute at @s run particle block{block_state:"minecraft:redstone_block"} ~ ~1 ~ 1 1 1 1 200 force

# Phoenix rising effect
execute at @s run particle flame ~ ~0.1 ~ 0.8 0.1 0.8 0.3 100 force
execute at @s run particle flame ~ ~0.5 ~ 0.7 0.1 0.7 0.3 80 force
execute at @s run particle flame ~ ~1 ~ 0.6 0.1 0.6 0.3 60 force
execute at @s run particle flame ~ ~1.5 ~ 0.5 0.1 0.5 0.3 40 force
execute at @s run particle flame ~ ~2 ~ 0.4 0.1 0.4 0.3 20 force

# Burning heart effect (center of body)
execute at @s run particle dust{color:[1.0,0.2,0.0],scale:2} ~ ~1 ~ 0.3 0.5 0.3 0 30 force
execute at @s run particle lava ~ ~1 ~ 0.2 0.3 0.2 0 20 force

# 5. SOUND SEQUENCE
execute at @s run playsound entity.blaze.shoot master @a ~ ~ ~ 2 2
execute at @s run playsound entity.generic.burn master @a ~ ~ ~ 2 1
execute at @s run playsound block.fire.ambient master @a ~ ~ ~ 2 1
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 2
execute at @s run playsound entity.phoenix.death master @a ~ ~ ~ 2 2

# 6. SELF DAMAGE (4 HP - cauterize burn)
damage @s 4 on_fire

# 7. HEAL (8 HP - net +4 HP)
effect give @s instant_health 1 1 true
effect give @s regeneration 5 1 true

# Healing visuals
execute at @s run particle heart ~ ~2 ~ 0.8 0.5 0.8 0 10 force
execute at @s run particle dust{color:[1.0,0.5,0.5],scale:2} ~ ~1.5 ~ 0.8 0.8 0.8 0.3 40 force

# 8. TAG SYSTEM
tag @s add ember_heart_active
tag @s add ruby2_immune
scoreboard players set @s ember_timer 100

# 9. APPLY BUFFS (5 seconds)
effect give @s strength 5 1 true
effect give @s fire_resistance 5 0 true

# 10. SET COOLDOWN
scoreboard players set @s cd_30s 600