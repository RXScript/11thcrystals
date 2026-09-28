execute unless entity @s[tag=has_echo] run tellraw @s {"text":"[!] You already have a crystal.","color":"red"}
execute unless entity @s[tag=has_echo] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1 1
execute unless entity @s[tag=has_echo] run return fail

# ==========================================
# ECHO TACTICAL: "VOID STEP"
# 30 Second Cooldown - 50 Mastery Points
# Tactical stealth - Enter the void
# Invisible + speed for 3 seconds
# Break stealth = damage pulse
# ==========================================

# 1. Cooldown Check
execute if score @s cd_30s matches 1.. run title @s actionbar [{"text":"⬥ VOID READY IN: ","color":"red","bold":true},{"score":{"name":"*","objective":"cd_30s"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute if score @s cd_30s matches 1.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute if score @s cd_30s matches 1.. run return fail

# 2. Mastery Check
execute unless score @s mastery matches 50.. run title @s actionbar {"text":"⬥ Requires 50 Mastery!","color":"red","bold":true}
execute unless score @s mastery matches 50.. run playsound block.note_block.bass master @s ~ ~ ~ 0.5 0.5
execute unless score @s mastery matches 50.. run return fail

# 3. ACTIVATION ANNOUNCEMENT
title @s title [{"text":"⬥ VOID STEP ⬥","color":"dark_purple","bold":true}]
title @s subtitle [{"text":"Between the seconds","color":"dark_gray","italic":true}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]
tellraw @s [{"text":"   ⬥ VOID STEP ⬥","color":"dark_purple","bold":true}]
tellraw @s [{"text":"  DURATION: 5 seconds","color":"yellow"}]
tellraw @s [{"text":"  Invisible in the void!","color":"gray"}]
tellraw @s [{"text":"  Attack breaks stealth","color":"dark_gray"}]
tellraw @s [{"text":"  Break = 12 HP pulse","color":"red"}]
tellraw @s [{"text":"━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_purple","bold":true}]

# 4. ACTIVATION VISUALS - ENTER VOID
execute at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 5 force
execute at @s run particle explosion ~ ~1 ~ 0 0 0 0 20 force
execute at @s run particle dust{color:[0.1,0.0,0.2],scale:4} ~ ~1 ~ 2 2 2 1 500 force
execute at @s run particle portal ~ ~1 ~ 1.5 1.5 1.5 3 400 force
execute at @s run particle sculk_charge_pop ~ ~1 ~ 1 1 1 0 300 force
execute at @s run particle sonic_boom ~ ~1 ~ 0 0 0 0 5 force

# Void implosion effect
execute at @s run particle dust{color:[0.0,0.0,0.0],scale:3} ~ ~1 ~ 3 0.1 3 0 100 force
execute at @s run particle dust{color:[0.0,0.0,0.0],scale:3} ~ ~1 ~ 2 0.1 2 0 80 force
execute at @s run particle dust{color:[0.0,0.0,0.0],scale:3} ~ ~1 ~ 1 0.1 1 0 60 force

# 5. SOUND SEQUENCE
execute at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 2 2
execute at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 2 0.5
execute at @s run playsound block.sculk_shrieker.shriek master @a ~ ~ ~ 2 2
execute at @s run playsound entity.player.levelup master @a ~ ~ ~ 1.5 2

# 6. TAG SYSTEM
tag @s add void_stepping
tag @s add echo2_immune
scoreboard players set @s void2_timer 100
scoreboard players set @s void_broken 0

# 7. APPLY VOID EFFECTS (5 seconds)
effect give @s invisibility 5 0 true
effect give @s speed 5 1 true
effect give @s night_vision 5 0 true

# 8. SET COOLDOWN
scoreboard players set @s cd_30s 600

gamemode spectator @s
scoreboard players set @s voidphase_timer 10