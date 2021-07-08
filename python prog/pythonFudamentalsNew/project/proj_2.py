
"""
TM01- mini project
proj2

"""

CostPH = 0.51
CostPD = CostPH*24
CostPW = CostPD*7
CostPM = CostPW*4

days = 918/CostPD

print(" cost to operate one server per day is $",CostPD)
print(" cost to operate one server per week is $",CostPW)
print(" cost to operate one server per month is $",CostPM)
print(" using $918, the server may be operated for",int(days),"days.")
