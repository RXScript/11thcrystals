# Kill all gems at once with a tag system
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"diamond"}}}}] add gem_diamond
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"emerald"}}}}] add gem_emerald
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"amethyst"}}}}] add gem_amethyst
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"lapis"}}}}] add gem_lapis
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"ruby"}}}}] add gem_ruby
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"amber"}}}}] add gem_amber
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"quartz"}}}}] add gem_quartz
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"prismarine"}}}}] add gem_prismarine
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"echo_shard"}}}}] add gem_echo
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"netherite"}}}}] add gem_netherite
tag @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{gem:"redstone"}}}}] add gem_redstone

# DIAMOND - Explosion of light
execute as @e[tag=gem_diamond] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_diamond] at @s run particle enchant ~ ~0.5 ~ 1 1 1 2 150 force
execute as @e[tag=gem_diamond] at @s run particle end_rod ~ ~0.5 ~ 0.8 0.8 0.8 0.2 80 force
execute as @e[tag=gem_diamond] at @s run particle firework ~ ~0.5 ~ 0.5 0.5 0.5 0.3 60 force
execute as @e[tag=gem_diamond] at @s run playsound entity.player.levelup master @a ~ ~ ~ 2 1.5
execute as @e[tag=gem_diamond] at @s run playsound block.beacon.activate master @a ~ ~ ~ 1.5 2
execute as @e[tag=gem_diamond] at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 2 0.5

# EMERALD - Nature explosion
execute as @e[tag=gem_emerald] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_emerald] at @s run particle happy_villager ~ ~0.5 ~ 1.2 1.2 1.2 0.5 120 force
execute as @e[tag=gem_emerald] at @s run particle composter ~ ~0.5 ~ 1 1 1 0.5 100 force
execute as @e[tag=gem_emerald] at @s run particle glow ~ ~0.5 ~ 0.8 0.8 0.8 0.2 70 force
execute as @e[tag=gem_emerald] at @s run playsound entity.villager.celebrate master @a ~ ~ ~ 2 1.2
execute as @e[tag=gem_emerald] at @s run playsound block.grass.break master @a ~ ~ ~ 2 0.5
execute as @e[tag=gem_emerald] at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 1.5 1.5

# AMETHYST - Portal vortex
execute as @e[tag=gem_amethyst] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_amethyst] at @s run particle portal ~ ~0.5 ~ 1.5 1.5 1.5 3 200 force
execute as @e[tag=gem_amethyst] at @s run particle dragon_breath ~ ~0.5 ~ 1 1 1 0.1 80 force
execute as @e[tag=gem_amethyst] at @s run particle witch ~ ~0.5 ~ 0.8 0.8 0.8 0.5 60 force
execute as @e[tag=gem_amethyst] at @s run playsound block.amethyst_block.chime master @a ~ ~ ~ 2 0.8
execute as @e[tag=gem_amethyst] at @s run playsound entity.enderman.teleport master @a ~ ~ ~ 1.5 1.5
execute as @e[tag=gem_amethyst] at @s run playsound block.respawn_anchor.charge master @a ~ ~ ~ 2 2

# LAPIS - Arcane surge
execute as @e[tag=gem_lapis] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_lapis] at @s run particle enchant ~ ~0.5 ~ 1.2 1.2 1.2 2.5 180 force
execute as @e[tag=gem_lapis] at @s run particle witch ~ ~0.5 ~ 1 1 1 0.3 90 force
execute as @e[tag=gem_lapis] at @s run particle soul ~ ~0.5 ~ 0.8 0.8 0.8 0.2 70 force
execute as @e[tag=gem_lapis] at @s run playsound block.enchantment_table.use master @a ~ ~ ~ 2 1.3
execute as @e[tag=gem_lapis] at @s run playsound block.beacon.power_select master @a ~ ~ ~ 1.5 1.8
execute as @e[tag=gem_lapis] at @s run playsound entity.illusioner.cast_spell master @a ~ ~ ~ 1.5 1

