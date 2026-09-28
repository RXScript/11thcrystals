# ==========================================
# VOLTAGE CHARGING - BUILDING ENERGY
# ==========================================

# Charging particles (building up)
particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 1 1 1 0.3 15 force
particle dust{color:[1.0,0.5,0.0],scale:2} ~ ~1 ~ 0.8 0.8 0.8 0.3 12 force
particle dust{color:[1.0,1.0,0.0],scale:2} ~ ~0.5 ~ 0.6 0.6 0.6 0.2 10 force
particle electric_spark ~ ~1 ~ 1 1 1 0.2 10 force
particle flame ~ ~1 ~ 0.8 0.8 0.8 0.1 8 force

# Energy concentrating
particle dust{color:[1.0,0.3,0.0],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0 8 force

# Charging sound
execute if score @s voltage_charge_timer matches 15 run playsound block.redstone_torch.burnout master @s ~ ~ ~ 1 2
execute if score @s voltage_charge_timer matches 10 run playsound block.redstone_torch.burnout master @s ~ ~ ~ 1.2 2
execute if score @s voltage_charge_timer matches 5 run playsound block.redstone_torch.burnout master @s ~ ~ ~ 1.5 2

# Display status
title @s actionbar [{"text":"⚡ CHARGING: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"voltage_charge_timer"},"color":"red"},{"text":" ticks","color":"gray"}]