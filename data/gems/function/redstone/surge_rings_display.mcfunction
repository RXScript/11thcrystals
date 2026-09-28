# Mark the player as having the active ability
tag @s add surge_active

# Play a heavy activation sound
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 1.5

# ==========================================
# RING 1: Inner Ring (Radius 1.5, Height 1.0)
# ==========================================
execute at @s run summon block_display ~ ~1 ~ {Tags:["surge_node","surge_ring_inner"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.25f,0.25f,0.25f],translation:[1.5f,0.0f,0.0f]},Rotation:[0f,0f],block_state:{Name:"minecraft:redstone_block"}}
execute at @s run summon block_display ~ ~1 ~ {Tags:["surge_node","surge_ring_inner"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.25f,0.25f,0.25f],translation:[1.5f,0.0f,0.0f]},Rotation:[90f,0f],block_state:{Name:"minecraft:redstone_block"}}
execute at @s run summon block_display ~ ~1 ~ {Tags:["surge_node","surge_ring_inner"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.25f,0.25f,0.25f],translation:[1.5f,0.0f,0.0f]},Rotation:[180f,0f],block_state:{Name:"minecraft:redstone_block"}}
execute at @s run summon block_display ~ ~1 ~ {Tags:["surge_node","surge_ring_inner"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.25f,0.25f,0.25f],translation:[1.5f,0.0f,0.0f]},Rotation:[270f,0f],block_state:{Name:"minecraft:redstone_block"}}

# ==========================================
# RING 2: Outer Ring (Radius 2.0, Height 1.3)
# ==========================================
execute at @s run summon block_display ~ ~1.3 ~ {Tags:["surge_node","surge_ring_outer"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.15f,0.15f,0.15f],translation:[2.0f,0.0f,0.0f]},Rotation:[45f,0f],block_state:{Name:"minecraft:redstone_block"}}
execute at @s run summon block_display ~ ~1.3 ~ {Tags:["surge_node","surge_ring_outer"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.15f,0.15f,0.15f],translation:[2.0f,0.0f,0.0f]},Rotation:[135f,0f],block_state:{Name:"minecraft:redstone_block"}}
execute at @s run summon block_display ~ ~1.3 ~ {Tags:["surge_node","surge_ring_outer"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.15f,0.15f,0.15f],translation:[2.0f,0.0f,0.0f]},Rotation:[225f,0f],block_state:{Name:"minecraft:redstone_block"}}
execute at @s run summon block_display ~ ~1.3 ~ {Tags:["surge_node","surge_ring_outer"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.15f,0.15f,0.15f],translation:[2.0f,0.0f,0.0f]},Rotation:[315f,0f],block_state:{Name:"minecraft:redstone_block"}}

tag @e[tag=surge_node] remove circuit_target
tag @e[tag=surge_node] add redstone_immune