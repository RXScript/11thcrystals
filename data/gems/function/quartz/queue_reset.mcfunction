# Check if the score is exactly 2
execute if score @s queue_rng_value matches 2 run scoreboard players set @s cd_90s 0
# REFUND VISUALS
execute if score @s queue_rng_value matches 2 at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 10 force
execute if score @s queue_rng_value matches 2 at @s run particle dust{color:[0.0,1.0,0.0],scale:4} ~ ~1 ~ 2 2 2 1 300 force
execute if score @s queue_rng_value matches 2 at @s run particle happy_villager ~ ~1 ~ 2 2 2 0.5 200 force
execute if score @s queue_rng_value matches 2 at @s run particle end_rod ~ ~1 ~ 1.5 1.5 1.5 0.3 150 force

# REFUND SOUND
execute if score @s queue_rng_value matches 2 at @s run playsound entity.player.levelup master @s ~ ~ ~ 2 2
execute if score @s queue_rng_value matches 2 at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 2 2
execute if score @s queue_rng_value matches 2 at @s run playsound block.beacon.activate master @s ~ ~ ~ 2 2

execute if score @s queue_rng_value matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
execute if score @s queue_rng_value matches 2 run tellraw @s [{"text":"  ✓ CHANCE CONFIRMED ✓","color":"green","bold":true}]
execute if score @s queue_rng_value matches 2 run tellraw @s [{"text":"  Cooldown refunded!","color":"gold"}]
execute if score @s queue_rng_value matches 2 run tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"white","bold":true}]
# Reset the score back to 0 so it's "empty" for next time
scoreboard players set @s queue_rng_value 0