# ==========================================
# SUCCESS - LIFE DOMINION
# ==========================================

# MASSIVE LIFE EXPLOSION
particle explosion_emitter ~ ~1 ~ 15 15 15 0 250 force
particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 40 force
particle happy_villager ~ ~1 ~ 0 0 0 8 8000 force
particle composter ~ ~1 ~ 0 0 0 6 6000 force
particle glow ~ ~1 ~ 15 15 15 2 3000 force
particle end_rod ~ ~1 ~ 12 12 12 1.5 2000 force

# MASSIVE HEALING (20 hearts)
effect give @s instant_health 1 9 true
effect give @s regeneration 20 4 true
effect give @s absorption 30 9 true

# SUCCESS BUFFS (30 seconds)
effect give @s strength 30 2 true
effect give @s speed 30 1 true
effect give @s resistance 30 0 true
effect give @s saturation 30 0 true

# LIFE STEAL TAG (20 seconds)
tag @s add life_steal_active
scoreboard players set @s life_steal_timer 400

# DAMAGE MARKED TARGETS (based on performance)
# 10-14 hits = 30 damage
# 15-19 hits = 40 damage
# 20+ hits = 50 damage
execute if score @s bargain_hits matches 10..14 as @e[tag=bargain_marked] run damage @s 30 magic by @p[tag=bargain_active]
execute if score @s bargain_hits matches 15..19 as @e[tag=bargain_marked] run damage @s 40 magic by @p[tag=bargain_active]
execute if score @s bargain_hits matches 20.. as @e[tag=bargain_marked] run damage @s 50 magic by @p[tag=bargain_active]

# Explosion visuals on remaining marked
execute as @e[tag=bargain_marked] at @s run particle explosion ~ ~1 ~ 3 3 3 0 20 force
execute as @e[tag=bargain_marked] at @s run particle happy_villager ~ ~1 ~ 2 2 2 1 200 force

# VICTORY SOUND
execute at @s run playsound entity.villager.celebrate master @a ~ ~ ~ 3 1
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 3 2
execute at @s run playsound block.beacon.power_select master @a ~ ~ ~ 3 2
execute at @s run playsound ui.toast.challenge_complete master @a ~ ~ ~ 2 1.5

# Messages
title @s title [{"text":"⬥ BARGAIN PAID ⬥","color":"green","bold":true}]
title @s subtitle [{"text":"Life bows to you","color":"dark_green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]
tellraw @s [{"text":"   ⬥ MERCHANT'S SUCCESS ⬥","color":"green","bold":true}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Hits: ","color":"gray"},{"score":{"name":"@s","objective":"bargain_hits"},"color":"yellow"},{"text":"/10","color":"gray"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Healing: +20 hearts","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Buffs: Strength III (30s)","color":"green"}]
tellraw @s [{"text":"  ","color":"gray"},{"text":"Life Steal: Active (20s)","color":"green"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"green","bold":true}]

# Notify targets
execute as @e[tag=bargain_marked,type=player] run title @s title {"text":"☠ HARVESTED ☠","color":"red","bold":true}
execute as @e[tag=bargain_marked,type=player] run title @s subtitle {"text":"Your life was the price","color":"dark_red"}

# Cleanup
tag @s remove bargain_active
tag @s remove bargain_immune
tag @e remove bargain_marked
scoreboard players reset @s bargain_hits
scoreboard players reset @s bargain_target_count