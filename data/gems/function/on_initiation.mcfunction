execute if entity @s[tag=initiated] run return fail

# Line 1: The Welcome
tellraw @s ["",{"text":"Welcome to the server, ","color":"green"},{"selector":"@s","color":"yellow","bold":true},{"text":"!","color":"yellow","bold":true}]

# Line 2: The Item Mention
tellraw @s {"text":"You will be given a permanent crystal.","color":"gray"}

# Line 3: The Ominous Good Luck
tellraw @s {"text":"Good luck...","color":"dark_red","italic":true}

tellraw @s {"text":""}

execute as @s run function gems:roll/start
tellraw @s {text:"Crystal Codex can be found here...",bold:true,color:"aqua",click_event:{action:"open_url",url:"https://rxscripts.neocities.org/Other/Minecraft/The%2011th%20Crystals/"}}

tag @s add initiated