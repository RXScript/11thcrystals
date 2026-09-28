# Show ability 1
execute if score @s emerald_ability matches 1 run title @s actionbar [{"text":"⇄ ","color":"green"},{"text":"[1] ","color":"yellow","bold":true},{"text":"⬥ NATURE'S PRICE ","color":"white"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]

# Show ability 2
execute if score @s[scores={mastery=..49}] emerald_ability matches 2 run title @s actionbar [{"text":"⇄ ","color":"green"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"red","bold":true},{"text":"50 MASTERY NEEDED  ","color":"dark_red"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 3
execute if score @s[scores={mastery=..149}] emerald_ability matches 3 run title @s actionbar [{"text":"⇄ ","color":"green"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"red","bold":true},{"text":"150 MASTERY NEEDED  ","color":"dark_red"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 4
execute if score @s[scores={mastery=..299}] emerald_ability matches 4 run title @s actionbar [{"text":"⇄ ","color":"green"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"red","bold":true},{"text":"300 MASTERY NEEDED  ","color":"dark_red","bold":true},{"text":"[5] ","color":"dark_gray"}]
# Show ability 5 (ULTIMATE)
execute if score @s[scores={mastery=..499}] emerald_ability matches 5 run title @s actionbar [{"text":"⇄ ","color":"green"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"red","bold":true},{"text":"500 MASTERY NEEDED  ","color":"dark_red","bold":true}]

# Show ability 2
execute if score @s[scores={mastery=50..}] emerald_ability matches 2 run title @s actionbar [{"text":"⇄ ","color":"green"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"yellow","bold":true},{"text":"⬥ VERDANT GRASP ","color":"white"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 3
execute if score @s[scores={mastery=150..}] emerald_ability matches 3 run title @s actionbar [{"text":"⇄ ","color":"green"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"yellow","bold":true},{"text":"⬥ VITAL EXCHANGE ","color":"white"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"dark_gray"}]
# Show ability 4
execute if score @s[scores={mastery=300..}] emerald_ability matches 4 run title @s actionbar [{"text":"⇄ ","color":"green"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"yellow","bold":true},{"text":"⬥ MERCHANT'S BARGAIN ","color":"green","bold":true},{"text":"[5] ","color":"dark_gray"}]
# Show ability 5 (ULTIMATE)
execute if score @s[scores={mastery=500..}] emerald_ability matches 5 run title @s actionbar [{"text":"⇄ ","color":"green"},{"text":"[1] ","color":"dark_gray"},{"text":"[2] ","color":"dark_gray"},{"text":"[3] ","color":"dark_gray"},{"text":"[4] ","color":"dark_gray"},{"text":"[5] ","color":"gold","bold":true},{"text":"⬥ EMERALD HARVEST ","color":"dark_green","bold":true}]