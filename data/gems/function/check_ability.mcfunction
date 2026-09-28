# ==========================================
# DIAMOND
# ==========================================
# CYCLE: Sneak + Right Click
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"diamond"}] if entity @s[predicate=gems:is_sneaking] run function gems:diamond/cycle_ability

# USE: Right Click (not sneaking)
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"diamond"}] if entity @s[predicate=!gems:is_sneaking,scores={diamond_ability=1}] run function gems:diamond/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"diamond"}] if entity @s[predicate=!gems:is_sneaking,scores={diamond_ability=2,mastery=50..}] run function gems:diamond/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"diamond"}] if entity @s[predicate=!gems:is_sneaking,scores={diamond_ability=3,mastery=150..}] run function gems:diamond/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"diamond"}] if entity @s[predicate=!gems:is_sneaking,scores={diamond_ability=4,mastery=300..}] run function gems:diamond/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"diamond"}] if entity @s[predicate=!gems:is_sneaking,scores={diamond_ability=5,mastery=500..}] run function gems:diamond/ability_5

# ==========================================
# EMERALD
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"emerald"}] if entity @s[predicate=gems:is_sneaking] run function gems:emerald/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"emerald"}] if entity @s[predicate=!gems:is_sneaking,scores={emerald_ability=1}] run function gems:emerald/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"emerald"}] if entity @s[predicate=!gems:is_sneaking,scores={emerald_ability=2,mastery=50..}] run function gems:emerald/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"emerald"}] if entity @s[predicate=!gems:is_sneaking,scores={emerald_ability=3,mastery=150..}] run function gems:emerald/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"emerald"}] if entity @s[predicate=!gems:is_sneaking,scores={emerald_ability=4,mastery=300..}] run function gems:emerald/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"emerald"}] if entity @s[predicate=!gems:is_sneaking,scores={emerald_ability=5,mastery=500..}] run function gems:emerald/ability_5

# ==========================================
# AMETHYST
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amethyst"}] if entity @s[predicate=gems:is_sneaking] run function gems:amethyst/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amethyst"}] if entity @s[predicate=!gems:is_sneaking,scores={amethyst_ability=1}] run function gems:amethyst/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amethyst"}] if entity @s[predicate=!gems:is_sneaking,scores={amethyst_ability=2,mastery=50..}] run function gems:amethyst/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amethyst"}] if entity @s[predicate=!gems:is_sneaking,scores={amethyst_ability=3,mastery=150..}] run function gems:amethyst/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amethyst"}] if entity @s[predicate=!gems:is_sneaking,scores={amethyst_ability=4,mastery=300..}] run function gems:amethyst/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amethyst"}] if entity @s[predicate=!gems:is_sneaking,scores={amethyst_ability=5,mastery=500..}] run function gems:amethyst/ability_5

# ==========================================
# LAPIS
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"lapis"}] if entity @s[predicate=gems:is_sneaking] run function gems:lapis/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"lapis"}] if entity @s[predicate=!gems:is_sneaking,scores={lapis_ability=1}] run function gems:lapis/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"lapis"}] if entity @s[predicate=!gems:is_sneaking,scores={lapis_ability=2,mastery=50..}] run function gems:lapis/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"lapis"}] if entity @s[predicate=!gems:is_sneaking,scores={lapis_ability=3,mastery=150..}] run function gems:lapis/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"lapis"}] if entity @s[predicate=!gems:is_sneaking,scores={lapis_ability=4,mastery=300..}] run function gems:lapis/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"lapis"}] if entity @s[predicate=!gems:is_sneaking,scores={lapis_ability=5,mastery=500..}] run function gems:lapis/ability_5

# ==========================================
# RUBY
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"ruby"}] if entity @s[predicate=gems:is_sneaking] run function gems:ruby/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"ruby"}] if entity @s[predicate=!gems:is_sneaking,scores={ruby_ability=1}] run function gems:ruby/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"ruby"}] if entity @s[predicate=!gems:is_sneaking,scores={ruby_ability=2,mastery=50..}] run function gems:ruby/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"ruby"}] if entity @s[predicate=!gems:is_sneaking,scores={ruby_ability=3,mastery=150..}] run function gems:ruby/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"ruby"}] if entity @s[predicate=!gems:is_sneaking,scores={ruby_ability=4,mastery=300..}] run function gems:ruby/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"ruby"}] if entity @s[predicate=!gems:is_sneaking,scores={ruby_ability=5,mastery=500..}] run function gems:ruby/ability_5

# ==========================================
# AMBER
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amber"}] if entity @s[predicate=gems:is_sneaking] run function gems:amber/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amber"}] if entity @s[predicate=!gems:is_sneaking,scores={amber_ability=1}] run function gems:amber/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amber"}] if entity @s[predicate=!gems:is_sneaking,scores={amber_ability=2,mastery=50..}] run function gems:amber/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amber"}] if entity @s[predicate=!gems:is_sneaking,scores={amber_ability=3,mastery=150..}] run function gems:amber/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amber"}] if entity @s[predicate=!gems:is_sneaking,scores={amber_ability=4,mastery=300..}] run function gems:amber/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"amber"}] if entity @s[predicate=!gems:is_sneaking,scores={amber_ability=5,mastery=500..}] run function gems:amber/ability_5

