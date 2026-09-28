# ============================================
# ENHANCED CRYSTAL AWAKENING - ANIMATION LOOP
# 10 Second Journey (200 ticks)
# ============================================

# Increase timer
scoreboard players add @s roulette_timer 1

# Update boss bar progress
execute store result bossbar crystal_awakening value run scoreboard players get @s roulette_timer

# ============================================
# PHASE 1: AWAKENING (0-40 ticks / 0-2 seconds)
# Fast cycling, purple mystic energy
# ============================================
execute if score @s roulette_timer matches 1..40 run bossbar set crystal_awakening color purple
execute if score @s roulette_timer matches 1..40 run bossbar set crystal_awakening name {"text":"✦ AWAKENING ✦","color":"dark_purple","bold":true}

# Fast cycling speed (every 3 ticks)
execute if score @s roulette_timer matches 1..40 run scoreboard players operation #anim crystal_roll = @s roulette_timer
execute if score @s roulette_timer matches 1..40 run scoreboard players operation #anim crystal_roll /= #three globalID
execute if score @s roulette_timer matches 1..40 run scoreboard players operation #anim crystal_roll %= #eleven globalID

# Phase 1 sounds - mystical chimes
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 1 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 1.8
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 4 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 1.7
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 7 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 1.6
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 10 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 1.5
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 13 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 1.4
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 16 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 1.3
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 19 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 1.2
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 22 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 1.1
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 25 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 1.0
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 28 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 0.9
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 31 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 0.8
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 34 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 0.7
execute if score @s roulette_timer matches 1..40 if score @s roulette_timer matches 37 run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 0.7 0.6

# Phase 1 particles - portal swirl
execute if score @s roulette_timer matches 1..40 run particle minecraft:portal ~ ~1 ~ 0.8 0.8 0.8 0.3 20 force @s
execute if score @s roulette_timer matches 1..40 run particle minecraft:reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.1 15 force @s

# ============================================
# PHASE 2: ACCELERATION (41-90 ticks / 2-4.5 seconds)
# Ultra-fast cycling, energy building
# ============================================
execute if score @s roulette_timer matches 41..90 run bossbar set crystal_awakening color blue
execute if score @s roulette_timer matches 41..90 run bossbar set crystal_awakening name {"text":"✦ ACCELERATING ✦","color":"aqua","bold":true}

# Transition sound
execute if score @s roulette_timer matches 41 run playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 1.5

# Very fast cycling (every 2 ticks)
execute if score @s roulette_timer matches 41..90 run scoreboard players operation #anim crystal_roll = @s roulette_timer
execute if score @s roulette_timer matches 41..90 run scoreboard players operation #anim crystal_roll /= #two globalID
execute if score @s roulette_timer matches 41..90 run scoreboard players operation #anim crystal_roll %= #eleven globalID

# Phase 2 sounds - rapid pling
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 43 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.6
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 45 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.5
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 47 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.4
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 49 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.3
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 51 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.2
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 53 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.1
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 55 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.0
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 57 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.9
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 59 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.8
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 61 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.7
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 63 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.6
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 65 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.5
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 67 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.4
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 69 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.3
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 71 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.2
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 73 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.1
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 75 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 0.0
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 77 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.9
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 79 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.8
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 81 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.7
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 83 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.6
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 85 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.5
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 87 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.4
execute if score @s roulette_timer matches 41..90 if score @s roulette_timer matches 89 run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 0.8 1.3

# Phase 2 particles - intense energy
execute if score @s roulette_timer matches 41..90 run particle minecraft:end_rod ~ ~1 ~ 0.6 0.6 0.6 0.08 25 force @s
execute if score @s roulette_timer matches 41..90 run particle minecraft:electric_spark ~ ~1 ~ 0.7 0.7 0.7 0.1 15 force @s

# Screen shake simulation (levitation micro-pulses)
execute if score @s roulette_timer matches 50 run effect give @s levitation 1 1 true
execute if score @s roulette_timer matches 60 run effect give @s levitation 1 1 true
execute if score @s roulette_timer matches 70 run effect give @s levitation 1 1 true
execute if score @s roulette_timer matches 80 run effect give @s levitation 1 1 true

# ============================================
# PHASE 3: INTENSIFYING (91-140 ticks / 4.5-7 seconds)
# Slowing down, building tension
# ============================================
execute if score @s roulette_timer matches 91..140 run bossbar set crystal_awakening color yellow
execute if score @s roulette_timer matches 91..140 run bossbar set crystal_awakening name {"text":"✦ INTENSIFYING ✦","color":"gold","bold":true}

# Transition sound
execute if score @s roulette_timer matches 91 run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 1 1.2

# Medium cycling speed (every 4 ticks)
execute if score @s roulette_timer matches 91..140 run scoreboard players operation #anim crystal_roll = @s roulette_timer
execute if score @s roulette_timer matches 91..140 run scoreboard players operation #anim crystal_roll /= #four globalID
execute if score @s roulette_timer matches 91..140 run scoreboard players operation #anim crystal_roll %= #eleven globalID

# Phase 3 sounds - bit with decreasing pitch
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 95 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 1.4
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 99 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 1.3
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 103 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 1.2
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 107 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 1.1
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 111 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 1.0
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 115 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.9
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 119 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.8
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 123 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.7
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 127 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.6
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 131 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.5
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 135 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.4
execute if score @s roulette_timer matches 91..140 if score @s roulette_timer matches 139 run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1 0.3

