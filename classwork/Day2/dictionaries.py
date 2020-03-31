from random import randint, choice, seed
seed(1) #for different random nums
import re #for changing lines to words list

# my_file = open("/Users/macbookpro15/Desktop/MakeSchool/Term3/CS1.2/classwork/smaller_words.txt", "r") #needs to close file, but using with will automatically close it after
with open("/Users/macbookpro15/Desktop/MakeSchool/Term3/CS1.2/classwork/smaller_words.txt", "r") as my_file:
    lines = my_file.readlines()

    words = []
    randomIndex = randint(0, len(lines) - 1) #get random index from 0 - lines.count
    for line in lines: #loop through each line
        words = re.sub("[^\w]", " ",  line).split() #turns every word in line to an array of words
    my_file.close()

    words_histogram = {}
    for word in words:
        word_count = words_histogram.get(word, 0) + 1  #if word is in words_histogram's keys, count will increment, else equal 1
        words_histogram[word] = word_count
        # if words_histogram.get(word, "") != None: #if word is not in words_histogram's keys
        #     words_histogram[word] = 1
        #     print(f"{word} does not exist in the dic")
        # else:
        #     words_histogram[word] += 1
        #     print(f"{word} exist! and is now {words_histogram[word]}")
            
    print(words_histogram)
