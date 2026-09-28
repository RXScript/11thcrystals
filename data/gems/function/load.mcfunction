scoreboard objectives add crystal_give_or_return_timer dummy

scoreboard objectives add clear_duplicate trigger
scoreboard objectives add view_mastery trigger

scoreboard objectives add player_health health
scoreboard objectives add temp_count dummy

scoreboard objectives add deaths deathCount

scoreboard objectives add gem_check dummy
scoreboard objectives add gem_kill_timer dummy
# Tracks when a player right-clicks

scoreboard objectives add gem_use dummy
scoreboard objectives add used_carrot minecraft.used:minecraft.carrot_on_a_stick

scoreboard objectives add timer dummy

# Tracks kills automatically
scoreboard objectives add player_kills playerKillCount
scoreboard objectives add wither_kills minecraft.killed:minecraft.wither
scoreboard objectives add warden_kills minecraft.killed:minecraft.warden
scoreboard objectives add dragon_kills minecraft.killed:minecraft.ender_dragon
# The universal Mastery bank
scoreboard objectives add mastery dummy

# NEW: Currently selected ability (1-5)
scoreboard objectives add diamond_ability dummy
scoreboard objectives add emerald_ability dummy
scoreboard objectives add amethyst_ability dummy
scoreboard objectives add lapis_ability dummy
scoreboard objectives add ruby_ability dummy
scoreboard objectives add amber_ability dummy
scoreboard objectives add quartz_ability dummy
scoreboard objectives add prismarine_ability dummy
scoreboard objectives add echo_ability dummy
scoreboard objectives add netherite_ability dummy
scoreboard objectives add redstone_ability dummy

# Set default ability to 1 for all players
scoreboard players set @a diamond_ability 1
scoreboard players set @a emerald_ability 1
scoreboard players set @a amethyst_ability 1
scoreboard players set @a lapis_ability 1
scoreboard players set @a ruby_ability 1
scoreboard players set @a amber_ability 1
scoreboard players set @a quartz_ability 1
scoreboard players set @a prismarine_ability 1
scoreboard players set @a echo_ability 1
scoreboard players set @a netherite_ability 1
scoreboard players set @a redstone_ability 1

# Tracks cooldowns (in ticks: 1s = 20 ticks)
scoreboard objectives add cd_10s dummy
scoreboard objectives add cd_30s dummy
scoreboard objectives add cd_90s dummy
scoreboard objectives add cd_3m dummy
scoreboard objectives add cd_10m dummy

tellraw @a {"text":"11th Crystals Datapack Loaded!","color":"green"}

# -------------------------------------
# THIS PART HERE IS THE ROULETTE SYSTEM
#--------------------------------------

scoreboard objectives add roulette_timer dummy
scoreboard objectives add crystal_roll dummy
scoreboard objectives add globalID dummy

scoreboard players set #five globalID 5
scoreboard players set #nine globalID 9

scoreboard players set #two globalID 2
scoreboard players set #three globalID 3
scoreboard players set #four globalID 4
scoreboard players set #six globalID 6
scoreboard players set #eleven globalID 11



# diamond ult stuff
scoreboard objectives add mountain_timer dummy
scoreboard objectives add absorbed_damage dummy
scoreboard objectives add final_damage dummy
scoreboard objectives add mountain_timer dummy
scoreboard objectives add mountain_angle dummy
scoreboard objectives add absorbed_damage dummy
scoreboard players set #360 mountain_angle 360
scoreboard players set #-1 mountain_angle -1




# amber ult stuff
scoreboard objectives add eternity_timer dummy
scoreboard objectives add amber_kills dummy
scoreboard objectives add fossil_timer dummy




# emerald ult stuff
scoreboard objectives add harvest_timer dummy
scoreboard objectives add life_stolen dummy
scoreboard objectives add harvest_kills dummy
scoreboard objectives add final_harvest dummy
scoreboard players set #10 const 10
scoreboard objectives add harvest_timer dummy
scoreboard objectives add harvest_angle dummy
scoreboard objectives add life_stolen dummy
scoreboard objectives add harvest_kills dummy
scoreboard objectives add final_harvest dummy
scoreboard players set #360 harvest_angle 360
scoreboard players set #10 const 10




# amethyst ult stuff
scoreboard objectives add resonance_timer dummy
scoreboard objectives add resonance_stacks dummy
scoreboard objectives add total_damage_dealt dummy
scoreboard objectives add resonance_kills dummy




# lapis ult stuff
scoreboard objectives add dominion_timer dummy
scoreboard objectives add arcane_drain dummy
scoreboard objectives add xp_stolen dummy
scoreboard objectives add dominion_kills dummy