# Phase 3 particles - mixed energy
execute if score @s roulette_timer matches 91..140 run particle minecraft:enchant ~ ~1 ~ 1 1 1 0.2 40 force @s
execute if score @s roulette_timer matches 91..140 run particle minecraft:witch ~ ~1 ~ 0.5 0.5 0.5 0.05 10 force @s

# Darkness pulses (tension building)
execute if score @s roulette_timer matches 100 run effect give @s darkness 2 0 true
execute if score @s roulette_timer matches 120 run effect give @s darkness 2 0 true

# ============================================
# PHASE 4: CRYSTALLIZING (141-179 ticks / 7-9 seconds)
# Very slow cycling, almost decided
# ============================================
execute if score @s roulette_timer matches 141..179 run bossbar set crystal_awakening color red
execute if score @s roulette_timer matches 141..179 run bossbar set crystal_awakening name {"text":"✦ CRYSTALLIZING ✦","color":"red","bold":true}

# Transition sound
execute if score @s roulette_timer matches 141 run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 1 0.9

# Slow cycling (every 6 ticks)
execute if score @s roulette_timer matches 141..179 run scoreboard players operation #anim crystal_roll = @s roulette_timer
execute if score @s roulette_timer matches 141..179 run scoreboard players operation #anim crystal_roll /= #six globalID
execute if score @s roulette_timer matches 141..179 run scoreboard players operation #anim crystal_roll %= #eleven globalID

# Phase 4 sounds - deep bass
execute if score @s roulette_timer matches 141..179 if score @s roulette_timer matches 147 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1.2 0.9
execute if score @s roulette_timer matches 141..179 if score @s roulette_timer matches 153 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1.2 0.8
execute if score @s roulette_timer matches 141..179 if score @s roulette_timer matches 159 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1.2 0.7
execute if score @s roulette_timer matches 141..179 if score @s roulette_timer matches 165 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1.2 0.6
execute if score @s roulette_timer matches 141..179 if score @s roulette_timer matches 171 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1.2 0.5
execute if score @s roulette_timer matches 141..179 if score @s roulette_timer matches 177 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1.2 0.4

# Phase 4 particles - crystalline forming
execute if score @s roulette_timer matches 141..179 run particle minecraft:sculk_soul ~ ~1 ~ 0.4 0.4 0.4 0.02 8 force @s
execute if score @s roulette_timer matches 141..179 run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.3 0.3 0.01 5 force @s

# Countdown in actionbar for final 5 seconds
execute if score @s roulette_timer matches 160 run title @s actionbar {"text":"⏱ 2 seconds remaining...","color":"yellow","bold":true}
execute if score @s roulette_timer matches 170 run title @s actionbar {"text":"⏱ 1.5 seconds remaining...","color":"gold","bold":true}

# ============================================
# PHASE 5: FINAL PAUSE (180-199 ticks / 9-10 seconds)
# Frozen on result, dramatic silence
# ============================================
execute if score @s roulette_timer matches 180..199 run bossbar set crystal_awakening color white
execute if score @s roulette_timer matches 180..199 run bossbar set crystal_awakening name {"text":"✦ CRYSTALLIZED ✦","color":"white","bold":true}

# Final result freeze sound
execute if score @s roulette_timer matches 180 run playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 1 0.6
execute if score @s roulette_timer matches 180 run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 0.3 2.0

# Freeze on final result (divide by 1000 to get a stable number)
execute if score @s roulette_timer matches 180..199 run scoreboard players set #anim crystal_roll 180
execute if score @s roulette_timer matches 180..199 run scoreboard players operation #anim crystal_roll /= #six globalID
execute if score @s roulette_timer matches 180..199 run scoreboard players operation #anim crystal_roll %= #eleven globalID

# Dramatic pause particles - frozen energy
execute if score @s roulette_timer matches 180..199 run particle minecraft:end_rod ~ ~1 ~ 0.8 0.8 0.8 0 50 force @s
execute if score @s roulette_timer matches 180..199 run particle minecraft:firework ~ ~1 ~ 0.3 0.3 0.3 0.05 5 force @s

# Final countdown
execute if score @s roulette_timer matches 180 run title @s actionbar {"text":"⏱ 1 second...","color":"red","bold":true}
execute if score @s roulette_timer matches 190 run title @s actionbar {"text":"⏱ 0.5 seconds...","color":"dark_red","bold":true}

# Intense darkness right before reveal
execute if score @s roulette_timer matches 195 run effect give @s darkness 1 0 true

# Building anticipation sound
execute if score @s roulette_timer matches 195 run playsound minecraft:block.beacon.ambient master @s ~ ~ ~ 1 0.5

# ============================================
# CRYSTAL NAME DISPLAY (All Phases)
# ============================================
execute if score #anim crystal_roll matches 0 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Ruby","color":"red","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 1 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Amber","color":"gold","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 2 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Amethyst","color":"light_purple","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 3 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Diamond","color":"aqua","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 4 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Echo","color":"dark_aqua","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 5 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Emerald","color":"green","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 6 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Lapis","color":"blue","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 7 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Prismarine","color":"dark_green","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 8 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Quartz","color":"white","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 9 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Netherite","color":"dark_gray","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
execute if score #anim crystal_roll matches 10 run title @s subtitle [{"text":"[ ","color":"dark_gray"},{"text":"Redstone","color":"dark_red","italic":true,"bold":true},{"text":" ]","color":"dark_gray"}]
