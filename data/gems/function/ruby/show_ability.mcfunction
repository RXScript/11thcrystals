# Show ability 1
execute if score @s ruby_ability matches 1 run title @s actionbar [{"text":"🔥 ","color":"dark_red"},{"text":"[1] ","color":"yellow","bold":true},{"text":"⬥ EMBER FLICKER ","color":"white"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]

# Show ability 2
execute if score @s[scores={mastery=..49}] ruby_ability matches 2 run title @s actionbar [{"text":"🔥 ","color":"dark_red"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"red","bold":true},{"text":"50 MASTERY NEEDED  ","color":"dark_red"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 3
execute if score @s[scores={mastery=..149}] ruby_ability matches 3 run title @s actionbar [{"text":"🔥 ","color":"dark_red"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"red","bold":true},{"text":"150 MASTERY NEEDED  ","color":"dark_red"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 4
execute if score @s[scores={mastery=..299}] ruby_ability matches 4 run title @s actionbar [{"text":"🔥 ","color":"dark_red"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"red","bold":true},{"text":"300 MASTERY NEEDED  ","color":"dark_red","bold":true},{"text":"[5] ","color":"dark_gray"}]
# Show ability 5 (ULTIMATE)
execute if score @s[scores={mastery=..499}] ruby_ability matches 5 run title @s actionbar [{"text":"🔥 ","color":"dark_red"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"red","bold":true},{"text":"500 MASTERY NEEDED  ","color":"dark_red","bold":true}]

# Show ability 2
execute if score @s[scores={mastery=50..}] ruby_ability matches 2 run title @s actionbar [{"text":"🔥 ","color":"dark_red"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"yellow","bold":true},{"text":"⬥ EMBER HEART ","color":"white"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 3
execute if score @s[scores={mastery=150..}] ruby_ability matches 3 run title @s actionbar [{"text":"🔥 ","color":"dark_red"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"yellow","bold":true},{"text":"⬥ CHAIN IGNITION ","color":"white"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 4
execute if score @s[scores={mastery=300..}] ruby_ability matches 4 run title @s actionbar [{"text":"🔥 ","color":"dark_red"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"yellow","bold":true},{"text":"⬥ IMMOLATION PACT ","color":"red","bold":true},{"text":"[5] ","color":"dark_gray"}]
# Show ability 5 (ULTIMATE)
execute if score @s[scores={mastery=500..}] ruby_ability matches 5 run title @s actionbar [{"text":"🔥 ","color":"dark_red"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"gold","bold":true},{"text":"⬥ PHOENIX PROTOCOL ","color":"#FF4500","bold":true}]