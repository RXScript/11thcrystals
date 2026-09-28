# ==========================================
# VOID ECHOES ACTIVE
# ==========================================

# Dark void particles around player
particle soul ~ ~1 ~ 2 2 2 0.3 15 force
particle sculk_charge{roll:3.0} ~ ~1 ~ 1.5 1.5 1.5 0 10 force
particle dust{color:[0.3,0.0,0.5],scale:2} ~ ~1 ~ 1.5 1.5 1.5 0.3 8 force

# Void circle at feet
particle soul ~ ~0.1 ~ 2.5 0.1 2.5 0 20 force
particle dust{color:[0.3,0.0,0.5],scale:3} ~ ~0.1 ~ 2 0.1 2 0 15 force

# Display resonance status (resonance builds over time)
execute if score @s resonance_level matches ..39 run title @s actionbar [{"text":"⬥ RESONANCE: ","color":"red","bold":true},{"score":{"name":"@s","objective":"resonance_level"},"color":"yellow"},{"text":"% | TOO EARLY!","color":"dark_red"}]
execute if score @s resonance_level matches 40..79 run title @s actionbar [{"text":"⬥ RESONANCE: ","color":"yellow","bold":true},{"score":{"name":"@s","objective":"resonance_level"},"color":"yellow"},{"text":"% | BUILDING...","color":"gold"}]
execute if score @s resonance_level matches 80.. run title @s actionbar [{"text":"⬥ PEAK RESONANCE: ","color":"dark_purple","bold":true},{"score":{"name":"@s","objective":"resonance_level"},"color":"gold","bold":true},{"text":"% | COLLAPSE!","color":"light_purple"}]

# Sound warnings
execute if score @s resonance_level matches 40 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 1 1
execute if score @s resonance_level matches 60 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 1.5 1.2
execute if score @s resonance_level matches 80 run playsound block.sculk_sensor.clicking master @s ~ ~ ~ 2 1.5
execute if score @s resonance_level matches 80 run playsound entity.warden.heartbeat master @s ~ ~ ~ 2 2