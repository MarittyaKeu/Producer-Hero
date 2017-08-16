# Procuer Hero

## Marittya Mike Keu
### April 30, 2017

# Overview
Our application, particularly my portion of the project was to use the RSound library and create procedures and global objects that can be used in our main source file. The main feature of my code is having one big list of RSound objects and symbols so that I can manipulate it.

The "big list" was created by my partner Emmanuel Rosario who created a procedure to generate that list called addstring-sound. It allows you to add an item to a list and appends a new list of item into a new list. Now, I can do work to the list.

**Authorship note:** All of the code described here was written by myself (and some by my partner).

# Libraries Used
The code uses two libraries:

```
(require RSound)
(require racket/string)
```

* The bulk of my code uses the ```RSound``` library which provides the ability to create global RSound objects where I can do the manipulations.
* Also, ```racket/string``` is used to allow us to append strings together.

# Key Code Excerpts
Here is a discussion of the most essential procedures, including a description of how they embody ideas from 
UMass Lowell's COMP.3010 Organization of Programming languages course.

## 1. Object Oriented Approach
I created a procedure that takes as a parameter an RSound object that can be accessed via message passing. This is done by using the ```rs-read``` function which takes two arguments. The first arguement is the objects' name, and the second argument accepts a path file name. Here are some examples...

```
(define (play-sound sound)
  (if(null? sound)
     "Error: Must play a valid RSound"
     (cond
       ((eq? sound "q") (play (rs-read "Sounds/clap1.wav")))
       ((eq? sound "a") (play (rs-read "Sounds/clap2.wav")))
       ((eq? sound "z") (play (rs-read "Sounds/kick1.wav")))
       ((eq? sound "w") (play (rs-read "Sounds/kick2.wav")))
       ((eq? sound "s") (play (rs-read "Sounds/hi-hat1.wav")))
       )))
```

## 2. High Order Function using foldr to play the RSound list backwords

Foldr was implemented in my reverse-playlist procedure.

It calls the ```playlist``` procedure that I created in the body and uses foldr to collapse the argument in reverse order.
The ```playlist``` procedure simply takes a list of RSound objects and iteratively (using a for loop) extract and plays the sound of each object using list-ref.

```
(define (playlist sound)
  (for ([i (length sound)])
  (play (list-ref sound i)) (sleep .5)))
```
Update 8/15/17
Another approach for HOF I could have used is creating playlist using map which is defined as so....
```
(define (playlist sound)
  (map (lambda (x) (play-sound x) (sleep .5)) sound))
```

Now we can use foldr to work on the list of RSound objects. For the procedure argument of foldr, I created a lambda function that takes two argument y (the list of original objects) and x (the list of new object) and append them together. The initial argument is simply an empty list or "'()" and the last argument is the list of RSound. The reverse-playlist procedure calls playlist and the foldr will play the playlist in reverse.

```
(define (reverse-playlist sound)
  (playlist (foldr (lambda (x y) (append y (list x))) '() sound)))
```



## 3. Local State Variable
We also implemented a local state variable that allowed us to have an object which has a time-varying state aka the set!. Although it wasn't a major part of our peoject, it was needed to help save new "beats" (a list of RSound objects) to a local path. We created a count variable so that we can append strings together and save to a new local path file rather than overwriting the old path file.

ex:
```
;the first time it saves the playlist it will be called 
save-playlist1.wav

;the second time
save-playlist2.wav
```
etc.

note: this function was worked on by both my partner and I.

```
(define count 0)

(define (save-sound sound)
  (begin (set! count (+ 1 count))
  (rs-write (rs-append* sound)
            (string-append* "Sounds/save-playlist/save-playlist" (number->string count) '(".wav" "")))))
```
As you can see, we created a procedure that lets you save your progress into a local file using RSounds ```rs-write``` function which takes an RSound as its' first argument and a string of a local path file as its' second argument. The ```string-append*``` function from the ```racket/string``` library allows us to append an arbitrary number of strings. We used the ```number->string``` to convert our count variable to string so we can save our progress to a new file rather than overwriting the same file.  
