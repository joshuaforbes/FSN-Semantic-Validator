# Fuzzy Set Notation Semantic Validator

## What Does It Do?
This program determines if a fuzzy set passed in is semantically valid.

## How?
By implementing a predicate (function in SWIProlog) named mu() that takes in a 
fuzzy set and determines if it is semantically correct by following some routine 
guidelines and leveraging Prolog's unification mechanism, as most Prolog 
programs do. 

## Guidelines?
The guidelines are better defined with some common structures in place before 
hand. Fuzzy Set Notation is best defined as a two tuple like so:

```
(domain, slist) 
```

Where domain is a single two tuple like so:

```
(DL, DH)
```

Where DL is the lower bound of the domain and DH is the upper bound of the
domain. 
slist can be defined as a set of two tuples like so:

```
[tuple_1, ... , tuple_n-1, tuple_n]
```

With each tuple consisting of an integer and a floating point value like so:

```
(Di, Vi)
```

Where Di is the integer value in the domain, and Vi is the floating point 
membership function value. With these structures in place the list of guidelines
below for semantic validity should be fairly straight forward.

1. input consists of a single two tuple where the first element is a two tuple 
and the second element is a list (slist) of two tuples.
2. the domain is a two tuple with the first integer being <= the second.
3. slist is a Prolog list of two tuples with each integer in each tuple being
within the defined domain.
4. slist is not empty, or slist has at least one element.
5. all floating point values in slist tuples are within the interval of 0 to 1 
inclusively.
6. The integer in the first tuple in slist is the lower bound of the defined
domain.
7. The integer of the last tuple in slist is the upper bound of the defined
domain.
8. The integers of the tuples in slist are consecutive.
  

## What Do I Need?
This version was developed using:
- Flex 2.5.39
- Bison 3.0.4

## How Do I Get It?
First you need to clone the repo. Once you do that run the following command:
```
make
```

## How Do I Use It?
Once you *make* the program you can run it using the following command:
```
./checker1
```
After you run the program it will halt for an input string. Once the input
string is entered, press enter, and the program will return the result.

## License Information
This software is licensed under the GNU GPL V3.0. The actual license can be
found in the file named LICENSE and online [HERE](https://www.gnu.org/licenses/gpl.html). 
The software is copyrighted by the owner of the repo and the statement of 
copyright is provided here as well.
> Copyright (C) 2017 Joshua Forbes

## Academic Misconduct Disclaimer
As of the date of this writing the code contained in this repo completes an
assignment given as part of the **CPSC/ECE 3520** class taught at Clemson 
University by [Dr. Robert J. Schalkoff](http://www.clemson.edu/cecas/departments/ece/faculty_staff/faculty/rschalkoff.html).
Viewing or copying this code or repo while currently enrolled in this course is
a violation of Clemson University's [Academic Integrity Policy](http://www.clemson.edu/studentaffairs/student-handbook/universitypolicies/academic_integrity.html).
If you choose to do so, you are doing so without the knowledge of the owner of
this repo and at your own risk. If you choose to do so you are doing so alone of 
your own accord and the owner of this repo carries no responsibility for your 
actions. You have been warned.  # FSN-Semantic-Validator
Implementation of a semantic validator for Fuzzy Set Notation using Prolog.
