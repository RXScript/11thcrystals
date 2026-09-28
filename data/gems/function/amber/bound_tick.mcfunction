# ==========================================
# TARGET BOUND IN RESIN - PRESERVED
# ==========================================

# Thick resin coating particles
particle block{block_state:"minecraft:honey_block"} ~ ~1 ~ 0.8 1 0.8 0.5 20 force
particle item{item:"minecraft:honey_bottle"} ~ ~1 ~ 0.7 0.9 0.7 0.3 15 force
particle dust{color:[1.0,0.7,0.0],scale:3} ~ ~1 ~ 0.8 1 0.8 0.5 20 force

# Dripping resin
particle dripping_honey ~ ~2 ~ 0.6 0.2 0.6 0 10 force
particle falling_honey ~ ~1.5 ~ 0.5 0.3 0.5 0 8 force
particle dripping_honey ~ ~1 ~ 0.4 0.5 0.4 0 6 force

# Amber glow (preserved in time)
particle dust{color:[1.0,0.5,0.0],scale:2} ~ ~1 ~ 0.5 0.8 0.5 0 10 force
particle glow ~ ~1 ~ 0.4 0.6 0.4 0.1 5 force

# Sticky particles at feet (rooted)
particle block{block_state:"minecraft:honey_block"} ~ ~0.1 ~ 0.8 0.1 0.8 0 15 force
particle item{item:"minecraft:honey_bottle"} ~ ~0.3 ~ 0.6 0.1 0.6 0 8 force

# Trapped sound
execute if score @s resin_duration matches 50 run playsound block.honey_block.slide master @a ~ ~ ~ 1 0.5
execute if score @s resin_duration matches 40 run playsound block.honey_block.slide master @a ~ ~ ~ 1 0.5
execute if score @s resin_duration matches 30 run playsound block.honey_block.slide master @a ~ ~ ~ 1 0.5
execute if score @s resin_duration matches 20 run playsound block.honey_block.slide master @a ~ ~ ~ 1.5 0.5
execute if score @s resin_duration matches 10 run playsound block.honey_block.slide master @a ~ ~ ~ 2 0.5