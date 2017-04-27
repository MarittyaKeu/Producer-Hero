 # Producer Hero

 ### Emmanuel Rosario

 ### April 23, 2017

 ### Overview 
The concept of our project is to create a mixer that music producers often use. We have used the RSound, 2htdp/Universe, and 2htdp/image libraries to use in our project. For this project, we made an application that use the keyboard to generate an RSound and the end user can channel their inner producer to create a beat. The application allows the user to record the beat they've generated and play it back.

Authorship note: All of the code described here was written by myself except recursion function.

### Libraries Used
The code uses two libraries:
```racket
(require 2hdtp/universe 2hdtp/image)
```
1) 2htdp/universe - [Racke Universe.rkt](https://docs.racket-lang.org/teachpack/2htdpuniverse.html)
2) 2htdp/image - [Racket Images.rkt](https://docs.racket-lang.org/teachpack/2htdpimage.html)

### Key Code Excerpts
All approaches from class 

### Data Abstraction
```racket
;define
(define lst '())
;add a string and sound to the list
(define addstring-sound 
  (lambda (new-item)
    (begin (set! lst (append lst (list new-item))))
    lst))  
```
I used the 2hdtp/universe library, I created a function that would be added to the big bag on on-key which is a built in function. The way this function works is like the user use the keyboard, lets say the "s", in the cond statement it hits the key=? key "s". I have set up the function to create a list of items to be extracted later and can be use to play rsounds as well displays strings. 

### Higher Order Procedures
```racket
(string-join (map ~a (filter string? (remove-duplicates (addstring-sound " ")))) " ")
```
I filter the strings out of list, checked for duplicates and then converted the list to a string. Once I get the string, I can display it on the background, using a text function from 2hdtp/image library. 

### Recursion
```racket
; This code can be found at "https://docs.racket-lang.org/teachpack/2htdpimage-guide.html"
; this is a Recursive Image Functions
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
