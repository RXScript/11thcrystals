# ============================================
# ENHANCED CRYSTAL AWAKENING SYSTEM - START
# ============================================

execute if entity @s[tag=has_crystal] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute if entity @s[tag=has_crystal] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute if entity @s[tag=has_crystal] run return fail

# Only start if they don't have a crystal already
execute if entity @s[tag=!has_crystal] run scoreboard players set @s roulette_timer 0
execute if entity @s[tag=!has_crystal] run tag @s add rolling_crystal

# Initialize boss bar for visual countdown
execute if entity @s[tag=!has_crystal] run bossbar add crystal_awakening {"text":"✦ CRYSTAL AWAKENING ✦","color":"dark_purple","bold":true}
execute if entity @s[tag=!has_crystal] run bossbar set crystal_awakening players @s
execute if entity @s[tag=!has_crystal] run bossbar set crystal_awakening color purple
execute if entity @s[tag=!has_crystal] run bossbar set crystal_awakening max 200
execute if entity @s[tag=!has_crystal] run bossbar set crystal_awakening value 0
execute if entity @s[tag=!has_crystal] run bossbar set crystal_awakening visible true

# PHASE 1: AWAKENING - Dark, mysterious opening
execute if entity @s[tag=!has_crystal] run title @s title {"text":"✦ AWAKENING ✦","color":"dark_purple","bold":true}
execute if entity @s[tag=!has_crystal] run title @s subtitle {"text":"Your destiny awaits...","color":"gray","italic":true}

# Epic startup audio - layered for depth
execute if entity @s[tag=!has_crystal] run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 0.6
execute if entity @s[tag=!has_crystal] run playsound minecraft:block.respawn_anchor.ambient master @s ~ ~ ~ 1 0.8
execute if entity @s[tag=!has_crystal] run playsound minecraft:block.portal.travel master @s ~ ~ ~ 0.5 0.5

# Dramatic opening particles - portal energy gathering
execute if entity @s[tag=!has_crystal] run particle minecraft:portal ~ ~1 ~ 1 1 1 0.5 100 force @s
execute if entity @s[tag=!has_crystal] run particle minecraft:reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.1 30 force @s
execute if entity @s[tag=!has_crystal] run particle minecraft:soul_fire_flame ~ ~1 ~ 0.3 0.3 0.3 0.02 20 force @s

# Screen flash effect (darkness + quick clear)
execute if entity @s[tag=!has_crystal] run effect give @s darkness 1 0 true

execute if entity @s[tag=!has_crystal] run attribute @s minecraft:fall_damage_multiplier base set -10