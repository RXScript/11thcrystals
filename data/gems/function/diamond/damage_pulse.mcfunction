# CONTINUOUS DAMAGE - Hurt players near the mountain
particle explosion ~ ~1 ~ 4 1 4 0 20 force
particle sweep_attack ~ ~1 ~ 4 0.1 4 0.3 30 force

# Damage other players (not self)
execute as @a[distance=0.1..10,tag=mountain_enemy] run damage @s 6 player_attack by @p[tag=mountain_user]

# Visual feedback for damaged players
execute as @a[distance=0.1..10,tag=mountain_enemy] at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 0.5 0.5 0.5 0.2 20 force

# Sound
execute at @s run playsound entity.player.hurt master @a ~ ~ ~ 1 0.8
execute at @s run playsound block.anvil.land master @a ~ ~ ~ 0.8 1.5