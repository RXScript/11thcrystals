# Final dramatic effects when puddle disappears
# Lightning strike, particle explosion, and chat announcement

# Lightning strike at the puddle location
summon lightning_bolt ~ ~ ~

# Massive particle explosion
particle minecraft:portal ~ ~0.5 ~ 1.5 0.5 1.5 2 200 force
particle minecraft:soul ~ ~0.5 ~ 1 0.5 1 0.2 100 force
particle minecraft:smoke ~ ~0.5 ~ 1 0.5 1 0.2 80 force
particle minecraft:large_smoke ~ ~0.5 ~ 1 0.5 1 0.1 40 force
particle minecraft:squid_ink ~ ~0.5 ~ 1 0.3 1 0.3 50 force
particle minecraft:explosion ~ ~0.5 ~ 0 0 0 1 5 force
particle minecraft:falling_obsidian_tear ~ ~0.5 ~ 1 0.5 1 0.5 60 force

# Dust effects (dark purple/black)
particle minecraft:dust{color:[0.2f,0.0f,0.3f],scale:2.0f} ~ ~0.5 ~ 1.5 0.5 1.5 0 100 force
particle minecraft:dust{color:[0.1f,0.0f,0.2f],scale:1.5f} ~ ~0.5 ~ 1 0.5 1 0 80 force

# Sound effects
playsound minecraft:entity.lightning_bolt.thunder ambient @a ~ ~ ~ 2 1
playsound minecraft:entity.warden.sonic_boom ambient @a ~ ~ ~ 1 0.5
playsound minecraft:block.respawn_anchor.deplete ambient @a ~ ~ ~ 1 0.5
playsound minecraft:entity.ender_dragon.growl ambient @a ~ ~ ~ 1 0.7

execute at @a run schedule function gems:void_banish/message 4s

# Remove all puddle block displays
kill @e[type=block_display,tag=void_puddle]

# Remove this marker
kill @s