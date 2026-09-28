# Show trap location particles
$particle falling_honey $(temp_x) $(temp_y) $(temp_z) 2.5 0.1 2.5 0 20 force
$particle block{block_state:{Name:"minecraft:honey_block"}} $(temp_x) $(temp_y) $(temp_z) 2 0.1 2 0 15 force
$particle dust{color:[1.0,0.7,0.0],scale:2} $(temp_x) $(temp_y) $(temp_z) 2.5 0.1 2.5 0 10 force