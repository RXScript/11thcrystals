# Heal when damaging enemies (life drain on attack)
# This triggers when the harvester deals damage

# Small instant heal per hit
effect give @s instant_health 1 0 true
effect give @s absorption 5 0 true

# Visual feedback
particle heart ~ ~2 ~ 0.5 0.5 0.5 0.2 10 force
particle happy_villager ~ ~1 ~ 0.3 0.8 0.3 0.3 15 force

# Sound
execute at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 0.5 2