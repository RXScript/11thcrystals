# Spawn a wave of gravity display blocks around the player

# Spawn 4-8 displays at random angles and heights
summon block_display ~ ~ ~ {Tags:["gravity_display_block","gravity_display_new"],block_state:{Name:"minecraft:netherite_block"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.3f,2.5f,0.3f]},interpolation_duration:2,teleport_duration:1}
summon block_display ~ ~ ~ {Tags:["gravity_display_block","gravity_display_new"],block_state:{Name:"minecraft:netherite_block"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.3f,2.5f,0.3f]},interpolation_duration:2,teleport_duration:1}
summon block_display ~ ~ ~ {Tags:["gravity_display_block","gravity_display_new"],block_state:{Name:"minecraft:netherite_block"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.3f,2.5f,0.3f]},interpolation_duration:2,teleport_duration:1}

# Initialize the new displays
execute as @e[type=block_display,tag=gravity_display_new] run function gems:netherite/gravity_display_init
