"""
Create a two list with months and weekdays,
Merge months with weekdays at the end.
"""

month =["january","february","march","april","may","june","july","august","september","october","november","december"]
weekdays = ["monday","tuesday","wednesday","thursday","friday","saturday","sunday"]

month.extend(weekdays)

print(month)
