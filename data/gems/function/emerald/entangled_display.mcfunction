# 1. Tag the entity so we know they are currently entangled
tag @s add is_entangled

# 3. Summon the woody entanglement (Mangrove Roots)
# We translate it by -0.6 on X and Z so it centers on the entity, and scale it up to 1.2x width and 2.2x height.
summon block_display ~ ~ ~ {Tags:["entangle_visual"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.2f,2.2f,1.2f],translation:[-0.6f,0f,-0.6f]},block_state:{Name:"minecraft:mangrove_roots"}}

# 4. Summon the leafy greenery (Azalea Leaves)
# Scaled slightly wider but shorter to sit around the torso/base.
summon block_display ~ ~ ~ {Tags:["entangle_visual"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1.3f,1.8f,1.3f],translation:[-0.65f,0.2f,-0.65f]},block_state:{Name:"minecraft:azalea_leaves"}}

tag @e[tag=entangle_visual] add harvest_immune
tag @e[tag=entangle_visual] remove life_source