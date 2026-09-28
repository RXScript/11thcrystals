# Pull the player down into the void
# Called every tick for players being banished

# Decrease timer
scoreboard players remove @s void_banish_timer 1

# Apply strong blindness and levitation (negative for pulling down)
effect give @s blindness 2 4 true
effect give @s darkness 2 0 true
effect give @s slowness 2 10 true

# Pull player down gradually (faster as they go deeper)
execute if score @s void_banish_timer matches 80..100 run tp @s ~ ~-0.15 ~
execute if score @s void_banish_timer matches 60..79 run tp @s ~ ~-0.25 ~
execute if score @s void_banish_timer matches 40..59 run tp @s ~ ~-0.35 ~
execute if score @s void_banish_timer matches 20..39 run tp @s ~ ~-0.45 ~
execute if score @s void_banish_timer matches 1..19 run tp @s ~ ~-0.6 ~

# Particles around the player
particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.5 5 force
particle minecraft:falling_obsidian_tear ~ ~1 ~ 0.3 0.5 0.3 0 3 force
particle minecraft:smoke ~ ~0.5 ~ 0.2 0.3 0.2 0.01 2 force

# Sound effects during descent
execute if score @s void_banish_timer matches 90 run playsound minecraft:entity.warden.heartbeat ambient @s ~ ~ ~ 2 0.7
execute if score @s void_banish_timer matches 70 run playsound minecraft:entity.warden.heartbeat ambient @s ~ ~ ~ 2 0.6
execute if score @s void_banish_timer matches 50 run playsound minecraft:entity.warden.heartbeat ambient @s ~ ~ ~ 2 0.5
execute if score @s void_banish_timer matches 30 run playsound minecraft:block.portal.travel ambient @s ~ ~ ~ 1 0.5

# If timer runs out but player hasn't reached void yet, force teleport
execute if score @s void_banish_timer matches 0 run function gems:void_banish/teleport_to_void