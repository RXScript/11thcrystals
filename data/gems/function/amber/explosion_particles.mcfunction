# Explosion at trap location
$particle explosion_emitter $(explode_x) $(explode_y) $(explode_z) 8 8 8 0 150 force
$particle flash{color:[1.0,1.0,1.0,1.0]} $(explode_x) $(explode_y) $(explode_z) 0 0 0 0 20 force
$particle falling_honey $(explode_x) $(explode_y) $(explode_z) 0 0 0 8 2000 force
$particle block{block_state:{Name:"minecraft:honey_block"}} $(explode_x) $(explode_y) $(explode_z) 0 0 0 5 1500 force
$particle dust{color:[1.0,0.7,0.0],scale:5} $(explode_x) $(explode_y) $(explode_z) 0 0 0 3 1000 force
$particle glow $(explode_x) $(explode_y) $(explode_z) 8 8 8 2 800 force