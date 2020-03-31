# [MOB1.3:](https://make-school-courses.github.io/MOB-1.3-Dynamic-iOS-Apps/#/) Classworks and Homeworks

## Table Of Contents:
| Class |     Date     |                 Topics                  |  
|:-----:|:------------:|:---------------------------------------:|
|  1  |  Mon, Mar 30   | [Closures and callbacks](#day1)                |  
|  2  |  Wed, Apr 1    | [Protocols & Delegation](#day2)               |
|  3  |  Mon, Apr 6    | [Communication patterns](#day3)               |  
|  4  |  Wed, Apr 8    | [Memory Management](#day4)                    |
|  5  |  Mon, Apr 13   | [JSON in iOS](#day5)                           |              
|  6  |  Wed, Apr 15   | [URLSession](#day6)     |
|  7  |  Mon, Apr 20   | [Requests with authentication](#day7)          |
|  8  |  Wed, Apr 22   | [Lab + Intro final project](#day8)                    |
|  9  |  Mon, Apr 27   | [Firebase](#day9)                              |
|  10 |  Wed, Apr 30   | [Building a networking layer Pt 1](#day10)      |       
|  11 |  Mon, May 4    | [Building a networking layer Pt 2](#day11)      |                  
|  12 |  Wed, May 6    | [Lab + Review](#day12)                            |                    
|  13 |  Mon, May 11   | [Final Exam](#day13)                              |                    
|  14 |  Wed, May 13   | [Presentations](#day14)                           |      
-  [Important References](#importantReferences)


---

<a name="day1"></a>
## Day 1. [Closures and callbacks](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson2/Lesson2.md)
### Topics
- **Closure** - which is **non escaping** by default, *will perform a task and wait* until that task is done, meanwhile, **escaping** closure *will perform a task (asynchronously) and not  wait* until that task is done, going back to the main thread, and allowing user interactions and stuff while the task is being completed.
- **[Higher order functions](https://medium.com/@Dougly/higher-order-functions-in-swift-sorted-map-filter-reduce-dff60b5b6adf)**
##### Sorted
- call sorted on an array it will return a new array that sorted in ascending order.
- elements in the array need to conform to the Comparable protocol.
    print("Sorted numbers: ", numbersToSort.sorted()) //ascending by default
    print("Sorted numbers: ", numbersToSort.sorted(by: >)) //descending
    print("Sorted by name: ", guestsToSort.sorted(){ $0.name < $1.name })
    print("Sorted by age: ", guestsToSort.sorted(){ $0.age < $1.age }) //sort by age ascending (youngest first)

##### Filter
- the filter method will return an array that has only elements that pass your filter specified in your closure.
    print("Minors: ", guestsToSort.filter{ $0.age < 18 }) //creates an array of guest from guests with age less than 18
    print("Even numbers: ", numbersToFilter.filter{ $0 % 2 == 0 }) //filter numbers to only have even numbers

##### Map
- iterates through the array that is calling it and changes each element of the array based on the closure passed to the method.
    print("Doubled values: ", numbersToDouble.map { $0 * 2 }) //doubles each values in numbersToDouble array
    print("Int as String: ", numbersToDouble.map { "\($0)" }) //map the numbersToDouble into strings

##### Reduce
- The reduce function allows you to combine all the elements in an array and return an object of any type (generics!!!!)
    let positiveNumbersSum = numbersToSum.reduce(0) { (result, num) -> Int in 
        return num > 0 ? result + num : result
    }
    print("Sum of positives: ", positiveNumbersSum)
    OR
    print("Sum of positives: ", numbersToSum.reduce(0) { return $1 > 0 ? $0 + $1 : $0 })
    print("Sum of positives: ", numbersToSum.filter{$0 > 0}.reduce(0, +)) //filter and reduce chaining: filter positive and sum
    
    ### CW
    - [Closures Review](https://github.com/SamuelFolledo/MOB1.3/tree/master/classwork/Day1/Closures%20Review.playground)

---

<a name="day2"></a>
## Day 2. [Protocols & Delegation](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson3/Lesson3.md)
### Topics

### CW: 

---

<a name="day3"></a>
## Day 3. [Communication patterns](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson4/Lesson4.md)
### Topics

### CW:

---

<a name="day4"></a>
## Day 4. [Memory Management](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson5/Lesson5.md)
### Topics

### CW: 

---

<a name="day5></a>
## Day 5. [JSON in iOS](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson6/Lesson6.md)
### Topics

### CW:

---

<a name="day6"></a>
## Day 6. [URLSession](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson7/Lesson7.md)
### Topics

### CW: 

---
<a name="day7"></a>
## Day 7. [Requests with authentication](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson8/Lesson8.md)
### Topics

### CW:

---

<a name="day8"></a>
## Day 8. [Lab + Intro final project]()
### Topics

### CW: 

---
<a name="day9"></a>
## Day 9. [Firebase](https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson10/Lesson10.md)
### Topics

### CW:

---

<a name="day10"></a>
## Day 10. []()
### Topics

### CW: 

---
<a name="day11"></a>
## Day 11. []()
### Topics

### CW:

---

<a name="day12"></a>
## Day 12. [](#day12)
### Topics

### CW: 

---
<a name="day13"></a>
## Day 13. [](#day13)
### Topics

### CW:

---

<a name="day14"></a>
## Day 14. [](#day14)
### Topics

### CW: 

---
















<a name="importantReferences"></a>
## Important References
- 