# ruby ult stuff
scoreboard objectives add phoenix_timer dummy
scoreboard objectives add burn_stacks dummy
scoreboard objectives add burn_damage_dealt dummy
scoreboard objectives add phoenix_kills dummy
scoreboard objectives add rebirth_ready dummy



# quartz ult stuff
scoreboard objectives add overclock_timer dummy
scoreboard objectives add overclock_hits dummy
scoreboard objectives add rapid_damage_dealt dummy
scoreboard objectives add overclock_kills dummy



# prismarine ult stuff
scoreboard objectives add abyssal_timer dummy
scoreboard objectives add pressure_damage dummy
scoreboard objectives add damage_reflected dummy
scoreboard objectives add abyssal_kills dummy



# echo ult stuff
scoreboard objectives add void_timer dummy
scoreboard objectives add void_damage dummy
scoreboard objectives add total_void_damage dummy
scoreboard objectives add void_kills dummy



# netherite ult stuff
scoreboard objectives add inevitable_timer dummy
scoreboard objectives add gravity_damage dummy
scoreboard objectives add total_gravity_damage dummy
scoreboard objectives add inevitable_kills dummy



# redstone ult stuff
scoreboard objectives add overclock_timer dummy
scoreboard objectives add circuit_hits dummy
scoreboard objectives add total_circuit_damage dummy
scoreboard objectives add overclock_kills dummy










# diamond elite stuff
scoreboard objectives add fortress_timer dummy
scoreboard objectives add fortress_hits dummy
scoreboard objectives add damage_absorbed dummy
scoreboard objectives add fortress_x dummy
scoreboard objectives add fortress_y dummy
scoreboard objectives add fortress_z dummy



# emerald elite stuff
scoreboard objectives add bargain_timer dummy
scoreboard objectives add bargain_hits dummy
scoreboard objectives add bargain_target_count dummy
scoreboard objectives add life_steal_timer dummy



# amethyst elite stuff
scoreboard objectives add resonance4_timer dummy
scoreboard objectives add resonance4_stacks dummy
scoreboard objectives add rhythm_cooldown dummy
scoreboard objectives add rhythm_broken dummy
scoreboard objectives add resonance_target_count dummy



# lapis elite stuff
scoreboard objectives add cascade_timer dummy
scoreboard objectives add cascade_targets_hit dummy
scoreboard objectives add cascade_hit_by_player dummy
scoreboard objectives add cascade_failed dummy
scoreboard objectives add cascade_target_count dummy



# ruby elite stuff
scoreboard objectives add phoenix_form_timer dummy
scoreboard objectives add phoenix_stacks_elite dummy
scoreboard objectives add self_burn_damage dummy
scoreboard objectives add rebirth_ready_elite dummy
scoreboard objectives add immolation_target_count dummy
scoreboard players set #2 self_burn_damage 2



# amber elite stuff
scoreboard objectives add resin_timer dummy
scoreboard objectives add damage_stored dummy
scoreboard objectives add amber_weight_count dummy
scoreboard objectives add resin_source_count dummy
# scoreboard objectives add health_before dummy
# scoreboard objectives add health_current dummy
scoreboard players set #2 damage_stored 2
# scoreboard objectives add damage_taken_stat custom:damage_taken



# quartz elite stuff
scoreboard objectives add protocol_timer dummy
scoreboard objectives add targets_hit_elite dummy
scoreboard objectives add target_hit_status dummy
scoreboard objectives add protocol_failed dummy
scoreboard objectives add efficiency_target_total dummy



# prismarine elite stuff
scoreboard objectives add debt_timer dummy
scoreboard objectives add debt_collected dummy
scoreboard objectives add drowning_damage dummy
scoreboard objectives add debt_holder_count dummy



# echo elite stuff
scoreboard objectives add silent_hunt_timer dummy
scoreboard objectives add scream_fragments dummy
scoreboard objectives add silence_backlash dummy
scoreboard objectives add fragment_dropped dummy
scoreboard objectives add scream_target_count dummy



# netherite elite stuff
scoreboard objectives add gravity_timer dummy
scoreboard objectives add gravity_pulled dummy
scoreboard objectives add pulled_distance dummy
scoreboard objectives add gravity_target_count dummy



# redstone elite stuff
scoreboard objectives add overcharge_timer dummy
scoreboard objectives add discharge_hits dummy
scoreboard objectives add overload_damage dummy
scoreboard objectives add target_discharged dummy
scoreboard objectives add discharge_target_count dummy










# diamond advanced stuff
scoreboard objectives add counter_window dummy
scoreboard objectives add counter_triggered dummy



