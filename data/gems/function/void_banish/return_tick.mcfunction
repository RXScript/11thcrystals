# Start the timer and send the warning message
execute as @a[tag=void_banished,scores={void_return_timer=0}] at @s unless dimension gems:void run tellraw @s {"text":"YOU'RE NOT SUPPOSED TO BE HERE", "color":"red", "bold":true}

# Set the 10-second (200 tick) timer
execute as @a[tag=void_banished,scores={void_return_timer=..0}] at @s unless dimension gems:void run scoreboard players set @s void_return_timer 200

# Reset timer if they are in the correct dimension
execute as @a[tag=void_banished] at @s if dimension gems:void run scoreboard players set @s void_return_timer 0

# Tick the timer down
execute as @a[scores={void_return_timer=1..}] run scoreboard players remove @s void_return_timer 1

# Display Titles
execute as @a[scores={void_return_timer=200}] run title @s title {"text":"10", "color":"red"}
execute as @a[scores={void_return_timer=180}] run title @s title {"text":"9", "color":"red"}
execute as @a[scores={void_return_timer=160}] run title @s title {"text":"8", "color":"red"}
execute as @a[scores={void_return_timer=140}] run title @s title {"text":"7", "color":"red"}
execute as @a[scores={void_return_timer=120}] run title @s title {"text":"6", "color":"red"}
execute as @a[scores={void_return_timer=100}] run title @s title {"text":"5", "color":"red"}
execute as @a[scores={void_return_timer=80}] run title @s title {"text":"4", "color":"red"}
execute as @a[scores={void_return_timer=60}] run title @s title {"text":"3", "color":"yellow"}
execute as @a[scores={void_return_timer=40}] run title @s title {"text":"2", "color":"gold"}
execute as @a[scores={void_return_timer=20}] run title @s title {"text":"1", "color":"dark_red"}

# Play your custom effects here
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:portal ~ ~0.5 ~ 1 0.5 1 0.1 30 force
execute as @a[scores={void_return_timer=1}] at @s run playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=..30] ~ ~ ~ 1 0.8
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:falling_obsidian_tear ~ ~0.1 ~ 0.5 0.1 0.5 0 2 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:smoke ~ ~0.1 ~ 0.3 0.1 0.3 0.01 1 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:portal ~ ~0.5 ~ 1.5 0.5 1.5 2 200 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:soul ~ ~0.5 ~ 1 0.5 1 0.2 100 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:smoke ~ ~0.5 ~ 1 0.5 1 0.2 80 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:large_smoke ~ ~0.5 ~ 1 0.5 1 0.1 40 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:squid_ink ~ ~0.5 ~ 1 0.3 1 0.3 50 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:explosion ~ ~0.5 ~ 0 0 0 1 5 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:falling_obsidian_tear ~ ~0.5 ~ 1 0.5 1 0.5 60 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:dust{color:[0.2f,0.0f,0.3f],scale:2.0f} ~ ~0.5 ~ 1.5 0.5 1.5 0 100 force
execute as @a[scores={void_return_timer=1}] at @s run particle minecraft:dust{color:[0.1f,0.0f,0.2f],scale:1.5f} ~ ~0.5 ~ 1 0.5 1 0 80 force
execute as @a[scores={void_return_timer=1}] at @s run playsound minecraft:entity.lightning_bolt.thunder ambient @a[distance=..30] ~ ~ ~ 2 1
execute as @a[scores={void_return_timer=1}] at @s run playsound minecraft:entity.warden.sonic_boom ambient @a[distance=..30] ~ ~ ~ 1 0.5
execute as @a[scores={void_return_timer=1}] at @s run playsound minecraft:block.respawn_anchor.deplete ambient @a[distance=..30] ~ ~ ~ 1 0.5
execute as @a[scores={void_return_timer=1}] at @s run playsound minecraft:entity.ender_dragon.growl ambient @a[distance=..30] ~ ~ ~ 1 0.7
execute as @a[scores={void_return_timer=1}] at @s run summon lightning_bolt ~ ~ ~

# Teleport to the void dimension
execute as @a[scores={void_return_timer=1}] in gems:void run tp @s 0 75 0
