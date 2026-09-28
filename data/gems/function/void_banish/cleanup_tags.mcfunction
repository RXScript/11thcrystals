# Remove void_banish_start tag from players who have been banished
# This runs after teleportation is complete

# Remove the start tag from players who have the void_banished tag
execute as @a[tag=void_banish_start,tag=void_banished] run tag @s remove void_banish_start

# Safety cleanup for any lingering active tags
execute as @a[tag=void_banish_start,tag=!void_banish_active] run tag @s remove void_banish_start