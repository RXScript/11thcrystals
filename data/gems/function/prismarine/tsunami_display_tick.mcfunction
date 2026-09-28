# Increase the age of all active wave blocks
execute as @e[type=block_display,tag=tsunami_wave] run scoreboard players add @s wave_age 1

# Move the wave outwards (^0.6) and slowly sink it into the ground (^-0.1)
# Because teleport_duration is set to 1 in the summon command, this movement is 100% smooth.
execute as @e[type=block_display,tag=tsunami_wave] at @s run tp @s ^ ^-0.06 ^0.4

# Visual effects for the tsunami wave (splash and bubble particles)
execute as @e[type=block_display,tag=tsunami_wave] at @s run particle falling_water ~ ~1 ~ 2 2 2 1 30 force
execute as @e[type=block_display,tag=tsunami_wave] at @s run particle bubble ~ ~1 ~ 2 2 2 1 80 force
execute as @e[type=block_display,tag=tsunami_wave] at @s run particle splash ~ ~1 ~ 2 2 2 2 30 force

# Once the wave has existed for 40 ticks (2 seconds) and sunken underground, delete it
execute as @e[type=block_display,tag=tsunami_wave,scores={wave_age=30..}] run kill @s