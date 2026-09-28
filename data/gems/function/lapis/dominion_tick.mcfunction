# ==========================================
# THE ARCANE DOMINION REIGNS
# ==========================================

# MASSIVE celestial/arcane aura
particle enchant ~ ~1 ~ 6 7 6 2 200 force
particle witch ~ ~1 ~ 5 6 5 1.5 150 force
particle soul ~ ~1 ~ 5 6 5 1 100 force
particle glow ~ ~1 ~ 4 5 4 0.5 80 force
particle end_rod ~ ~1 ~ 4 5 4 0.2 60 force
particle reverse_portal ~ ~1 ~ 4 5 4 1 100 force
particle dragon_breath ~ ~1 ~ 3 4 3 0.5 60 force

# Floating arcane runes
particle enchant ~ ~0.1 ~ 7 0.1 7 0.5 80 force
particle witch ~ ~0.1 ~ 6 0.1 6 0.3 60 force

# Vertical beam every 5 seconds (stars falling)
execute if score @s dominion_timer matches 1190 run particle enchant ~ ~1 ~ 0.5 70 0.5 0 800 force
execute if score @s dominion_timer matches 1190 run particle soul ~ ~1 ~ 0.5 70 0.5 0 600 force
execute if score @s dominion_timer matches 1190 run playsound block.enchantment_table.use master @a ~ ~ ~ 2 2

# Orbital arcane symbols (rotating magic circles)
execute rotated ~ 0 run particle enchant ^15 ^3 ^0 0.3 3 0.3 1 25 force
execute rotated ~45 0 run particle witch ^15 ^3 ^0 0.3 3 0.3 0.8 20 force
execute rotated ~90 0 run particle soul ^15 ^3 ^0 0.3 3 0.3 0.5 15 force
execute rotated ~135 0 run particle enchant ^15 ^3 ^0 0.3 3 0.3 1 25 force
execute rotated ~180 0 run particle witch ^15 ^3 ^0 0.3 3 0.3 0.8 20 force
execute rotated ~225 0 run particle soul ^15 ^3 ^0 0.3 3 0.3 0.5 15 force
execute rotated ~270 0 run particle enchant ^15 ^3 ^0 0.3 3 0.3 1 25 force
execute rotated ~315 0 run particle witch ^15 ^3 ^0 0.3 3 0.3 0.8 20 force

# MAINTAIN MARKS on entities in range
execute at @s as @e[distance=0.1..30,tag=!arcane_immune] unless entity @s[tag=arcane_victim] run tag @s add arcane_victim
execute at @s as @e[distance=0.1..30,tag=arcane_victim] unless score @s arcane_drain matches 0.. run scoreboard players set @s arcane_drain 0

# Arcane energy draining from victims
execute at @s as @e[distance=0.1..30,tag=arcane_victim] at @s run particle enchant ~ ~1 ~ 0.4 0.8 0.4 0.5 10 force
execute at @s as @e[distance=0.1..30,tag=arcane_victim] at @s run particle witch ~ ~1.5 ~ 0.3 0.6 0.3 0.3 8 force
execute at @s as @e[distance=0.1..30,tag=arcane_victim] at @s run particle soul ~ ~1 ~ 0.2 0.5 0.2 0.1 5 force

# ARCANE DRAIN (every 2 seconds - 40 ticks)
execute if score @s dominion_timer matches 1180 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 1140 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 1100 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 1060 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 1020 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 980 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 940 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 900 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 860 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 820 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 780 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 740 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 700 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 660 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 620 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 580 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 540 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 500 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 460 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 420 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 380 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 340 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 300 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 260 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 220 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 180 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 140 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 100 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 60 run function gems:lapis/arcane_drain
execute if score @s dominion_timer matches 20 run function gems:lapis/arcane_drain

# REALITY NULLIFICATION (every 4 seconds - clear buffs)
execute if score @s dominion_timer matches 1176 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 1096 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 1016 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 936 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 856 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 776 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 696 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 616 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 536 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 456 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 376 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 296 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 216 run function gems:lapis/nullify_reality
execute if score @s dominion_timer matches 136 run function gems:lapis/dominify_reality
execute if score @s dominion_timer matches 56 run function gems:lapis/nullify_reality

# MAINTAIN LAWS OF MAGIC (debuffs)
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run effect give @s slowness 3 2 true
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run effect give @s weakness 3 2 true
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run effect give @s mining_fatigue 3 2 true
execute at @s as @e[distance=0.1..30,tag=arcane_victim] run effect give @s unluck 3 2 true

# COUNT KILLS
execute at @s as @e[distance=0.1..30,tag=arcane_victim,nbt={Health:0.0f}] run scoreboard players add @p[tag=arcane_master] dominion_kills 1

# Ambient sound (mystical hum)
execute if score @s dominion_timer matches 1100 run playsound block.enchantment_table.use master @a ~ ~ ~ 1 0.5
execute if score @s dominion_timer matches 600 run playsound entity.illusioner.mirror_move master @a ~ ~ ~ 1.5 0.8