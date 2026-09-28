# 1. Header (Always shows)
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]
tellraw @s [{"text":"      ⬥ MASTERY PROGRESS ⬥","color":"yellow","bold":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]

# 2. Dynamic Gem Name Display
# This checks the "gem" string in your custom_data and prints the appropriate title
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"diamond"}] run tellraw @s [{"text":"  💎 Diamond: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"emerald"}] run tellraw @s [{"text":"  ⇄ Emerald: ","color":"green","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amethyst"}] run tellraw @s [{"text":"  ♫ Amethyst: ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"lapis"}] run tellraw @s [{"text":"  🧪 Lapis: ","color":"blue","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"ruby"}] run tellraw @s [{"text":"  🔥 Ruby: ","color":"dark_red","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amber"}] run tellraw @s [{"text":"  ⚓ Amber: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"quartz"}] run tellraw @s [{"text":"  ⏳ Quartz: ","color":"white","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"prismarine"}] run tellraw @s [{"text":"  🌊 Prismarine: ","color":"dark_aqua","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"echo_shard"}] run tellraw @s [{"text":"  ☽ Echo Shard: ","color":"#07075f","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"netherite"}] run tellraw @s [{"text":"  ☄ Netherite: ","color":"#606061","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"redstone"}] run tellraw @s [{"text":"  ⚡ Redstone: ","color":"red","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]

execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"diamond"}] run tellraw @s [{"text":"  💎 Diamond: ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"emerald"}] run tellraw @s [{"text":"  ⇄ Emerald: ","color":"green","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"amethyst"}] run tellraw @s [{"text":"  ♫ Amethyst: ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"lapis"}] run tellraw @s [{"text":"  🧪 Lapis: ","color":"blue","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"ruby"}] run tellraw @s [{"text":"  🔥 Ruby: ","color":"dark_red","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"amber"}] run tellraw @s [{"text":"  ⚓ Amber: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"quartz"}] run tellraw @s [{"text":"  ⏳ Quartz: ","color":"white","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"prismarine"}] run tellraw @s [{"text":"  🌊 Prismarine: ","color":"dark_aqua","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"echo_shard"}] run tellraw @s [{"text":"  ☽ Echo Shard: ","color":"#07075f","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"netherite"}] run tellraw @s [{"text":"  ☄ Netherite: ","color":"#606061","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]
execute if items entity @s weapon.offhand carrot_on_a_stick[custom_data~{gem:"redstone"}] run tellraw @s [{"text":"  ⚡ Redstone: ","color":"red","bold":true},{"score":{"name":"@s","objective":"mastery"},"color":"yellow"},{"text":"/500","color":"gray"}]

# 3. Universal Ability Progress
# Since they all use the 'mastery' scoreboard, we only need to check the score once per ability level
tellraw @s [{"text":"  Ability 1: ","color":"gray"},{"text":"✓ Unlocked","color":"green"}]

execute if score @s mastery matches 50.. run tellraw @s [{"text":"  Ability 2: ","color":"gray"},{"text":"✓ Unlocked","color":"green"}]
execute if score @s mastery matches ..49 run tellraw @s [{"text":"  Ability 2: ","color":"gray"},{"text":"🔒 Locked (50 pts)","color":"red"}]

execute if score @s mastery matches 150.. run tellraw @s [{"text":"  Ability 3: ","color":"gray"},{"text":"✓ Unlocked","color":"green"}]
execute if score @s mastery matches ..149 run tellraw @s [{"text":"  Ability 3: ","color":"gray"},{"text":"🔒 Locked (150 pts)","color":"red"}]

execute if score @s mastery matches 300.. run tellraw @s [{"text":"  Ability 4: ","color":"gray"},{"text":"✓ Unlocked","color":"green"}]
execute if score @s mastery matches ..299 run tellraw @s [{"text":"  Ability 4: ","color":"gray"},{"text":"🔒 Locked (300 pts)","color":"red"}]

execute if score @s mastery matches 500.. run tellraw @s [{"text":"  Ability 5: ","color":"gray"},{"text":"✓ ULTIMATE UNLOCKED","color":"gold","bold":true}]
execute if score @s mastery matches ..499 run tellraw @s [{"text":"  Ability 5: ","color":"gray"},{"text":"🔒 Ultimate Locked (500 pts)","color":"dark_red","bold":true}]

# 4. Footer
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}]