# ==========================================
# QUARTZ
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"quartz"}] if entity @s[predicate=gems:is_sneaking] run function gems:quartz/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"quartz"}] if entity @s[predicate=!gems:is_sneaking,scores={quartz_ability=1}] run function gems:quartz/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"quartz"}] if entity @s[predicate=!gems:is_sneaking,scores={quartz_ability=2,mastery=50..}] run function gems:quartz/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"quartz"}] if entity @s[predicate=!gems:is_sneaking,scores={quartz_ability=3,mastery=150..}] run function gems:quartz/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"quartz"}] if entity @s[predicate=!gems:is_sneaking,scores={quartz_ability=4,mastery=300..}] run function gems:quartz/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"quartz"}] if entity @s[predicate=!gems:is_sneaking,scores={quartz_ability=5,mastery=500..}] run function gems:quartz/ability_5

# ==========================================
# PRISMARINE
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"prismarine"}] if entity @s[predicate=gems:is_sneaking] run function gems:prismarine/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"prismarine"}] if entity @s[predicate=!gems:is_sneaking,scores={prismarine_ability=1}] run function gems:prismarine/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"prismarine"}] if entity @s[predicate=!gems:is_sneaking,scores={prismarine_ability=2,mastery=50..}] run function gems:prismarine/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"prismarine"}] if entity @s[predicate=!gems:is_sneaking,scores={prismarine_ability=3,mastery=150..}] run function gems:prismarine/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"prismarine"}] if entity @s[predicate=!gems:is_sneaking,scores={prismarine_ability=4,mastery=300..}] run function gems:prismarine/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"prismarine"}] if entity @s[predicate=!gems:is_sneaking,scores={prismarine_ability=5,mastery=500..}] run function gems:prismarine/ability_5

# ==========================================
# ECHO SHARD
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"echo_shard"}] if entity @s[predicate=gems:is_sneaking] run function gems:echo/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"echo_shard"}] if entity @s[predicate=!gems:is_sneaking,scores={echo_ability=1}] run function gems:echo/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"echo_shard"}] if entity @s[predicate=!gems:is_sneaking,scores={echo_ability=2,mastery=50..}] run function gems:echo/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"echo_shard"}] if entity @s[predicate=!gems:is_sneaking,scores={echo_ability=3,mastery=150..}] run function gems:echo/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"echo_shard"}] if entity @s[predicate=!gems:is_sneaking,scores={echo_ability=4,mastery=300..}] run function gems:echo/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"echo_shard"}] if entity @s[predicate=!gems:is_sneaking,scores={echo_ability=5,mastery=500..}] run function gems:echo/ability_5

# ==========================================
# NETHERITE
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"netherite"}] if entity @s[predicate=gems:is_sneaking] run function gems:netherite/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"netherite"}] if entity @s[predicate=!gems:is_sneaking,scores={netherite_ability=1}] run function gems:netherite/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"netherite"}] if entity @s[predicate=!gems:is_sneaking,scores={netherite_ability=2,mastery=50..}] run function gems:netherite/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"netherite"}] if entity @s[predicate=!gems:is_sneaking,scores={netherite_ability=3,mastery=150..}] run function gems:netherite/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"netherite"}] if entity @s[predicate=!gems:is_sneaking,scores={netherite_ability=4,mastery=300..}] run function gems:netherite/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"netherite"}] if entity @s[predicate=!gems:is_sneaking,scores={netherite_ability=5,mastery=500..}] run function gems:netherite/ability_5

# ==========================================
# REDSTONE
# ==========================================
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"redstone"}] if entity @s[predicate=gems:is_sneaking] run function gems:redstone/cycle_ability

execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"redstone"}] if entity @s[predicate=!gems:is_sneaking,scores={redstone_ability=1}] run function gems:redstone/ability_1
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"redstone"}] if entity @s[predicate=!gems:is_sneaking,scores={redstone_ability=2,mastery=50..}] run function gems:redstone/ability_2
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"redstone"}] if entity @s[predicate=!gems:is_sneaking,scores={redstone_ability=3,mastery=150..}] run function gems:redstone/ability_3
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"redstone"}] if entity @s[predicate=!gems:is_sneaking,scores={redstone_ability=4,mastery=300..}] run function gems:redstone/ability_4
execute if items entity @s weapon.mainhand carrot_on_a_stick[custom_data~{gem:"redstone"}] if entity @s[predicate=!gems:is_sneaking,scores={redstone_ability=5,mastery=500..}] run function gems:redstone/ability_5
