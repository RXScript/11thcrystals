# ==========================================
# IGNITION ENDS - CHECK SUCCESS
# ==========================================

# Check if successful (6+ sparks ignited)
execute if score @s sparks_ignited matches 6.. run function gems:ruby/chain_explosion
execute if score @s sparks_ignited matches ..5 run function gems:ruby/spark_backfire