# Spawn the crying obsidian puddle using block displays
# Called from initialize function

# Center piece (full block, slightly lowered)
summon block_display ~ ~0.05 ~ {Tags:["void_puddle","void_puddle_center"],block_state:{Name:"minecraft:crying_obsidian"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.15f,-0.5f],scale:[1f,0.2f,1f]},brightness:{sky:0,block:3}}

# North
summon block_display ~ ~0.05 ~-1 {Tags:["void_puddle"],block_state:{Name:"minecraft:crying_obsidian"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.15f,-0.5f],scale:[1f,0.15f,1f]},brightness:{sky:0,block:3}}

# South
summon block_display ~ ~0.05 ~1 {Tags:["void_puddle"],block_state:{Name:"minecraft:crying_obsidian"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.15f,-0.5f],scale:[1f,0.15f,1f]},brightness:{sky:0,block:3}}

# East
summon block_display ~1 ~0.05 ~ {Tags:["void_puddle"],block_state:{Name:"minecraft:crying_obsidian"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.15f,-0.5f],scale:[1f,0.15f,1f]},brightness:{sky:0,block:3}}

# West
summon block_display ~-1 ~0.05 ~ {Tags:["void_puddle"],block_state:{Name:"minecraft:crying_obsidian"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.15f,-0.5f],scale:[1f,0.15f,1f]},brightness:{sky:0,block:3}}

# Northeast
summon block_display ~1 ~0.05 ~-1 {Tags:["void_puddle"],block_state:{Name:"minecraft:crying_obsidian"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.15f,-0.5f],scale:[1f,0.1f,1f]},brightness:{sky:0,block:2}}

# Northwest
summon block_display ~-1 ~0.05 ~-1 {Tags:["void_puddle"],block_state:{Name:"minecraft:crying_obsidian"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.15f,-0.5f],scale:[1f,0.1f,1f]},brightness:{sky:0,block:2}}

# Southeast
summon block_display ~1 ~0.05 ~1 {Tags:["void_puddle"],block_state:{Name:"minecraft:crying_obsidian"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.15f,-0.5f],scale:[1f,0.1f,1f]},brightness:{sky:0,block:2}}

# Southwest
summon block_display ~-1 ~0.05 ~1 {Tags:["void_puddle"],block_state:{Name:"minecraft:crying_obsidian"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.5f,-0.15f,-0.5f],scale:[1f,0.1f,1f]},brightness:{sky:0,block:2}}

# Initial particle effects
particle minecraft:falling_obsidian_tear ~ ~0.1 ~ 1 0.1 1 0 20 force
particle minecraft:portal ~ ~0.5 ~ 0.5 0.1 0.5 0.5 50 force