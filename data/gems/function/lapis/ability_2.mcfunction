execute unless entity @s[tag=has_lapis] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_lapis] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_lapis] run return fail

# ==========================================
# LAPIS TACTICAL: "ARCANE RUSH"
# 30 Second Cooldown - 50 Mastery Points
# Tactical dash - Rush forward 7 blocks
# Damage enemies passed through + arcane trail
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ RUSH READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ ARCANE RUSH ⬥","color":"blue","bold":true}]
title @s subtitle [{"text":"Flowing like the tide","color":"dark_blue","italic":true}]

# 4. ACTIVATION VISUALS
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 15 force
execute at @s run particle dust{color:[0.0,0.0,1.0],scale:3} ~ ~1 ~ 2 2 2 1 300 force
execute at @s run particle enchant ~ ~1 ~ 1.5 1.5 1.5 2 400 force
execute at @s run particle block{block_state:"minecraft:lapis_block"} ~ ~1 ~ 1 1 1 1 200 force

# 5. SOUND SEQUENCE
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 2 2
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 2
execute at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 2 2

# 6. TAG SYSTEM
tag @s add arcane_rushing
tag @s add lapis2_immune

# 7. STORE INITIAL POSITION
execute store result score @s rush_start_x run data get entity @s Pos[0] 100
execute store result score @s rush_start_y run data get entity @s Pos[1] 100
execute store result score @s rush_start_z run data get entity @s Pos[2] 100

# 8. DASH FORWARD (7 blocks)
tp @s ^ ^ ^7

# 9. DAMAGE ENEMIES IN PATH
execute at @s run function gems:lapis/rush_damage_path

# 10. APPLY SPEED BUFF (3 seconds)
effect give @s speed 3 1 true

# 11. PLACE ARCANE TRAIL MARKERS
scoreboard players set @s rush_trail_timer 60
function gems:lapis/spawn_trail_markers

# 12. SET COOLDOWN
scoreboard players set @s cd_30s 600

# 13. Cleanup immediate tags
tag @s remove arcane_rushing
scoreboard players reset @s rush_start_x
scoreboard players reset @s rush_start_y
scoreboard players reset @s rush_start_z