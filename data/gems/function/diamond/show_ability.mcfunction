# Show ability 1
execute if score @s diamond_ability matches 1 run title @s actionbar [{"text":"💎 ","color":"aqua"},{"text":"[1] ","color":"yellow","bold":true},{"text":"⬥ REFRACTIVE SHIELD ","color":"white"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]

# Show ability 2
execute if score @s[scores={mastery=..49}] diamond_ability matches 2 run title @s actionbar [{"text":"💎 ","color":"aqua"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"red","bold":true},{"text":"50 MASTERY NEEDED  ","color":"dark_red"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 3
execute if score @s[scores={mastery=..149}] diamond_ability matches 3 run title @s actionbar [{"text":"💎 ","color":"aqua"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"red","bold":true},{"text":"150 MASTERY NEEDED  ","color":"dark_red"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 4
execute if score @s[scores={mastery=..299}] diamond_ability matches 4 run title @s actionbar [{"text":"💎 ","color":"aqua"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"red","bold":true},{"text":"300 MASTERY NEEDED  ","color":"dark_red","bold":true},{"text":"[5] ","color":"dark_gray"}]
# Show ability 5 (ULTIMATE)
execute if score @s[scores={mastery=..499}] diamond_ability matches 5 run title @s actionbar [{"text":"💎 ","color":"aqua"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"red","bold":true},{"text":"500 MASTERY NEEDED  ","color":"dark_red","bold":true}]

# Show ability 2
execute if score @s[scores={mastery=50..}] diamond_ability matches 2 run title @s actionbar [{"text":"💎 ","color":"aqua"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"yellow","bold":true},{"text":"⬥ STONE SHELL ","color":"white"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 3
execute if score @s[scores={mastery=150..}] diamond_ability matches 3 run title @s actionbar [{"text":"💎 ","color":"aqua"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"yellow","bold":true},{"text":"⬥ UNBREAKABLE WILL ","color":"white"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 4
execute if score @s[scores={mastery=300..}] diamond_ability matches 4 run title @s actionbar [{"text":"💎 ","color":"aqua"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"yellow","bold":true},{"text":"⬥ IMMOVABLE FORTRESS ","color":"aqua","bold":true},{"text":"[5] ","color":"dark_gray"}]
# Show ability 5 (ULTIMATE)
execute if score @s[scores={mastery=500..}] diamond_ability matches 5 run title @s actionbar [{"text":"💎 ","color":"aqua"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"gold","bold":true},{"text":"⬥ IMMOVABLE MOUNTAIN ","color":"aqua","bold":true}]