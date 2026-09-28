# 1. Check Mainhand for all 11 crystals
execute if items entity @s weapon.mainhand *[custom_data~{gem:"diamond"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"emerald"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"amethyst"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"lapis"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"ruby"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"amber"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"quartz"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"prismarine"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"echo_shard"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"netherite"}] run tag @s add valid_crystal
execute if items entity @s weapon.mainhand *[custom_data~{gem:"redstone"}] run tag @s add valid_crystal

# 2. Check Offhand for all 11 crystals
execute if items entity @s weapon.offhand *[custom_data~{gem:"diamond"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"emerald"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"amethyst"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"lapis"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"ruby"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"amber"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"quartz"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"prismarine"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"echo_shard"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"netherite"}] run tag @s add valid_crystal
execute if items entity @s weapon.offhand *[custom_data~{gem:"redstone"}] run tag @s add valid_crystal

# 3. Reward the player if they had a crystal equipped
execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] run scoreboard players add @s mastery 10
execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] run title @s actionbar {"text":"Player Killed! +10 Mastery","color":"red","bold":true}
execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] run tellraw @s {"text":"Player Killed! +10 Mastery","color":"red","bold":true}
#execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] at @s run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.2
# Play these all at once for the effect
execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] at @s run playsound minecraft:entity.turtle.egg_crack player @s ~ ~ ~ 1 0.5
execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] at @s run playsound minecraft:block.mud.break player @s ~ ~ ~ 1 0.5
execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] at @s run playsound minecraft:entity.player.attack.crit player @s ~ ~ ~ 1 0.5

execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] at @s run playsound minecraft:item.honey_bottle.drink player @s ~ ~ ~ 1 0.1
execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] at @s run playsound minecraft:block.tuff.break player @s ~ ~ ~ 1 0.7
execute if entity @s[tag=valid_crystal,scores={player_kills=1..}] at @s run playsound minecraft:entity.zombie_villager.converted player @s ~ ~ ~ 1 0.5

# Boss Kill Bonuses - Award 5 Mastery for defeating major bosses
execute if entity @s[tag=valid_crystal,scores={wither_kills=1..}] run scoreboard players add @s mastery 5
execute if entity @s[tag=valid_crystal,scores={wither_kills=1..}] run title @s actionbar {"text":"Boss Slain! +5 Mastery","color":"dark_purple","bold":true}
execute if entity @s[tag=valid_crystal,scores={wither_kills=1..}] run tellraw @s {"text":"Boss Slain! +5 Mastery","color":"dark_purple","bold":true}
execute if entity @s[tag=valid_crystal,scores={wither_kills=1..}] at @s run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1 1

execute if entity @s[tag=valid_crystal,scores={warden_kills=1..}] run scoreboard players add @s mastery 5
execute if entity @s[tag=valid_crystal,scores={warden_kills=1..}] run title @s actionbar {"text":"Boss Slain! +5 Mastery","color":"dark_purple","bold":true}
execute if entity @s[tag=valid_crystal,scores={warden_kills=1..}] run tellraw @s {"text":"Boss Slain! +5 Mastery","color":"dark_purple","bold":true}
execute if entity @s[tag=valid_crystal,scores={warden_kills=1..}] at @s run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1 1

execute if entity @s[tag=valid_crystal,scores={dragon_kills=1..}] run scoreboard players add @s mastery 5
execute if entity @s[tag=valid_crystal,scores={dragon_kills=1..}] run title @s actionbar {"text":"Boss Slain! +5 Mastery","color":"dark_purple","bold":true}
execute if entity @s[tag=valid_crystal,scores={dragon_kills=1..}] run tellraw @s {"text":"Boss Slain! +5 Mastery","color":"dark_purple","bold":true}
execute if entity @s[tag=valid_crystal,scores={dragon_kills=1..}] at @s run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1 1

# 4. Clean up the tags and reset the kill tracker so it doesn't loop
tag @s remove valid_crystal
scoreboard players set @s player_kills 0
scoreboard players set @s wither_kills 0
scoreboard players set @s warden_kills 0
scoreboard players set @s dragon_kills 0