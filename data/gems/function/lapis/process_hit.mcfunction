# ==========================================
# PROCESS HIT ON MARKED TARGET
# ==========================================

# If this target was already hit, FAIL CASCADE
execute if score @s cascade_hit_by_player matches 1.. as @a[tag=cascade_active,limit=1,sort=nearest] run function gems:lapis/break_cascade
execute if score @s cascade_hit_by_player matches 1.. run return fail

# FIRST HIT ON THIS TARGET - Valid!
scoreboard players set @s cascade_hit_by_player 1
execute as @a[tag=cascade_active,limit=1,sort=nearest] run scoreboard players add @s cascade_targets_hit 1

# MASSIVE visual feedback
particle enchant ~ ~1 ~ 1 1 1 1 100 force
particle portal ~ ~1 ~ 0.8 0.8 0.8 0.8 80 force
particle block{block_state:{Name:"minecraft:lapis_block"}} ~ ~1 ~ 0.6 0.6 0.6 0.6 60 force
particle dragon_breath ~ ~1 ~ 0.5 0.5 0.5 0.3 40 force
particle glow ~ ~1 ~ 0.4 0.4 0.4 0.2 30 force

# Sound - Magical chime
execute at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1.5
execute at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1.5 2
execute at @s run playsound block.amethyst_block.chime master @a ~ ~ ~ 1 2

# Feedback to player
execute as @a[tag=cascade_active,limit=1,sort=nearest] run title @s actionbar [{"text":"✓ CASCADE: ","color":"blue","bold":true},{"score":{"name":"@s","objective":"cascade_targets_hit"},"color":"yellow"},{"text":"/5","color":"gray"}]