#lang racket
(require 2htdp/universe 2htdp/image rsound)
(require "sound.rkt")
; reads the musics
(define intro-sound (rs-read "/home/emmanuel/Desktop/Final-P/FP/sounds/Beethoven_5th_Symphony.wav"))
(define as (make-pstream))

;add to the list
(define add->list
   (let ((lst '()))
      (lambda (new->item)
         (set! lst (append lst (list new->item)))
         lst)))
         
;add to the list
(define add->list1
   (let ((lst '()))
      (lambda (new->item)
         (set! lst (append lst (list new->item)))
         lst)))
         
;list to string conversion
(define (list->string lst)
  (string-join (map ~a lst) ""))

; handle input and adds text to add->list to display onto screen 
;also add rsound objects into add-list1 to be used as arguements in other functions
(define (handle-rsound n key)
  (cond   
    ; stop 
    ;[(key=? key "s") (add->list "s")]
    ; play the song
    [(key=? key "q") (add->list "q")(add->list1 q)]
    [(key=? key "a") (add->list "a")(add->list1 a)]
    [(key=? key "z") (add->list "z")(add->list1 z)]
    [(key=? key "w") (add->list "w")(add->list1 w)]
    [(key=? key "s") (add->list "s")(add->list1 s)]
    [(key=? key "x") (add->list "x")(add->list1 x)]
    [(key=? key "e") (add->list "e")(add->list1 e)]
    [(key=? key "d") (add->list "d")(add->list1 d)]
    [(key=? key "c") (add->list "c")(add->list1 c)]
    [else n]
    )
)

; handle input 
(define (handle-rsound2 n key)
  (cond   
    ; stop 
    [(key=? key " ") (stop)]
    ; play the song
    [(key=? key "q") (play-sound "q")]
    [(key=? key "a") (play-sound "a")]
    [(key=? key "z") (play-sound "z")]
    [(key=? key "w") (play-sound "w")]
    [(key=? key "s") (play-sound "s")]
    [(key=? key "x") (play-sound "x")]
    [(key=? key "e") (play-sound "e")]
    [(key=? key "d") (play-sound "d")]
    [(key=? key "c") (play-sound "c")]
    [(key=? key "r") (play-and-record (add->list1 ding))]
    [else n]
    )
)

; set the last scene background
(define background1 (rectangle 1000 600 "solid" "black")) 

; 2.2.4 Recursive Image Functions
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

; set sounds scene
(define (render2 y)
  (underlay background1  (overlay/align "center" "center"
                                        (text (list->string (remove-duplicates (add->list ""))) 30 "yellow")
                                        (swoosh (circle 300 "solid" "black") 90)
                                        ))) 

(define playing #f)
(define (game n)
  (if (eqv? n 'true)
      ; scene initialization
      (begin (set! playing #t)(big-bang 0
                                        (on-key handle-rsound2)
                                        (on-release handle-rsound)
                                        (name "Hero")
                                        (to-draw render2)))
      (error "error")))

;(define (stop? world)
;  (= world 400))

; text
(define game-text (text/font "Press [Space] to start!" 35 "white"
                             #f 'modern 'italic 'bold #f))
; handle input
(define (handle-key n key)
  (cond
    ; open intro window
    [(key=? key "h") (intro 'true)]
    ; open game window2
    [(key=? key " ") (game 'true)]
    [else n]
    )
)

; set intro window
(define (render1 y)
  (stop)
  (underlay/xy (bitmap "pics/helpmenu.png") 20 100 game-text))

(define (intro n)
  (if (eqv? n 'true)
      ; scene initialization
      (big-bang 0
                (on-key handle-key)
                (name "Help")
                (to-draw render1))
      (error "error")))

; set main scene
(define (render y)
  (pstream-play as intro-sound)
  (underlay  (bitmap "pics/studio.png")  (above
                                          ;(text (number->string (add1 y)) 36 "silver")
                                          (text/font "Producer Hero" 60 "yellow"
                                                #f 'modern 'italic 'bold #f)
                                          (text/font "Press [Space] to start or Press [h] to help." 35 "yellow"
                                              #f 'modern 'italic 'bold #f))))
;(define (my-tick n) (add1 n))
;(define (stop1? key)
;  (= key 100))
; scene initialization
(big-bang 0
          ;(on-tick my-tick 1)
          (on-key handle-key)
          ;(stop-when stop1?)
          ;(close-on-stop #t)
          (name "Main") ; title
          (to-draw render))