# RUBY - Inferno burst
execute as @e[tag=gem_ruby] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_ruby] at @s run particle flame ~ ~0.5 ~ 1.2 1.2 1.2 0.3 150 force
execute as @e[tag=gem_ruby] at @s run particle lava ~ ~0.5 ~ 1 1 1 0.5 50 force
execute as @e[tag=gem_ruby] at @s run particle smoke ~ ~0.5 ~ 0.8 0.8 0.8 0.2 80 force
execute as @e[tag=gem_ruby] at @s run particle soul_fire_flame ~ ~0.5 ~ 0.8 0.8 0.8 0.2 100 force
execute as @e[tag=gem_ruby] at @s run playsound item.firecharge.use master @a ~ ~ ~ 2 1.5
execute as @e[tag=gem_ruby] at @s run playsound entity.blaze.shoot master @a ~ ~ ~ 2 0.8
execute as @e[tag=gem_ruby] at @s run playsound entity.generic.explode master @a ~ ~ ~ 1 1.5

# AMBER - Time freeze burst
execute as @e[tag=gem_amber] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_amber] at @s run particle dripping_honey ~ ~1 ~ 1.5 1.5 1.5 0.5 100 force
execute as @e[tag=gem_amber] at @s run particle falling_honey ~ ~0.5 ~ 1 1 1 0.5 80 force
execute as @e[tag=gem_amber] at @s run particle glow ~ ~0.5 ~ 0.8 0.8 0.8 0.1 70 force
execute as @e[tag=gem_amber] at @s run particle end_rod ~ ~0.5 ~ 0.5 0.5 0.5 0.1 50 force
execute as @e[tag=gem_amber] at @s run playsound block.honey_block.place master @a ~ ~ ~ 2 0.8
execute as @e[tag=gem_amber] at @s run playsound block.conduit.activate master @a ~ ~ ~ 1.5 0.5
execute as @e[tag=gem_amber] at @s run playsound block.beacon.ambient master @a ~ ~ ~ 1 2

# QUARTZ - Energy overload
execute as @e[tag=gem_quartz] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_quartz] at @s run particle firework ~ ~0.5 ~ 1.5 1.5 1.5 0.4 150 force
execute as @e[tag=gem_quartz] at @s run particle flash{color:[1.0,1.0,1.0,1.0]} ~ ~0.5 ~ 0 0 0 0 5 force
execute as @e[tag=gem_quartz] at @s run particle electric_spark ~ ~0.5 ~ 1 1 1 0.5 100 force
execute as @e[tag=gem_quartz] at @s run particle end_rod ~ ~0.5 ~ 1.2 1.2 1.2 0.3 80 force
execute as @e[tag=gem_quartz] at @s run playsound entity.firework_rocket.twinkle master @a ~ ~ ~ 2 2
execute as @e[tag=gem_quartz] at @s run playsound block.beacon.power_select master @a ~ ~ ~ 2 2
execute as @e[tag=gem_quartz] at @s run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 0.8 2

# PRISMARINE - Tidal explosion
execute as @e[tag=gem_prismarine] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_prismarine] at @s run particle splash ~ ~0.5 ~ 1.5 1.5 1.5 1 180 force
execute as @e[tag=gem_prismarine] at @s run particle falling_water ~ ~1.5 ~ 1.2 1.2 1.2 1 120 force
execute as @e[tag=gem_prismarine] at @s run particle bubble ~ ~0.5 ~ 1 1 1 0.5 100 force
execute as @e[tag=gem_prismarine] at @s run particle glow ~ ~0.5 ~ 0.8 0.8 0.8 0.2 60 force
execute as @e[tag=gem_prismarine] at @s run playsound entity.player.splash.high_speed master @a ~ ~ ~ 2 0.9
execute as @e[tag=gem_prismarine] at @s run playsound entity.elder_guardian.curse master @a ~ ~ ~ 1 1.5
execute as @e[tag=gem_prismarine] at @s run playsound block.conduit.deactivate master @a ~ ~ ~ 2 1

