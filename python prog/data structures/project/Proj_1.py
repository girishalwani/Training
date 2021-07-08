"""
Data Structures
Project - 1

"""


dict={"Jeff":"is afraid of Dogs","David":"Plays the piano","Jason":"Can fly an aeroplane"}

print("original dictionary")
for k in dict:
    print(k,":",dict[k])

dict["Jeff"]="is afraid of heights"
dict["Jill"]="Can Hula Dance"

print("\nUpdated Dictionary")
for k in dict:
    print(k,":",dict[k])

