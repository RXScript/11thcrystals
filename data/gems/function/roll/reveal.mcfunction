# ============================================
# ENHANCED CRYSTAL AWAKENING - FINAL REVEAL
# ============================================

# Stop rolling
tag @s remove rolling_crystal

# Remove boss bar
bossbar remove crystal_awakening

# Roll actual result
execute store result score @s crystal_roll run random value 1..11

# ============================================
# INITIAL IMPACT (Tick 0)
# ============================================

# Screen flash
effect give @s glowing 2 0 true
effect clear @s darkness

# Impact sounds - layered for depth
playsound minecraft:entity.lightning_bolt.impact master @s ~ ~ ~ 1 1.8
playsound minecraft:block.respawn_anchor.charge master @s ~ ~ ~ 1 1.6
playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 0.4 2.0

# Explosion particle burst
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force @s
particle minecraft:effect ~ ~1 ~ 10 10 10 0 3 force @s
particle minecraft:sonic_boom ~ ~1 ~ 0 0 0 0 1 force @s

# ============================================
# ENERGY RELEASE (Immediate follow-up)
# ============================================

# Rapid successive sounds - creates "rolling" feeling
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 2.0
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1.8
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1.6
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1.4
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1.2
playsound minecraft:block.note_block.hat master @s ~ ~ ~ 1 1.0

# Crit burst
particle minecraft:crit ~ ~1 ~ 1 1 1 0.3 80 force @s
particle minecraft:enchanted_hit ~ ~1 ~ 0.8 0.8 0.8 0.2 50 force @s

# ============================================
# CRYSTALLIZATION MOMENT
# ============================================

# Magical lock-in sounds
playsound minecraft:block.amethyst_block.chime master @s ~ ~ ~ 1.5 0.5
playsound minecraft:block.amethyst_cluster.place master @s ~ ~ ~ 1 0.8
playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 1.2

# Electric crystallization
particle minecraft:electric_spark ~ ~1 ~ 1 1 1 0.4 100 force @s
particle minecraft:glow ~ ~1 ~ 0.7 0.7 0.7 0.1 60 force @s
particle minecraft:scrape ~ ~1 ~ 0.5 0.5 0.5 0.2 40 force @s

# ============================================
# FINAL LOCK-IN
# ============================================

# Ultimate finale sound
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1.5 1.0
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.5
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 1.0

# Radiant end_rod pillar
particle minecraft:end_rod ~ ~1 ~ 1 2 1 0.08 150 force @s
particle minecraft:totem_of_undying ~ ~1 ~ 0.8 0.8 0.8 0.2 80 force @s
particle minecraft:firework ~ ~1 ~ 1 1 1 0.1 50 force @s

# Final screen effect
effect give @s regeneration 2 4 true

# ============================================
# CRYSTAL ASSIGNMENT & DISPLAY
# ============================================

