# ==========================================
# THE MOUNTAIN STANDS ETERNAL
# ==========================================

# MASSIVE visual aura (visible from afar)
particle enchant ~ ~1 ~ 2 3 2 1 50 force
particle dust{color:[0.5,1.0,1.0],scale:3} ~ ~1 ~ 5 5 5 0.1 20 force
particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 2 2.5 2 0.3 30 force
particle firework ~ ~1 ~ 1.5 2 1.5 0.2 15 force

# Ground particles (anchored to earth)
particle block{block_state:{Name:"minecraft:stone"}} ~ ~0.1 ~ 1.5 0.1 1.5 0.2 10 force
particle cloud ~ ~0.1 ~ 1.5 0.1 1.5 0.05 5 force

# Vertical beam every 5 seconds
execute if score @s mountain_timer matches 1190 run particle end_rod ~ ~1 ~ 0.3 40 0.3 0 200 force
execute if score @s mountain_timer matches 1190 run particle enchant ~ ~1 ~ 0.4 40 0.4 0 150 force
execute if score @s mountain_timer matches 1190 run playsound block.beacon.power_select master @a ~ ~ ~ 1.5 2

# Orbital diamond shields (rotating protection)
execute rotated ~ 0 run particle enchant ^4 ^2 ^0 0.1 0.1 0.1 0.5 5 force
execute rotated ~45 0 run particle enchant ^4 ^2 ^0 0.1 0.1 0.1 0.5 5 force
execute rotated ~90 0 run particle enchant ^4 ^2 ^0 0.1 0.1 0.1 0.5 5 force
execute rotated ~135 0 run particle enchant ^4 ^2 ^0 0.1 0.1 0.1 0.5 5 force
execute rotated ~180 0 run particle enchant ^4 ^2 ^0 0.1 0.1 0.1 0.5 5 force
execute rotated ~225 0 run particle enchant ^4 ^2 ^0 0.1 0.1 0.1 0.5 5 force
execute rotated ~270 0 run particle enchant ^4 ^2 ^0 0.1 0.1 0.1 0.5 5 force
execute rotated ~315 0 run particle enchant ^4 ^2 ^0 0.1 0.1 0.1 0.5 5 force

# DAMAGE ABSORPTION MECHANIC
execute if entity @s[nbt={HurtTime:1s}] run function gems:diamond/absorb_damage

# TAUNT PULSE - Pull enemies toward you every 3 seconds
execute if score @s mountain_timer matches 1170 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 1110 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 1050 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 990 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 930 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 870 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 810 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 750 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 690 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 630 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 570 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 510 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 450 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 390 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 330 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 270 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 210 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 150 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 90 run function gems:diamond/taunt_pulse
execute if score @s mountain_timer matches 30 run function gems:diamond/taunt_pulse

# DAMAGE PULSE - Hurt nearby players every 5 seconds
execute if score @s mountain_timer matches 1180 run function gems:diamond/damage_pulse
execute if score @s mountain_timer matches 980 run function gems:diamond/damage_pulse
execute if score @s mountain_timer matches 780 run function gems:diamond/damage_pulse
execute if score @s mountain_timer matches 580 run function gems:diamond/damage_pulse
execute if score @s mountain_timer matches 380 run function gems:diamond/damage_pulse
execute if score @s mountain_timer matches 180 run function gems:diamond/damage_pulse

# ANCHORED - Cannot be moved
effect give @s slowness 2 5 true
effect clear @s levitation
effect clear @s slow_falling