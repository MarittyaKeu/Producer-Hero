 # Producer Hero

 ### Emmanuel Rosario

 ### April 23, 2017

 ### Overview 
The concept of our project is to create a mixer that music producers often use. We have used the RSound, 2htdp/Universe, and 2htdp/image libraries to use in our project. For this project, we made an application that use the keyboard to generate an RSound and the end user can channel their inner producer to create a beat. The application allows the user to record the beat they've generated and play it back.

I wrote all these code for the Prodecur-Hero.rkt except recursion function. Inside this file we can find the gui implementation, as well as the key event. I want to point out the filter rsound? Used it was Mike’s idea for us to use went retrieves rsounds from the list that I built and I used the rsound library to able to all play sounds provided it from Mike’s sound.rkt. I used basic implementation of the 2htdp/universe like the big-bang to draw all the scenes. I was able to use 2htdp/image to implement all backgrounds, to draw the last image and display the text as well. Also, on the racket web I learned more about how to use string in order for me to convert a list to string. 

Authorship note: All of the code described here was written by myself except recursion function.

### Libraries Used
The code uses two libraries:
```racket
(require 2hdtp/universe 2hdtp/image)
```
1) 2htdp/universe - [Racke Universe.rkt](https://docs.racket-lang.org/teachpack/2htdpuniverse.html)
2) 2htdp/image - [Racket Images.rkt](https://docs.racket-lang.org/teachpack/2htdpimage.html)

### Key Code Excerpts
Here is a discussion of the most essential procedures, including a description of how they embody ideas from UMass Lowell's COMP.3010 Organization of Programming languages course.

### Data Abstraction
```racket
;define an empty list
(define lst '())

;append items to list
(define addstring-sound 
  (lambda (new-item)
    (begin (set! lst (append lst (list new-item))))
    lst))  
```
I used the 2hdtp/universe library, I created a function that would be added to the big bag on on-key which is a built in function. The way this function works is like the user use the keyboard, lets say the "s", in the cond statement it hits the key=? key "s". I have set up the function to create a list of items to be extracted later and can be use to play rsounds as well displays strings. 

This is how we added things to addstring-sound list and played the rsounds.
```racket
; handle input, adds strings and rsounds to addstring-sound list 
; to be used as arguements in other functions.
(define (handle-rsound n key)
  (cond   
    ; play the song
    [(or (key=? key "q") (key=? key "Q")) (addstring-sound "q")(addstring-sound q)(play-sound "q")]
    [(or (key=? key "a") (key=? key "A")) (addstring-sound "a")(addstring-sound a)(play-sound "a")]
    [(or (key=? key "z") (key=? key "Z")) (addstring-sound "z")(addstring-sound z)(play-sound "z")]
    [(or (key=? key "w") (key=? key "W")) (addstring-sound "w")(addstring-sound w)(play-sound "w")]
    [(or (key=? key "s") (key=? key "S")) (addstring-sound "s")(addstring-sound s)(play-sound "s")]
    [(or (key=? key "x") (key=? key "X")) (addstring-sound "x")(addstring-sound x)(play-sound "x")]
    [(or (key=? key "e") (key=? key "E")) (addstring-sound "e")(addstring-sound e)(play-sound "e")]
    [(or (key=? key "d") (key=? key "D")) (addstring-sound "d")(addstring-sound d)(play-sound "d")]
    [(or (key=? key "c") (key=? key "C")) (addstring-sound "c")(addstring-sound c)(play-sound "c")]
    [(or (key=? key "f") (key=? key "F")) (addstring-sound "f")(addstring-sound f)(play-sound "f")]
    [(or (key=? key "t") (key=? key "T")) (addstring-sound "t")(addstring-sound t)(play-sound "t")]
    [(or (key=? key "v") (key=? key "V")) (addstring-sound "v")(addstring-sound v)(play-sound "v")]
    [(or (key=? key "r") (key=? key "R")) (addstring-sound "r")(addstring-sound r)(play-sound "r")]
    [(or (key=? key "p") (key=? key "P")) (addstring-sound "play and record")(play-and-record (filter rsound? (addstring-sound ding)))]
    [(or (key=? key "o") (key=? key "O")) (addstring-sound "reverse playlist")(reverse-playlist (filter rsound? (addstring-sound ding)))]
    [(or (key=? key "l") (key=? key "L")) (addstring-sound "playlist")(playlist (filter rsound? (addstring-sound ding)))]
    [(or (key=? key "m") (key=? key "M")) (addstring-sound "save-playlist")(save-sound (filter rsound? (addstring-sound ding)))]
    [else n]
    )
)
```
### Higher Order Procedures
```racket
(string-join (map ~a (filter string? (remove-duplicates (addstring-sound " ")))) " ")
```
I filter the strings out of list, checked for duplicates and then converted the list to a string. Once I get the string, I can display it on the background, using a text function from 2hdtp/image library. 

### Recursion
```racket
; 2.2.4 Recursive Image Functions
; This code can be found at "https://docs.racket-lang.org/teachpack/2htdpimage-guide.html"
; this is an update version of Recursive Image Functions
(define (swoosh image s)
        (cond
          [(zero? s) image]
          [else (swoosh
                 (overlay/align "center" "top"
                                (square (* s 1/2) "solid" (color (random 256) (random 256) (random 256)))
                                (rotate 8 image))
                  (- s 1))]))
```
I used an image recursion function from the [image.rkt](https://docs.racket-lang.org/teachpack/2htdpimage-guide.html#%28part._.Recursive_.Image_.Functions%29), but I did a few changes and updates for the background.
I added a square image instead of the circle. Also, insead of using the given color, I used a random function to change the color of each square. 