# 1. RUBY
execute if score @s crystal_roll matches 1 run function gems:give/ruby
execute if score @s crystal_roll matches 1 run tag @s add has_ruby
execute if score @s crystal_roll matches 1 run title @s title {"text":"✦ RUBY ✦","color":"dark_red","bold":true}
execute if score @s crystal_roll matches 1 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 1 run playsound minecraft:block.fire.ambient master @s ~ ~ ~ 0.5 0.5
execute if score @s crystal_roll matches 1 run particle minecraft:lava ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 2. AMBER
execute if score @s crystal_roll matches 2 run function gems:give/amber
execute if score @s crystal_roll matches 2 run tag @s add has_amber
execute if score @s crystal_roll matches 2 run title @s title {"text":"✦ AMBER ✦","color":"gold","bold":true}
execute if score @s crystal_roll matches 2 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 2 run playsound minecraft:block.honey_block.slide master @s ~ ~ ~ 0.5 0.5
execute if score @s crystal_roll matches 2 run particle minecraft:falling_honey ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 3. AMETHYST
execute if score @s crystal_roll matches 3 run function gems:give/amethyst
execute if score @s crystal_roll matches 3 run tag @s add has_amethyst
execute if score @s crystal_roll matches 3 run title @s title {"text":"✦ AMETHYST ✦","color":"light_purple","bold":true}
execute if score @s crystal_roll matches 3 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 3 run playsound minecraft:block.amethyst_cluster.break master @s ~ ~ ~ 0.5 0.5
execute if score @s crystal_roll matches 3 run particle minecraft:witch ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 4. DIAMOND
execute if score @s crystal_roll matches 4 run function gems:give/diamond
execute if score @s crystal_roll matches 4 run tag @s add has_diamond
execute if score @s crystal_roll matches 4 run title @s title {"text":"✦ DIAMOND ✦","color":"aqua","bold":true}
execute if score @s crystal_roll matches 4 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 4 run playsound minecraft:block.glass.break master @s ~ ~ ~ 0.5 2.0
execute if score @s crystal_roll matches 4 run particle minecraft:falling_water ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 5. ECHO
execute if score @s crystal_roll matches 5 run function gems:give/echo
execute if score @s crystal_roll matches 5 run tag @s add has_echo
execute if score @s crystal_roll matches 5 run title @s title {"text":"✦ ECHO ✦","color":"#07075f","bold":true}
execute if score @s crystal_roll matches 5 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 5 run playsound minecraft:block.sculk_shrieker.shriek master @s ~ ~ ~ 0.3 0.5
execute if score @s crystal_roll matches 5 run particle minecraft:sculk_soul ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 6. EMERALD
execute if score @s crystal_roll matches 6 run function gems:give/emerald
execute if score @s crystal_roll matches 6 run tag @s add has_emerald
execute if score @s crystal_roll matches 6 run title @s title {"text":"✦ EMERALD ✦","color":"green","bold":true}
execute if score @s crystal_roll matches 6 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 6 run playsound minecraft:block.grass.break master @s ~ ~ ~ 0.5 0.5
execute if score @s crystal_roll matches 6 run particle minecraft:composter ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 7. LAPIS
execute if score @s crystal_roll matches 7 run function gems:give/lapis
execute if score @s crystal_roll matches 7 run tag @s add has_lapis
execute if score @s crystal_roll matches 7 run title @s title {"text":"✦ LAPIS ✦","color":"dark_blue","bold":true}
execute if score @s crystal_roll matches 7 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 7 run playsound minecraft:block.water.ambient master @s ~ ~ ~ 0.5 0.5
execute if score @s crystal_roll matches 7 run particle minecraft:falling_water ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 8. PRISMARINE
execute if score @s crystal_roll matches 8 run function gems:give/prismarine
execute if score @s crystal_roll matches 8 run tag @s add has_prismarine
execute if score @s crystal_roll matches 8 run title @s title {"text":"✦ PRISMARINE ✦","color":"dark_aqua","bold":true}
execute if score @s crystal_roll matches 8 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 8 run playsound minecraft:block.conduit.ambient master @s ~ ~ ~ 0.5 0.5
execute if score @s crystal_roll matches 8 run particle minecraft:bubble ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 9. QUARTZ
execute if score @s crystal_roll matches 9 run function gems:give/quartz
execute if score @s crystal_roll matches 9 run tag @s add has_quartz
execute if score @s crystal_roll matches 9 run title @s title {"text":"✦ QUARTZ ✦","color":"white","bold":true} 
execute if score @s crystal_roll matches 9 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 9 run playsound minecraft:block.glass.place master @s ~ ~ ~ 0.5 2.0
execute if score @s crystal_roll matches 9 run particle minecraft:snowflake ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 10. NETHERITE
execute if score @s crystal_roll matches 10 run function gems:give/netherite
execute if score @s crystal_roll matches 10 run tag @s add has_netherite
execute if score @s crystal_roll matches 10 run title @s title {"text":"✦ NETHERITE ✦","color":"dark_gray","bold":true} 
execute if score @s crystal_roll matches 10 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 10 run playsound minecraft:block.anvil.land master @s ~ ~ ~ 0.5 0.5
execute if score @s crystal_roll matches 10 run particle minecraft:large_smoke ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @s

# 11. REDSTONE
execute if score @s crystal_roll matches 11 run function gems:give/redstone
execute if score @s crystal_roll matches 11 run tag @s add has_redstone
execute if score @s crystal_roll matches 11 run title @s title {"text":"✦ REDSTONE ✦","color":"red","bold":true} 
execute if score @s crystal_roll matches 11 run title @s subtitle {"text":"ETERNALLY BOUND TO YOUR SOUL","color":"gray","bold":true}
execute if score @s crystal_roll matches 11 run playsound minecraft:block.redstone_torch.burnout master @s ~ ~ ~ 0.5 0.5
execute if score @s crystal_roll matches 11 run particle minecraft:dust{color:[1.0,0.0,0.0],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0.1 30 force @s

# ============================================
# FINAL MESSAGE
# ============================================

tellraw @s [{"text":"","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
tellraw @s [{"text":"          ","color":"gray"},{"text":"✦ CRYSTAL BOUND ✦","color":"light_purple","bold":true}]
tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"  Your essence has been permanently fused","color":"gray"}]
tellraw @s [{"text":"  with crystalline energy. This bond cannot","color":"gray"}]
tellraw @s [{"text":"  be broken or changed.","color":"gray"}]
tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]

execute if entity @s[tag=!has_crystal] run attribute @s minecraft:fall_damage_multiplier base set 1

# Lock them out of rolling again
tag @s add has_crystal
