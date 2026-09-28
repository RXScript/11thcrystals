# Summon a block display (stylized as blue glass to avoid water transparency glitches)
# The scale makes it 4 blocks wide and 3 blocks tall so the ring overlaps seamlessly.
execute at @s run summon block_display ~ ~ ~ {Tags:["tsunami_wave","new_wave"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[2f,3.0f,2f],translation:[-2.0f,-1.0f,-0.5f]},block_state:{Name:"minecraft:blue_ice"}}

# Apply the marker's exact rotation to the newly spawned block display
execute at @s rotated as @s as @e[type=block_display,tag=new_wave] run tp @s ~ ~ ~ ~ ~

# Initialize its age to 0 and remove the temporary setup tag
scoreboard players set @e[type=block_display,tag=new_wave] wave_age 0
tag @e[type=block_display,tag=new_wave] remove new_wave

# Rotate the spawner marker by 20 degrees for the next block
execute as @s at @s run tp @s ~ ~ ~ ~20 ~

# Add 1 to the loop counter
scoreboard players add #wave_count wave_age 1

# If we haven't reached 18 blocks yet, loop this function again
execute if score #wave_count wave_age matches ..17 as @s at @s run function gems:prismarine/tsunami_display_loop