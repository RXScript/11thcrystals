# ==========================================
# YOU ARE BURNING
# ==========================================

# MASSIVE fire aura
particle flame ~ ~1 ~ 6 7 6 1.5 200 force
particle soul_fire_flame ~ ~1 ~ 5 6 5 1 150 force
particle lava ~ ~1 ~ 4 5 4 0.8 100 force
particle smoke ~ ~1 ~ 5 6 5 0.5 120 force
particle glow ~ ~1 ~ 3 4 3 0.3 60 force

# Ground fire
particle flame ~ ~0.1 ~ 7 0.1 7 0.5 80 force
particle soul_fire_flame ~ ~0.1 ~ 6 0.1 6 0.3 60 force

# Vertical fire pillar every 2 seconds
execute if score @s phoenix_form_timer matches 140 run particle flame ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s phoenix_form_timer matches 140 run particle soul_fire_flame ~ ~1 ~ 0.5 50 0.5 0 800 force
execute if score @s phoenix_form_timer matches 140 run playsound entity.blaze.shoot master @a ~ ~ ~ 2 1.5

execute if score @s phoenix_form_timer matches 80 run particle flame ~ ~1 ~ 0.5 50 0.5 0 1000 force
execute if score @s phoenix_form_timer matches 80 run playsound entity.blaze.shoot master @a ~ ~ ~ 2 1.5

# MAINTAIN MARKS
execute at @s as @e[distance=0.1..20,tag=!phoenix_immune] unless entity @s[tag=immolation_target] run tag @s add immolation_target
execute at @s as @e[distance=0.1..20,tag=!phoenix_immune] unless entity @s[tag=immolation_target] at @s run particle flame ~ ~1 ~ 0.5 1 0.5 0.5 60 force

# Fire particles on marked targets
execute at @s as @e[distance=0.1..20,tag=immolation_target] at @s run particle flame ~ ~1 ~ 0.3 0.6 0.3 0.2 10 force
execute at @s as @e[distance=0.1..20,tag=immolation_target] at @s run particle soul_fire_flame ~ ~1.5 ~ 0.2 0.4 0.2 0.1 8 force
execute at @s as @e[distance=0.1..20,tag=immolation_target] at @s run particle smoke ~ ~1 ~ 0.2 0.5 0.2 0.05 6 force

# Display progress with burn damage warning
execute if score @s phoenix_stacks_elite matches ..5 if score @s phoenix_form_timer matches 100.. run title @s actionbar [{"text":"🔥 BURNING: ","color":"red","bold":true},{"score":{"name":"@s","objective":"phoenix_form_timer"},"color":"yellow"},{"text":" | Stacks: ","color":"gray"},{"score":{"name":"@s","objective":"phoenix_stacks_elite"},"color":"gold"},{"text":"/6 | Burn: -","color":"gray"},{"score":{"name":"@s","objective":"self_burn_damage"},"color":"red"},{"text":" HP","color":"gray"}]
execute if score @s phoenix_stacks_elite matches ..5 if score @s phoenix_form_timer matches 60..99 run title @s actionbar [{"text":"⚠ BURNING: ","color":"gold","bold":true},{"score":{"name":"@s","objective":"phoenix_form_timer"},"color":"yellow"},{"text":" | Stacks: ","color":"gray"},{"score":{"name":"@s","objective":"phoenix_stacks_elite"},"color":"gold"},{"text":"/6 | Burn: -","color":"gray"},{"score":{"name":"@s","objective":"self_burn_damage"},"color":"red"},{"text":" HP","color":"gray"}]
execute if score @s phoenix_stacks_elite matches ..5 if score @s phoenix_form_timer matches ..59 run title @s actionbar [{"text":"⚠ DYING: ","color":"dark_red","bold":true},{"score":{"name":"@s","objective":"phoenix_form_timer"},"color":"red"},{"text":" | Stacks: ","color":"gray"},{"score":{"name":"@s","objective":"phoenix_stacks_elite"},"color":"gold"},{"text":"/6 | Burn: -","color":"gray"},{"score":{"name":"@s","objective":"self_burn_damage"},"color":"red"},{"text":" HP","color":"gray"}]
execute if score @s phoenix_stacks_elite matches 6.. run title @s actionbar [{"text":"✓ REBIRTH READY: ","color":"green","bold":true},{"score":{"name":"@s","objective":"phoenix_stacks_elite"},"color":"gold"},{"text":" stacks!","color":"gray"}]

# Ambient sound (burning)
execute if score @s phoenix_form_timer matches 120 run playsound entity.blaze.ambient master @s ~ ~ ~ 1 1.5
execute if score @s phoenix_form_timer matches 80 run playsound entity.blaze.ambient master @s ~ ~ ~ 1 1.5
execute if score @s phoenix_form_timer matches 40 run playsound entity.blaze.ambient master @s ~ ~ ~ 1.5 1.5
execute if score @s phoenix_form_timer matches 20 run playsound entity.blaze.hurt master @s ~ ~ ~ 2 2

execute if score @s phoenix_stacks_elite matches 6.. run effect give @s instant_health 1 1 true