# emerald advanced stuff
scoreboard objectives add exchange_window dummy
scoreboard objectives add exchange_health dummy
scoreboard objectives add exchange_sacrificed dummy
scoreboard objectives add exchange_drained dummy
scoreboard players set #2 exchange_health 2
scoreboard players set #40 exchange_health 40
scoreboard players set #100 exchange_health 100



# amethyst advanced stuff
scoreboard objectives add seismic_timer dummy
scoreboard objectives add vibration_count dummy
scoreboard objectives add detonated dummy
scoreboard objectives add entity_last_x dummy
scoreboard objectives add entity_last_z dummy



# lapis advanced stuff
scoreboard objectives add arcane_charge_timer dummy
scoreboard objectives add arcane_power dummy
scoreboard objectives add overflow_released dummy



# ruby advanced stuff
scoreboard objectives add ignition_timer dummy
scoreboard objectives add sparks_ignited dummy
scoreboard objectives add spark_ignited dummy
scoreboard objectives add spark_total dummy
scoreboard objectives add fire_aspect_timer dummy



# amber advanced stuff
scoreboard objectives add trap_timer dummy
scoreboard objectives add trapped_count dummy
scoreboard objectives add trap_detonated dummy
scoreboard objectives add trap_x dummy
scoreboard objectives add trap_y dummy
scoreboard objectives add trap_z dummy



# quartz advanced stuff
scoreboard objectives add queue_timer dummy
scoreboard objectives add tasks_queued dummy
scoreboard objectives add queue_rng_value dummy



# prismarine advanced stuff
scoreboard objectives add focus_timer dummy
scoreboard objectives add focus_charge dummy
scoreboard objectives add focus_broken dummy
scoreboard objectives add focus_pos_x dummy
scoreboard objectives add focus_pos_y dummy
scoreboard objectives add focus_pos_z dummy



# echo advanced stuff
scoreboard objectives add echo_timer dummy
scoreboard objectives add echo_count dummy
scoreboard objectives add resonance_level dummy
scoreboard objectives add echo_detonated dummy
scoreboard objectives add echo_resonance dummy



# netherite advanced stuff
scoreboard objectives add anchor_timer dummy
scoreboard objectives add pulled_count dummy
scoreboard objectives add pulled_distance dummy
scoreboard objectives add anchor_x dummy
scoreboard objectives add anchor_y dummy
scoreboard objectives add anchor_z dummy



# redstone advanced stuff
scoreboard objectives add circuit_window dummy
scoreboard objectives add circuit_triggered dummy









# diamond tactical stuff
scoreboard objectives add shell_timer dummy
scoreboard objectives add shell_absorbed dummy



# emerald tactical stuff
scoreboard objectives add grasp_timer dummy
scoreboard objectives add grasp_healed dummy



# amethyst tactical stuff
scoreboard objectives add frequency_window dummy
scoreboard objectives add frequency_triggered dummy



# lapis tactical stuff
scoreboard objectives add rush_trail_timer dummy
scoreboard objectives add rush_start_x dummy
scoreboard objectives add rush_start_y dummy
scoreboard objectives add rush_start_z dummy
scoreboard objectives add trail_lifetime dummy



# ruby tactical stuff
scoreboard objectives add ember_timer dummy



# amber tactical stuff
scoreboard objectives add bind_timer dummy
scoreboard objectives add resin_duration dummy



# quartz tactical stuff
scoreboard objectives add precision_window dummy
scoreboard objectives add precision_used dummy
scoreboard objectives add precision_kill_timer dummy



# prismarine tactical stuff
scoreboard objectives add reprisal_window dummy
scoreboard objectives add reprisal_triggered dummy



# echo tactical stuff
scoreboard objectives add void2_timer dummy
scoreboard objectives add void_broken dummy



# netherite tactical stuff
scoreboard objectives add grasp_timer dummy
scoreboard objectives add grasp_phase dummy
scoreboard objectives add grasp_x dummy
scoreboard objectives add grasp_y dummy
scoreboard objectives add grasp_z dummy



# redstone tactical stuff
scoreboard objectives add voltage_phase dummy
scoreboard objectives add voltage_charge_timer dummy
scoreboard objectives add voltage_window dummy
scoreboard objectives add voltage_used dummy









# echo basic stuff
scoreboard objectives add voidphase_timer dummy






execute in gems:void run worldborder center 0 0
execute in gems:void run worldborder set 500
# Create scoreboard objectives
scoreboard objectives add void_banish_timer dummy
scoreboard objectives add void_puddle_timer dummy
scoreboard objectives add void_return_timer dummy
tag @a[tag=void_banished] remove void_banish