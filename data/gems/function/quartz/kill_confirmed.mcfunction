# ==========================================
# KILL CONFIRMED - REFUND COOLDOWN!
# ==========================================

# REFUND COOLDOWN
scoreboard players set @s cd_30s 0

# REFUND VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 10 force
execute at @s run particle dust{color:[0.0,1.0,0.0],scale:4} ~ ~1 ~ 2 2 2 1 300 force
execute at @s run particle happy_villager ~ ~1 ~ 2 2 2 0.5 200 force
execute at @s run particle end_rod ~ ~1 ~ 1.5 1.5 1.5 0.3 150 force

# REFUND SOUND
execute at @s run playsound entity.player.levelup master @s ~ ~ ~ 2 2
execute at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 2 2
execute at @s run playsound block.beacon.activate master @s ~ ~ ~ 2 2

# Messages
title @s title [{"text":"✓ EXECUTION! ✓","color":"green","bold":true}]
title @s subtitle [{"text":"Cooldown refunded!","color":"gold"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
tellraw @s [{"text":"  ✓ PERFECT EXECUTION ✓","color":"green","bold":true}]
tellraw @s [{"text":"  Target eliminated!","color":"gray"}]
tellraw @s [{"text":"  Cooldown refunded!","color":"gold"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]