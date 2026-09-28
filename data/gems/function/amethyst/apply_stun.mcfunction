# ==========================================
# APPLY STUN TO ENEMY
# ==========================================

# STUN EFFECTS (3 seconds)
effect give @s slowness 3 4 true
effect give @s jump_boost 3 250 true
effect give @s weakness 3 2 true
effect give @s glowing 3 0 true
effect give @s darkness 3 0 true

# STUN VISUALS
particle dust{color:[0.5,0.0,1.0],scale:3} ~ ~1 ~ 0.8 0.8 0.8 0.5 60 force
particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0.2 40 force
particle sonic_boom ~ ~1 ~ 0 0 0 0 2 force
particle block{block_state:"minecraft:amethyst_block"} ~ ~1 ~ 1 1 1 0.5 40 force

# Resonant particles above head (stunned indicator)
particle dust{color:[0.3,0.0,0.6],scale:2} ~ ~2.5 ~ 0.3 0.3 0.3 0 20 force
particle end_rod ~ ~2.3 ~ 0.2 0.2 0.2 0 10 force

# STUN SOUND
execute at @s run playsound block.amethyst_block.break master @a ~ ~ ~ 2 2
execute at @s run playsound entity.warden.sonic_charge master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.bell.resonate master @a ~ ~ ~ 2 1