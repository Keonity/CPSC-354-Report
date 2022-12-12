### Name: Keoni Lanoza
### Student ID: 2344852
### Student Email: lanoza@chapman.edu
### Class: CPSC 354 - 02
### Date Of Submission: 12/11/22

I believe that I have achieved all required tasks for this assignment. 

## PSEUDO CODE 
`insert (num) (list):
    pointer -> (head list)
    if (!list == NULL) do:
        [num, nil]
    else:
        while (!pointer > num) do:
            pointer -> (head (tail list))
        newNode -> [num, (tail list)]
        (head list) -> newNode`

`sort (list):
    if (!list == NULL) do:
        nil
    else if (!list of type [e,a']) do:
        insert e (sort (tail list))`

## HEAP DIAGRAMS
Here is the heap after using: print(insertC 1 (insertC 4 (insertC 2 (insertC 3 nil))));;

```
0 -> "NULL"
1 -> [3, <address 0>]
2 -> [2, <address 1>]
3 -> [4, <address 0>]
4 -> [3, <address 3>]
5 -> [2, <address 4>]
6 -> [1, <address 5>]
```

Here is the heap after using: print (sort (cons 3 (cons 5 (cons 6 (cons 2 nil)))));;
```
0 -> "NULL"
1 -> [2, <address 0>]
2 -> [6, <address 1>]
3 -> [5, <address 2>]
4 -> [3, <address 3>]
5 -> [2, <address 0>]
6 -> [6, <address 0>]
7 -> [2, <address 6>]
8 -> [5, <address 6>]
9 -> [2, <address 8>]
10 -> [3, <address 8>]
11 -> [2, <address 10>]
````

## KNOWN BUGS
At the time of writing, I cannot find any bugs in the functions. However, along the way, I did encounter much difficulty in making the functions. Bugs I frequently ran into were `non-exhaustive functions in lambda` and `non-exhaustive functions in function unify`. I believe these bugs were caused by me not accounting for all pattern matching cases in case statements and additionally, using the wrong functions for comparisons. I figured out that a lot of my difficulties were because I used `True` and `False` in my code instead of `true` and `false`. Similarly, I encountered issues for using `head` and `tail` in my code instead of `hd` and `tl`.

## INTERESTING OBSERVATIONS
I believe the most interesting observation I had during this assignment was the issue I mentioned above with the capitalized true and false and using head and tail in my code instead of hd and tl. It was interesting to me because the incorrect code still ran, which yielded a lot of confusion for me. I ended up using the REPL to figure out I was wrong, by entering code line by line into the REPL to try and figure out which lines went wrong. After realizing using head and hd to make comparisons in the REPL gave different results, I realized I was using the wrong version of hd and the wrong version of true and false.

Something else I found interesting was that I didn't need to use the new keyword at all in my implementation of insert and sort. My functions do call cons, however, so I'm not sure if my implementation is more memory-efficient or if a different one would be better. 
