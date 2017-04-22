 ### Producer Hero

 # Emmanuel Rosario

 # April 23, 2017

 ### Overview 
 			coming soon

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

### Higher Order Procedures
```racket
(define addstring-sound
   (let ((lst '()))
      (lambda (new->item)
         (set! lst (append lst (list new->item)))
         lst)))  
```
I used the 2hdtp/universe library, I created a function that would be added to the big bag on on-key which is a built in function. The way this function works is like the user use the keyboard, lets say the "s", in the cond statement it hits the key=? key "s". I have set up to save the string and rsounds to this list and then play rsounds as well. 

```racket
(string-join (map ~a (filter string? (remove-duplicates (addstring-sound " ")))) " ")
```
I filter the strings out of list, checked for duplicates and then converted the list to a string. Once I get the string, I can display then on the backgrounds using a text function from 2hdtp/image library. 

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
I use an image recursion function from the image.rkt, but I did a few changes and updates for the background.
