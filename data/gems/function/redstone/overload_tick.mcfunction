# ELECTRICAL OVERLOAD - Energy burning you
execute at @s run damage @s 3 lightning_bolt
scoreboard players add @s overload_damage 3

# Visual feedback - sparking
particle electric_spark ~ ~1 ~ 0.8 1 0.8 0.5 60 force
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.6 0.8 0.6 0.3 50 force
particle flame ~ ~1 ~ 0.5 0.6 0.5 0.2 40 force

# Sound
execute at @s run playsound entity.lightning_bolt.impact master @s ~ ~ ~ 1 2
execute at @s run playsound entity.creeper.hurt master @s ~ ~ ~ 0.8 2

execute if score @s discharge_hits matches 7.. run effect give @s instant_health 1 1 true