# ECHO SHARD - Reality shatter
execute as @e[tag=gem_echo] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_echo] at @s run particle sonic_boom ~ ~0.5 ~ 0 0 0 0 3 force
execute as @e[tag=gem_echo] at @s run particle sculk_soul ~ ~0.5 ~ 1.5 1.5 1.5 0.2 120 force
execute as @e[tag=gem_echo] at @s run particle smoke ~ ~0.5 ~ 1.2 1.2 1.2 0.1 100 force
execute as @e[tag=gem_echo] at @s run particle dragon_breath ~ ~0.5 ~ 1 1 1 0.1 80 force
execute as @e[tag=gem_echo] at @s run particle reverse_portal ~ ~0.5 ~ 1 1 1 1 100 force
execute as @e[tag=gem_echo] at @s run playsound entity.warden.sonic_boom master @a ~ ~ ~ 1.5 1.5
execute as @e[tag=gem_echo] at @s run playsound entity.warden.death master @a ~ ~ ~ 1 2
execute as @e[tag=gem_echo] at @s run playsound entity.enderman.scream master @a ~ ~ ~ 1.5 0.5

# NETHERITE - Ancient Void Collapse
execute as @e[tag=gem_netherite] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_netherite] at @s run particle large_smoke ~ ~0.5 ~ 1.2 1.2 1.2 0.1 150 force
execute as @e[tag=gem_netherite] at @s run particle ash ~ ~0.5 ~ 1.5 1.5 1.5 0.5 200 force
execute as @e[tag=gem_netherite] at @s run particle lava ~ ~0.5 ~ 1 1 1 0.2 40 force
execute as @e[tag=gem_netherite] at @s run particle soul ~ ~0.5 ~ 0.8 0.8 0.8 0.1 60 force
execute as @e[tag=gem_netherite] at @s run playsound item.armor.equip_netherite master @a ~ ~ ~ 2 0.5
execute as @e[tag=gem_netherite] at @s run playsound entity.ravager.celebrate master @a ~ ~ ~ 1.5 0.1
execute as @e[tag=gem_netherite] at @s run playsound block.respawn_anchor.deplete master @a ~ ~ ~ 2 0.5

# REDSTONE - High-Voltage Overload
execute as @e[tag=gem_redstone] at @s run summon lightning_bolt ~ ~ ~
execute as @e[tag=gem_redstone] at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~ ~ 1.2 1.2 1.2 1 200 force
execute as @e[tag=gem_redstone] at @s run particle electric_spark ~ ~0.5 ~ 1.5 1.5 1.5 1 150 force
execute as @e[tag=gem_redstone] at @s run particle damage_indicator ~ ~0.5 ~ 0.5 0.5 0.5 0.2 40 force
execute as @e[tag=gem_redstone] at @s run playsound block.redstone_torch.burnout master @a ~ ~ ~ 2 1
execute as @e[tag=gem_redstone] at @s run playsound entity.zombie_villager.converted master @a ~ ~ ~ 1.5 2
execute as @e[tag=gem_redstone] at @s run playsound block.note_block.bit master @a ~ ~ ~ 2 1.5

# Kill all tagged gems
kill @e[type=item,tag=gem_diamond]
kill @e[type=item,tag=gem_emerald]
kill @e[type=item,tag=gem_amethyst]
kill @e[type=item,tag=gem_lapis]
kill @e[type=item,tag=gem_ruby]
kill @e[type=item,tag=gem_amber]
kill @e[type=item,tag=gem_quartz]
kill @e[type=item,tag=gem_prismarine]
kill @e[type=item,tag=gem_echo]
kill @e[type=item,tag=gem_netherite]
kill @e[type=item,tag=gem_redstone]