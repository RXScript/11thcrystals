# ==========================================
# BARGAIN ENDS - SUCCESS OR FAILURE?
# ==========================================

# CHECK SUCCESS CONDITION
# Success: 10+ hits
execute if score @s bargain_hits matches 10.. run function gems:emerald/bargain_success
execute if score @s bargain_hits matches ..9 run function gems:emerald/bargain_failure


# execute unless score @s bargain_hits matches 10.. run function gems:emerald/bargain_failure