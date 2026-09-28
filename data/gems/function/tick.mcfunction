# Check for right-click usage
execute as @a[scores={used_carrot=1..}] run scoreboard players add @s gem_use 1

# Run the logic for anyone who clicked
execute as @a[scores={gem_use=1..}] at @s run function gems:check_ability

execute as @a[scores={used_carrot=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data={masteryitem:1}] run function gems:mastery/tier_1

execute as @a[scores={used_carrot=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data={masteryitem:2}] run function gems:mastery/tier_2

execute as @a[scores={used_carrot=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data={masteryitem:3}] run function gems:mastery/tier_3

# Detect lapis release click
execute as @a[tag=arcane_charging,scores={used_carrot=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data={lapis_release:1b}] run function gems:lapis/release_overflow
# Detect amber trap detonation
execute as @a[tag=trap_master,scores={used_carrot=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data={amber_detonate:1b}] run function gems:amber/manual_detonate
# Detect prismarine fire
execute as @a[tag=guardian_focusing,scores={used_carrot=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data={fire_laser:1b}] run function gems:prismarine/manual_fire
# Detect echo detonation
execute as @a[tag=void_echoist,scores={used_carrot=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[custom_data={echo_detonate:1b}] run function gems:echo/manual_collapse

# Reset the click detection
scoreboard players set @a used_carrot 0
scoreboard players reset @a gem_use

scoreboard players add #crystal_give_or_return crystal_give_or_return_timer 1
execute if score #crystal_give_or_return crystal_give_or_return_timer matches 20.. run function gems:items/crystal_return
execute if score #crystal_give_or_return crystal_give_or_return_timer matches 20.. run scoreboard players set #crystal_give_or_return crystal_give_or_return_timer 0

execute as @a[tag=!initiated] at @s run function gems:on_initiation

# Mastery Advancement Checker (runs every tick)
advancement grant @a only gems:mastery/root
advancement grant @a only gems:mastery/novice
execute as @a[scores={mastery=50..}] run advancement grant @s only gems:mastery/apprentice
execute as @a[scores={mastery=150..}] run advancement grant @s only gems:mastery/warrior
execute as @a[scores={mastery=300..}] run advancement grant @s only gems:mastery/veteran
execute as @a[scores={mastery=500..}] run advancement grant @s only gems:mastery/master




execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"diamond"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"emerald"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"amethyst"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"lapis"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"ruby"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"amber"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"quartz"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"prismarine"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"echo_shard"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"netherite"}}}}] run tag @s add undropable
execute as @e[type=minecraft:item,tag=!processed,nbt={Item:{id:"minecraft:carrot_on_a_stick",components:{"minecraft:custom_data":{gem:"redstone"}}}}] run tag @s add undropable

execute as @e[type=minecraft:item,tag=undropable,tag=!processed] run data modify entity @s Owner set from entity @s Thrower
execute as @e[type=minecraft:item,tag=undropable,tag=!processed] run data modify entity @s PickupDelay set value 0

execute as @e[type=minecraft:item,tag=undropable,tag=!processed] at @s run tellraw @p {"text":"[!] You are not allowed to drop this item.","color":"red"}
execute as @e[type=minecraft:item,tag=undropable,tag=!processed] at @s run playsound minecraft:entity.villager.no master @p ~ ~ ~ 1 1

tag @e[type=minecraft:item] add processed
tag @e[type=minecraft:item,tag=undropable] remove undropable


# 1. Execute the clear commands based on the player's trigger score
execute as @a[scores={clear_duplicate=1}] run clear @s[tag=has_diamond] *[custom_data~{gem:"diamond"}] 1
execute as @a[scores={clear_duplicate=2}] run clear @s[tag=has_emerald] *[custom_data~{gem:"emerald"}] 1
execute as @a[scores={clear_duplicate=3}] run clear @s[tag=has_amethyst] *[custom_data~{gem:"amethyst"}] 1
execute as @a[scores={clear_duplicate=4}] run clear @s[tag=has_lapis] *[custom_data~{gem:"lapis"}] 1
execute as @a[scores={clear_duplicate=5}] run clear @s[tag=has_ruby] *[custom_data~{gem:"ruby"}] 1
execute as @a[scores={clear_duplicate=6}] run clear @s[tag=has_amber] *[custom_data~{gem:"amber"}] 1
execute as @a[scores={clear_duplicate=7}] run clear @s[tag=has_quartz] *[custom_data~{gem:"quartz"}] 1
execute as @a[scores={clear_duplicate=8}] run clear @s[tag=has_prismarine] *[custom_data~{gem:"prismarine"}] 1
execute as @a[scores={clear_duplicate=9}] run clear @s[tag=has_echo_shard] *[custom_data~{gem:"echo_shard"}] 1
execute as @a[scores={clear_duplicate=10}] run clear @s[tag=has_netherite] *[custom_data~{gem:"netherite"}] 1
execute as @a[scores={clear_duplicate=11}] run clear @s[tag=has_redstone] *[custom_data~{gem:"redstone"}] 1

# 2. Reset the score so it doesn't infinitely loop
scoreboard players reset @a[scores={clear_duplicate=1..}] clear_duplicate

# 3. Re-enable the trigger for everyone so they can use the command again
scoreboard players enable @a clear_duplicate

# Enable the trigger for everyone
scoreboard players enable @a view_mastery

# Check for players who activated the trigger
execute as @a[scores={view_mastery=1..}] run function gems:mastery/view

# Reset the trigger so they can use it again
scoreboard players set @a[scores={view_mastery=1..}] view_mastery 0



scoreboard players add #gem_timer gem_kill_timer 1
execute if score #gem_timer gem_kill_timer matches 20.. run function gems:kill/kill_gems
execute if score #gem_timer gem_kill_timer matches 20.. run scoreboard players set #gem_timer gem_kill_timer 0

# Kill gem drops with effects (every 5 ticks)
scoreboard players add #gem_timer timer 1
execute if score #gem_timer timer matches 5.. run function gems:kill_gems
execute if score #gem_timer timer matches 5.. run scoreboard players set #gem_timer timer 0

# Subtract 1 from cooldowns every tick (if they are above 0)
execute as @a[scores={cd_10s=1..}] run scoreboard players remove @s cd_10s 1
execute as @a[scores={cd_30s=1..}] run scoreboard players remove @s cd_30s 1
execute as @a[scores={cd_90s=1..}] run scoreboard players remove @s cd_90s 1
execute as @a[scores={cd_3m=1..}] run scoreboard players remove @s cd_3m 1
execute as @a[scores={cd_10m=1..}] run scoreboard players remove @s cd_10m 1






# crystal restore function



# --- TIER 1: BASIC (10s) ---
# Sound: A subtle crystal chime. Particle: A small white puff at the feet.
execute as @a[scores={cd_10s=1}] run tellraw @s {"text":"✦ T1: READY","color":"gray"}
execute as @a[scores={cd_10s=1}] at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 2

# --- TIER 2: TACTICAL (30s) ---
# Sound: A mechanical click. Particle: Blue 'spark' effect.
execute as @a[scores={cd_30s=1}] run tellraw @s {"text":"◈ T2: READY","color":"aqua"}
execute as @a[scores={cd_30s=1}] at @s run playsound minecraft:block.decoration.trial_spawner.chime player @s ~ ~ ~ 0.8 1.5

# --- TIER 3: ADVANCED (90s) ---
# Sound: A deep resonant hum. Particle: Glowing "soul" particles.
execute as @a[scores={cd_90s=1}] run tellraw @s {"text":"▲ T3: READY","color":"blue"}
execute as @a[scores={cd_90s=1}] at @s run playsound minecraft:block.conduit.activate player @s ~ ~ ~ 1 1.8

# --- TIER 4: ELITE (3m) ---
# Sound: The Breeze "charge" sound (very 1.21). Particle: Vault-style ominous particles.
execute as @a[scores={cd_3m=1}] run tellraw @s {"text":"★ T4: READY","color":"light_purple"}
execute as @a[scores={cd_3m=1}] at @s run playsound minecraft:entity.breeze.charge player @s ~ ~ ~ 1 1.2

# --- TIER 5: ULTIMATE (10m) ---
# Sound: The Ominous Vault opening (heavy/mechanical). Particle: A massive "flash" of white.
execute as @a[scores={cd_10m=1}] run tellraw @s {"text":"Ω ULTIMATE: READY","color":"gold","bold":true}
execute as @a[scores={cd_10m=1}] at @s run playsound minecraft:block.vault.open_shutter player @s ~ ~ ~ 1 0.7


# -------------------------------------
# THIS PART HERE IS THE ROULETTE SYSTEM
#--------------------------------------
    
# Only run for players rolling
execute as @a[tag=rolling_crystal] at @s run function gems:roll/animate
execute as @a[tag=rolling_crystal] at @s run function gems:roll/finish

# If a player gets a kill, run the check and reset process
execute as @a[scores={player_kills=1..}] run function gems:mastery/process_kill
execute as @a[scores={wither_kills=1..}] run function gems:mastery/process_kill
execute as @a[scores={warden_kills=1..}] run function gems:mastery/process_kill
execute as @a[scores={dragon_kills=1..}] run function gems:mastery/process_kill






# diamond ult stuff
# Immovable Mountain continuous effects
execute as @a[tag=immovable_mountain] at @s run function gems:diamond/mountain_tick

# Countdown mountain timer
scoreboard players remove @a[tag=immovable_mountain] mountain_timer 1
execute as @a[tag=immovable_mountain,scores={mountain_timer=..0}] run function gems:diamond/mountain_end




# amber ult stuff
# Fossilized Eternity continuous effects
execute as @a[tag=fossilized_eternity] at @s run function gems:amber/eternity_tick

# Countdown eternity timer
scoreboard players remove @a[tag=fossilized_eternity] eternity_timer 1
execute as @a[tag=fossilized_eternity,scores={eternity_timer=..0}] run function gems:amber/eternity_end




# emerald ult stuff
# Emerald Harvest continuous effects
execute as @a[tag=emerald_harvest] at @s run function gems:emerald/harvest_tick

# Countdown harvest timer
scoreboard players remove @a[tag=emerald_harvest] harvest_timer 1
execute as @a[tag=emerald_harvest,scores={harvest_timer=..0}] run function gems:emerald/harvest_end
function gems:emerald/entangled_display_tick




# amethyst ult stuff
# Resonant Collapse continuous effects
execute as @a[tag=resonant_collapse] at @s run function gems:amethyst/resonance_tick

# Countdown resonance timer
scoreboard players remove @a[tag=resonant_collapse] resonance_timer 1
execute as @a[tag=resonant_collapse,scores={resonance_timer=..0}] run function gems:amethyst/resonance_end




# lapis ult stuff
# Arcane Dominion continuous effects
execute as @a[tag=arcane_dominion] at @s run function gems:lapis/dominion_tick

# Countdown dominion timer
scoreboard players remove @a[tag=arcane_dominion] dominion_timer 1
execute as @a[tag=arcane_dominion,scores={dominion_timer=..0}] run function gems:lapis/dominion_end




# ruby ult stuff
# Phoenix Protocol continuous effects
execute as @a[tag=phoenix_protocol] at @s run function gems:ruby/phoenix_tick

# Phoenix Rebirth death check
execute as @a[tag=has_rebirth,scores={rebirth_ready=1..}] if entity @s[nbt={Health:5.0f}] run function gems:ruby/rebirth

# Countdown phoenix timer
scoreboard players remove @a[tag=phoenix_protocol] phoenix_timer 1
execute as @a[tag=phoenix_protocol,scores={phoenix_timer=..0}] run function gems:ruby/phoenix_end




# quartz ult stuff
# Overclock Protocol continuous effects
execute as @a[tag=overclock_protocol] at @s run function gems:quartz/overclock_tick

# Countdown overclock timer
scoreboard players remove @a[tag=overclock_protocol] overclock_timer 1
execute as @a[tag=overclock_protocol,scores={overclock_timer=..0}] run function gems:quartz/overclock_end



# prismarine ult stuff
# Abyssal Dominion continuous effects
execute as @a[tag=abyssal_dominion] at @s run function gems:prismarine/abyssal_tick

# Damage reflection check
execute as @a[tag=abyssal_dominion] if entity @s[nbt={HurtTime:1s}] run function gems:prismarine/reflect_damage

# Countdown abyssal timer
scoreboard players remove @a[tag=abyssal_dominion] abyssal_timer 1
execute as @a[tag=abyssal_dominion,scores={abyssal_timer=..0}] run function gems:prismarine/abyssal_end
function gems:prismarine/tsunami_display_tick



# echo ult stuff
# Void Walker continuous effects
execute as @a[tag=void_walker] at @s run function gems:echo/void_tick

# Countdown void timer
scoreboard players remove @a[tag=void_walker] void_timer 1
execute as @a[tag=void_walker,scores={void_timer=..0}] run function gems:echo/void_end



# netherite ult stuff
# The Inevitable continuous effects
execute as @a[tag=the_inevitable] at @s run function gems:netherite/inevitable_tick

# Countdown inevitable timer
scoreboard players remove @a[tag=the_inevitable] inevitable_timer 1
execute as @a[tag=the_inevitable,scores={inevitable_timer=..0}] run function gems:netherite/inevitable_end
function gems:netherite/gravity_display_tick



# redstone ult stuff
# Redstone Overclock continuous effects
execute as @a[tag=redstone_overclock] at @s run function gems:redstone/overclock_tick

# Countdown overclock timer
scoreboard players remove @a[tag=redstone_overclock] overclock_timer 1
execute as @a[tag=redstone_overclock,scores={overclock_timer=..0}] run function gems:redstone/overclock_end
function gems:redstone/surge_ring_display_tick









# diamond elite stuff
# Fortress continuous effects
execute as @a[tag=fortress_active] at @s run function gems:diamond/fortress_tick

# Detect if fortress took damage
execute as @a[tag=fortress_active] if entity @s[nbt={HurtTime:1s}] run function gems:diamond/fortress_hit

# Countdown fortress timer
scoreboard players remove @a[tag=fortress_active] fortress_timer 1
execute as @a[tag=fortress_active,scores={fortress_timer=..0}] run function gems:diamond/fortress_end



# emerald elite stuff
# Bargain continuous effects
execute as @a[tag=bargain_active] at @s run function gems:emerald/bargain_tick

# Detect hits on marked targets
execute as @e[tag=bargain_marked] if entity @s[nbt={HurtTime:10s}] run function gems:emerald/bargain_hit

# Countdown bargain timer
scoreboard players remove @a[tag=bargain_active] bargain_timer 1
execute as @a[tag=bargain_active,scores={bargain_timer=..0}] run function gems:emerald/bargain_end

# Life steal effect
execute as @a[tag=life_steal_active] at @s run particle happy_villager ~ ~1 ~ 0.5 1 0.5 0.1 3 force
execute as @a[tag=life_steal_active] if entity @s[nbt={HurtTime:10s}] run effect give @s instant_health 1 0 true
scoreboard players remove @a[tag=life_steal_active] life_steal_timer 1
execute as @a[tag=life_steal_active,scores={life_steal_timer=..0}] run tag @s remove life_steal_active



# amethyst elite stuff
# Resonance continuous effects
execute as @a[tag=resonance_active] at @s run function gems:amethyst/resonance4_tick

# Detect hits on marked targets
execute as @e[tag=resonance_marked] if entity @s[nbt={HurtTime:10s}] run function gems:amethyst/resonance_hit

# Countdown resonance timer
scoreboard players remove @a[tag=resonance_active] resonance4_timer 1
execute as @a[tag=resonance_active,scores={resonance4_timer=..0}] run function gems:amethyst/resonance4_end

# Countdown rhythm cooldown
scoreboard players remove @a[tag=resonance_active,scores={rhythm_cooldown=1..}] rhythm_cooldown 1



# lapis elite stuff
# Arcane Cascade continuous effects
execute as @a[tag=cascade_active] at @s run function gems:lapis/cascade_tick

# Detect hits on marked targets
execute as @e[tag=cascade_marked] if entity @s[nbt={HurtTime:10s}] run function gems:lapis/cascade_hit

# Countdown cascade timer
scoreboard players remove @a[tag=cascade_active] cascade_timer 1
execute as @a[tag=cascade_active,scores={cascade_timer=..0}] run function gems:lapis/cascade_end



# ruby elite stuff
# Phoenix Form continuous effects
execute as @a[tag=phoenix_form] at @s run function gems:ruby/phoenix_form_tick

# Detect hits on immolation targets
execute as @e[tag=immolation_target] if entity @s[nbt={HurtTime:10s}] run function gems:ruby/immolation_hit

# Self-burn damage every 1 second (20 ticks)
execute as @a[tag=phoenix_form,scores={phoenix_form_timer=140}] run function gems:ruby/self_burn
execute as @a[tag=phoenix_form,scores={phoenix_form_timer=120}] run function gems:ruby/self_burn
execute as @a[tag=phoenix_form,scores={phoenix_form_timer=100}] run function gems:ruby/self_burn
execute as @a[tag=phoenix_form,scores={phoenix_form_timer=80}] run function gems:ruby/self_burn
execute as @a[tag=phoenix_form,scores={phoenix_form_timer=60}] run function gems:ruby/self_burn
execute as @a[tag=phoenix_form,scores={phoenix_form_timer=40}] run function gems:ruby/self_burn
execute as @a[tag=phoenix_form,scores={phoenix_form_timer=20}] run function gems:ruby/self_burn

# Countdown phoenix form timer
scoreboard players remove @a[tag=phoenix_form] phoenix_form_timer 1
execute as @a[tag=phoenix_form,scores={phoenix_form_timer=..0}] run function gems:ruby/phoenix_form_end



# amber elite stuff
# Amber Resin continuous effects
execute as @a[tag=resin_tank] at @s run function gems:amber/resin_tick

# Track damage when hit
# Track damage EVERY TICK (not just on HurtTime)
execute as @a[tag=resin_tank] run function gems:amber/track_damage

# Amber weight every 2 seconds (40 ticks)
execute as @a[tag=resin_tank,scores={resin_timer=140}] run function gems:amber/amber_weight
execute as @a[tag=resin_tank,scores={resin_timer=100}] run function gems:amber/amber_weight
execute as @a[tag=resin_tank,scores={resin_timer=60}] run function gems:amber/amber_weight
execute as @a[tag=resin_tank,scores={resin_timer=20}] run function gems:amber/amber_weight

# Countdown resin timer
scoreboard players remove @a[tag=resin_tank] resin_timer 1
execute as @a[tag=resin_tank,scores={resin_timer=..0}] run function gems:amber/resin_end



# quartz elite stuff
# Efficiency Protocol continuous effects
execute as @a[tag=protocol_active] at @s run function gems:quartz/protocol_tick

# Detect hits on efficiency targets
execute as @e[tag=efficiency_target] if entity @s[nbt={HurtTime:10s}] run function gems:quartz/protocol_hit

# Countdown protocol timer
scoreboard players remove @a[tag=protocol_active] protocol_timer 1
execute as @a[tag=protocol_active,scores={protocol_timer=..0}] run function gems:quartz/protocol_end



# prismarine elite stuff
# Tidal Debt continuous effects
execute as @a[tag=debt_collector] at @s run function gems:prismarine/debt_tick

# Track damage dealt to debt holders
execute as @e[tag=debt_holder] if entity @s[nbt={HurtTime:10s}] run function gems:prismarine/collect_debt

# Drowning damage every second (20 ticks)
execute as @a[tag=debt_collector,scores={debt_timer=100}] run function gems:prismarine/drown_tick
execute as @a[tag=debt_collector,scores={debt_timer=80}] run function gems:prismarine/drown_tick
execute as @a[tag=debt_collector,scores={debt_timer=60}] run function gems:prismarine/drown_tick
execute as @a[tag=debt_collector,scores={debt_timer=40}] run function gems:prismarine/drown_tick
execute as @a[tag=debt_collector,scores={debt_timer=20}] run function gems:prismarine/drown_tick

# Countdown debt timer
scoreboard players remove @a[tag=debt_collector] debt_timer 1
execute as @a[tag=debt_collector,scores={debt_timer=..0}] run function gems:prismarine/debt_end



# echo elite stuff
# Silent Hunt continuous effects
execute as @a[tag=silent_hunter] at @s run function gems:echo/silent_hunt_tick

# Detect hits on scream marked enemies
execute as @e[tag=scream_marked] if entity @s[nbt={HurtTime:10s}] run function gems:echo/collect_fragment

# Countdown silent hunt timer
scoreboard players remove @a[tag=silent_hunter] silent_hunt_timer 1
execute as @a[tag=silent_hunter,scores={silent_hunt_timer=..0}] run function gems:echo/silent_hunt_end



# netherite elite stuff
# Gravitational Collapse continuous effects
execute as @a[tag=gravity_well] at @s run function gems:netherite/gravity_tick

# Detect hits on gravity targets
execute as @e[tag=gravity_target] if entity @s[nbt={HurtTime:10s}] run function gems:netherite/gravity_pull

# Countdown gravity timer
scoreboard players remove @a[tag=gravity_well] gravity_timer 1
execute as @a[tag=gravity_well,scores={gravity_timer=..0}] run function gems:netherite/gravity_end



# redstone elite stuff
# Electrical Discharge continuous effects
execute as @a[tag=overcharged] at @s run function gems:redstone/overcharge_tick

# Detect hits on discharge targets
execute as @e[tag=discharge_target] if entity @s[nbt={HurtTime:10s}] run function gems:redstone/discharge_hit

# Overload damage every second (20 ticks)
execute as @a[tag=overcharged,scores={overcharge_timer=100}] run function gems:redstone/overload_tick
execute as @a[tag=overcharged,scores={overcharge_timer=80}] run function gems:redstone/overload_tick
execute as @a[tag=overcharged,scores={overcharge_timer=60}] run function gems:redstone/overload_tick
execute as @a[tag=overcharged,scores={overcharge_timer=40}] run function gems:redstone/overload_tick
execute as @a[tag=overcharged,scores={overcharge_timer=20}] run function gems:redstone/overload_tick

# Countdown overcharge timer
scoreboard players remove @a[tag=overcharged] overcharge_timer 1
execute as @a[tag=overcharged,scores={overcharge_timer=..0}] run function gems:redstone/overcharge_end









# diamond advanced stuff
# Diamond Advanced - Unbreakable Will
execute as @a[tag=diamond_counter_ready] at @s run function gems:diamond/counter_tick
execute as @a[tag=diamond_counter_ready] if entity @s[nbt={HurtTime:1s}] run function gems:diamond/counter_hit
scoreboard players remove @a[tag=diamond_counter_ready] counter_window 1
execute as @a[tag=diamond_counter_ready,scores={counter_window=..0}] run function gems:diamond/counter_fail



# emerald advanced stuff
# Emerald Advanced - Vital Exchange
execute as @a[tag=vital_exchange_active] at @s run function gems:emerald/exchange_tick
execute as @e[tag=!exchange_immune] if entity @s[nbt={HurtTime:10s}] at @s if entity @p[tag=vital_exchange_active,distance=..8] run function gems:emerald/exchange_hit
scoreboard players remove @a[tag=vital_exchange_active] exchange_window 1
execute as @a[tag=vital_exchange_active,scores={exchange_window=..0}] run function gems:emerald/exchange_fail



# amethyst advanced stuff
# Amethyst Advanced - Seismic Sense
execute as @a[tag=seismic_sensing] at @s run function gems:amethyst/seismic_tick
execute as @e[tag=vibration_source] at @s run function gems:amethyst/detect_movement
scoreboard players remove @a[tag=seismic_sensing] seismic_timer 1
execute as @a[tag=seismic_sensing,scores={seismic_timer=..0}] run function gems:amethyst/auto_detonate



# lapis advanced stuff
# Lapis Advanced - Arcane Overflow
execute as @a[tag=arcane_charging] at @s run function gems:lapis/overflow_tick
execute as @a[tag=arcane_charging] run scoreboard players add @s arcane_power 1
scoreboard players remove @a[tag=arcane_charging] arcane_charge_timer 1
execute as @a[tag=arcane_charging,scores={arcane_charge_timer=..0}] run function gems:lapis/auto_release



# ruby advanced stuff
# Ruby Advanced - Chain Ignition
execute as @a[tag=ruby_igniter] at @s run function gems:ruby/ignition_tick
execute as @a[tag=ruby_igniter] at @s as @e[distance=0.1..3,tag=spark_marked,scores={spark_ignited=0}] run function gems:ruby/ignite_spark
scoreboard players remove @a[tag=ruby_igniter] ignition_timer 1
execute as @a[tag=ruby_igniter,scores={ignition_timer=..0}] run function gems:ruby/ignition_end

# Ruby fire aspect (after chain explosion)
execute as @a[tag=fire_aspect_active] if entity @s[nbt={HurtTime:1s}] at @s as @e[distance=0.1..4,tag=!ruby_immune] run data merge entity @s {Fire:100s}
scoreboard players remove @a[tag=fire_aspect_active] fire_aspect_timer 1
execute as @a[tag=fire_aspect_active,scores={fire_aspect_timer=..0}] run tag @s remove fire_aspect_active




# amber advanced stuff
# Amber Advanced - Resin Trap
execute as @a[tag=trap_master] run function gems:amber/trap_tick
execute as @a[tag=trap_master] run function gems:amber/check_trap_area
scoreboard players remove @a[tag=trap_master] trap_timer 1
execute as @a[tag=trap_master,scores={trap_timer=..0}] run function gems:amber/auto_detonate




# quartz advanced stuff
# Quartz Advanced - Task Queue
execute as @a[tag=queue_active] at @s run function gems:quartz/queue_tick
scoreboard players remove @a[tag=queue_active] queue_timer 1
execute as @a[tag=queue_active,scores={queue_timer=..0}] run function gems:quartz/process_queue



# prismarine advanced stuff
# Prismarine Advanced - Guardian's Focus
execute as @a[tag=guardian_focusing] at @s run function gems:prismarine/focus_tick
execute as @a[tag=guardian_focusing] run function gems:prismarine/check_movement
execute as @a[tag=guardian_focusing] if entity @s[nbt={HurtTime:1s}] run function gems:prismarine/interrupted
scoreboard players remove @a[tag=guardian_focusing] focus_timer 1
execute as @a[tag=guardian_focusing,scores={focus_timer=..0}] run function gems:prismarine/auto_fire



# echo advanced stuff
# Echo Shard Advanced - Void Echoes
execute as @a[tag=void_echoist] at @s run function gems:echo/echo_tick
execute as @e[tag=void_echo_marker] at @s run function gems:echo/resonance_tick
execute as @a[tag=void_echoist] run scoreboard players add @s resonance_level 1
scoreboard players remove @a[tag=void_echoist] echo_timer 1
execute as @a[tag=void_echoist,scores={echo_timer=..0}] run function gems:echo/auto_collapse



# netherite advanced stuff
# Netherite Advanced - Weight of the World.
execute as @a[tag=anchor_point] at @s run function gems:netherite/anchor_tick
execute as @a[tag=anchor_point] run function gems:netherite/enforce_anchor
execute as @a[tag=anchor_point] at @s as @e[tag=mass_affected,distance=0.1..20] at @s run function gems:netherite/pull_entity
scoreboard players remove @a[tag=anchor_point] anchor_timer 1
execute as @a[tag=anchor_point,scores={anchor_timer=..0}] run function gems:netherite/gravitational_collapse



# redstone advanced stuff
# Redstone Advanced - Dead Circuit
execute as @a[tag=dead_circuit_active] at @s run function gems:redstone/circuit_tick
execute as @e[tag=circuit_marked,nbt={HurtTime:10s}] at @s run function gems:redstone/circuit_hit
scoreboard players remove @a[tag=dead_circuit_active] circuit_window 1
execute as @a[tag=dead_circuit_active,scores={circuit_window=..0,circuit_triggered=0}] run function gems:redstone/circuit_fail








# diamond tactical stuff
# Diamond Tactical - Stone Shell
execute as @a[tag=stone_shell_active] at @s run function gems:diamond/shell_tick
scoreboard players remove @a[tag=stone_shell_active] shell_timer 1
execute as @a[tag=stone_shell_active,scores={shell_timer=..0}] run function gems:diamond/shell_end
scoreboard players remove @a[scores={cd_30s=1..}] cd_30s 1



# emerald tactical stuff
# Emerald Tactical - Verdant Grasp
execute as @a[tag=verdant_grasping] at @s run function gems:emerald/grasp_tick
execute as @e[tag=grasp_victim,nbt={HurtTime:10s}] at @s run function gems:emerald/grasp_hit
scoreboard players remove @a[tag=verdant_grasping] grasp_timer 1
execute as @a[tag=verdant_grasping,scores={grasp_timer=..0}] run function gems:emerald/grasp_end



# amethyst tactical stuff
# Amethyst Tactical - Shatter Frequency
execute as @a[tag=frequency_charged] at @s run function gems:amethyst/frequency_tick
execute as @e[tag=frequency_target,nbt={HurtTime:10s}] at @s run function gems:amethyst/frequency_hit
scoreboard players remove @a[tag=frequency_charged] frequency_window 1
execute as @a[tag=frequency_charged,scores={frequency_window=..0,frequency_triggered=0}] run function gems:amethyst/frequency_fail



# lapis tactical stuff
# Lapis Tactical - Arcane Rush Trail
execute as @a[scores={rush_trail_timer=1..}] at @s run function gems:lapis/trail_tick
scoreboard players remove @a[scores={rush_trail_timer=1..}] rush_trail_timer 1
execute as @e[type=marker,tag=arcane_trail_marker] at @s run function gems:lapis/trail_marker_tick



# ruby tactical stuff
# Ruby Tactical - Ember Heart
execute as @a[tag=ember_heart_active] at @s run function gems:ruby/ember_tick
execute as @e[tag=ember_target,nbt={HurtTime:10s}] run function gems:ruby/ember_ignite
scoreboard players remove @a[tag=ember_heart_active] ember_timer 1
execute as @a[tag=ember_heart_active,scores={ember_timer=..0}] run function gems:ruby/ember_end



# amber tactical stuff
# Amber Tactical - Resin Bind
execute as @a[tag=resin_binding] at @s run function gems:amber/bind_tick
execute as @e[tag=resin_bound] at @s run function gems:amber/bound_tick
execute as @e[tag=resin_bound,nbt={HurtTime:10s}] run function gems:amber/bound_hit
scoreboard players remove @a[tag=resin_binding] bind_timer 1
scoreboard players remove @e[tag=resin_bound] resin_duration 1
execute as @a[tag=resin_binding,scores={bind_timer=..0}] run function gems:amber/bind_end
execute as @e[tag=resin_bound,scores={resin_duration=..0}] run function gems:amber/resin_shatter



# quartz tactical stuff
# Quartz Tactical - Precision Strike
execute as @a[tag=precision_charged] at @s run function gems:quartz/precision_tick
scoreboard players remove @a[tag=precision_charged] precision_window 1
execute as @a[tag=precision_charged,scores={precision_window=..0,precision_used=0}] run function gems:quartz/precision_fail
# Quartz Tactical - Precision Strike
execute as @a[tag=precision_charged] at @s run function gems:quartz/precision_tick
execute as @a[scores={precision_kill_timer=1..}] run scoreboard players remove @s precision_kill_timer 1
execute as @a[scores={precision_kill_timer=0}] run function gems:quartz/check_kill_refund
scoreboard players remove @a[tag=precision_charged] precision_window 1
execute as @a[tag=precision_charged,scores={precision_window=..0,precision_used=0}] run function gems:quartz/precision_fail



# prismarine tactical stuff
# Prismarine Tactical - Guardian's Reprisal
execute as @a[tag=reprisal_stance] at @s run function gems:prismarine/reprisal_tick
execute as @a[tag=reprisal_stance,nbt={HurtTime:1s}] run function gems:prismarine/reprisal_counter
scoreboard players remove @a[tag=reprisal_stance] reprisal_window 1
execute as @a[tag=reprisal_stance,scores={reprisal_window=..0,reprisal_triggered=0}] run function gems:prismarine/reprisal_fail



# echo tactical stuff
# Echo Tactical - Void Step
execute as @a[tag=void_stepping] at @s run function gems:echo/void2_tick
scoreboard players remove @a[tag=void_stepping] void2_timer 1
execute as @a[tag=void_stepping,scores={void2_timer=..0,void_broken=0}] run function gems:echo/void_expire



# netherite tactical stuff
# Netherite Tactical - Crushing Grasp
execute as @a[tag=crushing_grasper] at @s run function gems:netherite/grasp_tick
scoreboard players remove @a[tag=crushing_grasper] grasp_timer 1
execute as @a[tag=crushing_grasper,scores={grasp_timer=..0}] run function gems:netherite/execute_slam



# redstone tactical stuff
# Redstone Tactical - Voltage Strike
execute as @a[tag=voltage_charging,scores={voltage_phase=0}] at @s run function gems:redstone/charging_tick
execute as @a[tag=voltage_charging,scores={voltage_phase=1}] at @s run function gems:redstone/charged_tick
scoreboard players remove @a[tag=voltage_charging,scores={voltage_charge_timer=1..}] voltage_charge_timer 1
execute as @a[tag=voltage_charging,scores={voltage_charge_timer=0,voltage_phase=0}] run function gems:redstone/activate_voltage
scoreboard players remove @a[tag=voltage_charging,scores={voltage_phase=1}] voltage_window 1
execute as @a[tag=voltage_charging,scores={voltage_phase=1,voltage_window=..0,voltage_used=0}] run function gems:redstone/voltage_fail









# echo basic stuff
# Count down for anyone who has a timer
execute as @a[scores={voidphase_timer=1..}] run scoreboard players remove @s voidphase_timer 1
execute as @a[scores={voidphase_timer=1}] run function gems:echo/unphase







#----------------------
#       PASSIVES
#----------------------

# 1. Diamond (The Indomitable) - Focus: Pure damage reduction
execute as @a[tag=has_diamond,scores={mastery=50..}] run attribute @s minecraft:armor_toughness base set 2.0
execute as @a[tag=has_diamond,scores={mastery=100..},predicate=gems:is_sneaking] run attribute @s minecraft:armor base set 6.0
execute as @a[tag=has_diamond,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle block{block_state:{Name:"minecraft:diamond_block"}} ~ ~1 ~ 0.5 0.5 0.5 0 2 force
execute as @a[tag=has_diamond,scores={mastery=100..},predicate=!gems:is_sneaking] run attribute @s minecraft:armor base set 0
execute as @a[tag=has_diamond,scores={mastery=150..}] run effect give @s minecraft:resistance 1 0 true

# 2. Emerald (The Merchant King) - Focus: Luck and utility
execute as @a[tag=has_emerald,scores={mastery=50..}] run effect give @s minecraft:luck 1 0 true
execute as @a[tag=has_emerald,scores={mastery=100..},predicate=gems:is_sneaking] run attribute @s minecraft:block_interaction_range base set 7.0
execute as @a[tag=has_emerald,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 1 force
execute as @a[tag=has_emerald,scores={mastery=100..},predicate=!gems:is_sneaking] run attribute @s minecraft:block_interaction_range base set 4.5
execute as @a[tag=has_emerald,scores={mastery=150..}] run effect give @s minecraft:hero_of_the_village 1 0 true

# 3. Amethyst (The Resonance) - Focus: Vibrations and AOE
# Replaced step_height with Attack Damage (The "Resonant Strike")
execute as @a[tag=has_amethyst,scores={mastery=50..}] run attribute @s minecraft:attack_damage base set 1.6
execute as @a[tag=has_amethyst,scores={mastery=100..},predicate=gems:is_sneaking] at @s run effect give @e[type=!item,type=!armor_stand,type=!area_effect_cloud,distance=0.1..5,tag=!has_amethyst] minecraft:blindness 2 0 true
execute as @a[tag=has_amethyst,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle block{block_state:"minecraft:amethyst_block"} ~ ~1 ~ 0.5 0.5 0.5 0 2 force
execute as @a[tag=has_amethyst,scores={mastery=150..}] run effect give @s minecraft:haste 1 1 true

# 4. Lapis Lazuli (The Arcane) - Focus: Magic and critical knowledge
# Replaced absorption with Scaling Luck and Damage (The "Sharpened Edge")
execute as @a[tag=has_lapis,scores={mastery=50..}] run attribute @s minecraft:luck base set 2.0
execute as @a[tag=has_lapis,scores={mastery=100..},predicate=gems:is_sneaking] run attribute @s minecraft:attack_damage base set 4.0
execute as @a[tag=has_lapis,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle end_rod ~ ~1 ~ 0.5 0.5 0.5 0 1 force
execute as @a[tag=has_lapis,scores={mastery=100..},predicate=!gems:is_sneaking] run attribute @s minecraft:attack_damage base set 1.0
execute as @a[tag=has_lapis,scores={mastery=150..}] run attribute @s minecraft:attack_damage base set 3.0

# 5. Ruby (The Phoenix) - Focus: Life and heat
execute as @a[tag=has_ruby,scores={mastery=50..}] run effect give @s minecraft:fire_resistance 1 0 true
execute as @a[tag=has_ruby,scores={mastery=100..},predicate=gems:is_sneaking] run effect give @s regeneration 1 1 true
execute as @a[tag=has_ruby,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle flame ~ ~1 ~ 0.5 0.5 0.5 0 3 force
execute as @a[tag=has_ruby,scores={mastery=150..}] run attribute @s minecraft:max_health base set 28.0

# 6. Amber (The Eternal) - Focus: Preserved momentum and stasis
execute as @a[tag=has_amber,scores={mastery=50..}] run attribute @s minecraft:fall_damage_multiplier base set 0.5
execute as @a[tag=has_amber,scores={mastery=100..},predicate=gems:is_sneaking] at @s run effect give @e[type=!item,type=!armor_stand,type=!area_effect_cloud,distance=0.1..3,tag=!has_amber] minecraft:slowness 2 1 true
execute as @a[tag=has_amber,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle block{block_state:"minecraft:honey_block"} ~ ~1 ~ 0.5 0.5 0.5 0 3 force
execute as @a[tag=has_amber,scores={mastery=150..}] run attribute @s minecraft:safe_fall_distance base set 20.0

# 7. Nether Quartz (The Overclock) - Focus: Logic and efficiency
execute as @a[tag=has_quartz,scores={mastery=50..}] run attribute @s minecraft:movement_speed base set 0.12
execute as @a[tag=has_quartz,scores={mastery=100..},predicate=gems:is_sneaking] run effect give @s haste 2 1 true
execute as @a[tag=has_quartz,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle electric_spark ~ ~1 ~ 0.5 0.5 0.5 0 3 force
execute as @a[tag=has_quartz,scores={mastery=150..}] run attribute @s minecraft:attack_speed base set 5.5

# 8. Prismarine (The Guardian) - Focus: Depth and pressure
execute as @a[tag=has_prismarine,scores={mastery=50..}] run effect give @s minecraft:water_breathing 1 0 true
execute as @a[tag=has_prismarine,scores={mastery=100..},predicate=gems:is_sneaking] run effect give @s minecraft:dolphins_grace 3 2 true
execute as @a[tag=has_prismarine,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle bubble_pop ~ ~1 ~ 0.5 0.5 0.5 0 1 force
execute as @a[tag=has_prismarine,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle bubble ~ ~1 ~ 0.5 0.5 0.5 0 1 force
execute as @a[tag=has_prismarine,scores={mastery=150..}] run effect give @s minecraft:conduit_power 1 0 true

# 9. Echo Shard (The Silent Scream) - Focus: Void walking
execute as @a[tag=has_echo,scores={mastery=50..}] run attribute @s minecraft:sneaking_speed base set 0.8
execute as @a[tag=has_echo,scores={mastery=100..},predicate=gems:is_sneaking] run effect give @s minecraft:invisibility 1 0
execute as @a[tag=has_echo,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle sculk_soul ~ ~1 ~ 0.5 0.5 0.5 0 1 force
execute as @a[tag=has_echo,scores={mastery=150..}] run attribute @s minecraft:movement_speed base set 0.13

# 10. Netherite (The Inevitable) - Focus: Resistance to all force
execute as @a[tag=has_netherite,scores={mastery=50..}] run attribute @s minecraft:knockback_resistance base set 0.5
execute as @a[tag=has_netherite,scores={mastery=100..},predicate=gems:is_sneaking] at @s run effect give @e[type=!item,type=!armor_stand,type=!area_effect_cloud,distance=0.1..3,tag=!has_netherite] minecraft:weakness 2 1 true
execute as @a[tag=has_netherite,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle smoke ~ ~1 ~ 0.5 0.5 0.5 0 5 force
execute as @a[tag=has_netherite,scores={mastery=150..}] run attribute @s minecraft:armor base set 6.0

# 11. Redstone (The Living Wire) - Focus: Kinetic energy and speed
# Replaced jump_strength with Saturation (The "Spark of Life" energy)
execute as @a[tag=has_redstone,scores={mastery=50..}] run effect give @s minecraft:speed 1 0 true
execute as @a[tag=has_redstone,scores={mastery=100..},predicate=gems:is_sneaking] run effect give @s saturation 1 0 true
execute as @a[tag=has_redstone,scores={mastery=100..},predicate=gems:is_sneaking] at @s run particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.5 0.5 0.5 0 2 force
execute as @a[tag=has_redstone,scores={mastery=150..}] run effect give @s minecraft:speed 1 1 true

#----------------------
#       CLEARANCE
#----------------------
# Diamond
execute as @a[tag=has_diamond,scores={player_health=..0}] at @s run tag @s remove stone_shell_active
execute as @a[tag=has_diamond,scores={player_health=..0}] at @s run tag @s remove diamond_immune
execute as @a[tag=has_diamond,scores={player_health=..0}] at @s run tag @s remove diamond_counter_ready
execute as @a[tag=has_diamond,scores={player_health=..0}] at @s run tag @s remove counter_immune
execute as @a[tag=has_diamond,scores={player_health=..0}] at @s run tag @s remove fortress_active
execute as @a[tag=has_diamond,scores={player_health=..0}] at @s run tag @s remove fortress_immune
execute as @a[tag=has_diamond,scores={player_health=..0}] at @s run tag @s remove mountain_user
execute as @a[tag=has_diamond,scores={player_health=..0}] at @s run tag @s remove immovable_mountain
# Emerald
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove immune_to_emerald10sforfewseconds
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove verdant_grasping
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove emerald_immune
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove vital_exchange_active
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove exchange_immune
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove bargain_active
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove bargain_immune
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove harvest_master
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove harvest_immune
execute as @a[tag=has_emerald,scores={player_health=..0}] at @s run tag @s remove emerald_harvest

# Amethyst
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove immune_to_ame10sforfewseconds
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove frequency_charged
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove amethyst_immune
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove seismic_sensing
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove seismic_immune
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove resonance_active
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove resonance_immune
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove resonance_master
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove sonic_immune
execute as @a[tag=has_amethyst,scores={player_health=..0}] at @s run tag @s remove resonant_collapse

# Lapis
execute as @a[tag=has_lapis,scores={player_health=..0}] at @s run tag @s remove arcane_rushing
execute as @a[tag=has_lapis,scores={player_health=..0}] at @s run tag @s remove lapis2_immune
execute as @a[tag=has_lapis,scores={player_health=..0}] at @s run tag @s remove arcane_charging
execute as @a[tag=has_lapis,scores={player_health=..0}] at @s run tag @s remove lapis_immune
execute as @a[tag=has_lapis,scores={player_health=..0}] at @s run tag @s remove cascade_active
execute as @a[tag=has_lapis,scores={player_health=..0}] at @s run tag @s remove cascade_immune
execute as @a[tag=has_lapis,scores={player_health=..0}] at @s run tag @s remove arcane_master
execute as @a[tag=has_lapis,scores={player_health=..0}] at @s run tag @s remove arcane_immune
execute as @a[tag=has_lapis,scores={player_health=..0}] at @s run tag @s remove arcane_dominion

# Ruby
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove immune_to_ruby10sforfewseconds
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove ember_heart_active
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove ruby2_immune
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove ruby_igniter
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove ruby_immune
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove phoenix_form
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove phoenix_immune
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove phoenix_master
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove phoenix_immune
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove has_rebirth
execute as @a[tag=has_ruby,scores={player_health=..0}] at @s run tag @s remove phoenix_protocol

# Amber
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove immune_to_amber10sforfewseconds
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove resin_binding
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove amber2_immune
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove trap_master
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove amber_immune
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove resin_tank
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove resin_immune
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove amber_master
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove time_immune
execute as @a[tag=has_amber,scores={player_health=..0}] at @s run tag @s remove fossilized_eternity

# Quartz
execute as @a[tag=has_quartz,scores={player_health=..0}] at @s run tag @s remove precision_charged
execute as @a[tag=has_quartz,scores={player_health=..0}] at @s run tag @s remove quartz2_immune
execute as @a[tag=has_quartz,scores={player_health=..0}] at @s run tag @s remove queue_active
execute as @a[tag=has_quartz,scores={player_health=..0}] at @s run tag @s remove quartz_immune
execute as @a[tag=has_quartz,scores={player_health=..0}] at @s run tag @s remove protocol_active
execute as @a[tag=has_quartz,scores={player_health=..0}] at @s run tag @s remove protocol_immune
execute as @a[tag=has_quartz,scores={player_health=..0}] at @s run tag @s remove overclock_master
execute as @a[tag=has_quartz,scores={player_health=..0}] at @s run tag @s remove overclock_immune
execute as @a[tag=has_quartz,scores={player_health=..0}] at @s run tag @s remove overclock_protocol

# Prismarine
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove immune_to_prisma10sforfewseconds
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove reprisal_stance
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove prismarine2_immune
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove guardian_focusing
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove prismarine_immune
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove debt_collector
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove debt_immune
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove abyssal_master
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove abyssal_immune
execute as @a[tag=has_prismarine,scores={player_health=..0}] at @s run tag @s remove abyssal_dominion

# Echo
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove immune_to_echo10sforfewseconds
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove void_stepping
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove echo2_immune
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove void_echoist
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove echo3_immune
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove silent_hunter
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove echo_immune
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove void_master
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove void_immune
execute as @a[tag=has_echo,scores={player_health=..0}] at @s run tag @s remove void_walker

# Netherite
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove immune_to_netherite10sforfewseconds
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove grasp_caster
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove crushing_grasper
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove netherite2_immune
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove anchor_point
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove netherite_immune
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove gravity_well
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove gravity4_immune
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove netherite_master
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove gravity_immune
execute as @a[tag=has_netherite,scores={player_health=..0}] at @s run tag @s remove the_inevitable

# Redstone
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove voltage_charging
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove redstone2_immune
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove circuit_caster
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove dead_circuit_active
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove redstone3_immune
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove overcharged
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove redstone4_immune
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove redstone_master
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove redstone_immune
execute as @a[tag=has_redstone,scores={player_health=..0}] at @s run tag @s remove redstone_overclock


# dev
execute as @a[tag=permanocd] at @s run scoreboard players set @s cd_10s 0
execute as @a[tag=permanocd] at @s run scoreboard players set @s cd_30s 0
execute as @a[tag=permanocd] at @s run scoreboard players set @s cd_90s 0
execute as @a[tag=permanocd] at @s run scoreboard players set @s cd_3m 0
execute as @a[tag=permanocd] at @s run scoreboard players set @s cd_10m 0






function gems:void_banish/tick
function gems:void_banish/return_tick
# Run this every tick to lock their respawn location
# 1. Target everyone (@a), then check if they are currently in the custom dimension.
# 2. If they are, run the spawnpoint command on them.
execute as @a[tag=void_banished] if dimension gems:void run spawnpoint @s[tag=void_banished] 0 75 0

execute in gems:void positioned 0 75 0 as @a[tag=void_banished,distance=..10] run effect give @s minecraft:slow_falling 10 0 true

# Optional: Force the 'World Spawn' of that dimension just in case
# Targets anyone in your dimension further than 700 blocks from 0 75 0
execute in gems:void as @a[x=0,y=75,z=0,distance=375..,tag=void_banished] run tp @s 0 75 0
