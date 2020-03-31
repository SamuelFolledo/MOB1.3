from random import randint, choice, seed
seed(1) #for different random nums

my_file = open("/Users/macbookpro15/Desktop/MakeSchool/Term3/CS1.2/classwork/words.txt", "r")
lines = my_file.readlines()

randomIndex = randint(0, len(lines) - 1) #get random index from 0 - lines.count
for (line, index) in enumerate(lines):
    # print("LINE {line}")
    break
print(f"RANDOM LINE = {lines[randomIndex]}") #print random line from random index
print(f"RANDOM LINE from CHOICE = {choice(lines)}") #or build it choice function

my_file.close()
