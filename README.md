# Fuzzy Set Notation Semantic Validator

## What Does It Do?
This program determines if a fuzzy set passed in is semantically valid.

## How?
By implementing a predicate (function in SWI-Prolog) named mu() that takes in a 
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
membership function value. 

With these structures in place the list of guidelines
below for semantic validity should be fairly straight forward.

**
- input consists of a single two tuple where the first element is a two tuple and the second element is a list (slist) of two tuples.
- the domain is a two tuple with the first integer being <= the second.
- slist is a Prolog list of two tuples with each integer in each tuple beingwithin the defined domain.
- slist is not empty, or slist has at least one element.
- all floating point values in slist tuples are within the interval of 0 to 1 inclusively.
- The integer in the first tuple in slist is the lower bound of the defineddomain.
- The integer of the last tuple in slist is the upper bound of the defineddomain.
- The integers of the tuples in slist are consecutive.
**

## Woah! Wait a Minute, I See More Predicates Than mu(). What About Those?
Of course, and you're right! There are more predicates defined than mu(). These
other predicates are what make up mu(). They are the equivalent to helper
functions defined to make the solution more modular. Feel free to play with
them!

## What Do I Need?
This version was developed using:
- SWI-Prolog 6.6.6

## How Do I Get It?
Just clone the repo and the program is contained in the file named **_sde3.pro_**

## How Do I Use It?
First you have to run the command line interpreter for SWI-Prolog this can be
done on most unix/linux systems like so:
```
swipl
```
If you have a windows system there should be a command line interpreter that
came with the prolog installation. That you can launch.



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
