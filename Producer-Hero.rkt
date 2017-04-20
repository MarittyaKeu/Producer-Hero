#lang racket
(require 2htdp/universe 2htdp/image rsound)
(require "sound.rkt")
; reads the musics
(define intro-sound (rs-read "Sounds/Beethoven_5th_Symphony.wav"))
(define as (make-pstream))

;add to the list
(define add->list
   (let ((lst '()))
      (lambda (new->item)
         (set! lst (append lst (list new->item)))
         lst)))q
         
;add to the list
(define add->list1
   (let ((lst '()))
      (lambda (new->item)
         (set! lst (append lst (list new->item)))
         lst)))        

(define playing #f)
; handle input and adds text to add->list to display onto screen 
;also add rsound objects into add-list1 to be used as arguements in other functions
(define (handle-rsound n key)
  (cond   
    ; play the song
    [(key=? key "q") (add->list "q")(add->list1 q)(play-sound "q")]
    [(key=? key "a") (add->list "a")(add->list1 a)(play-sound "a")]
    [(key=? key "z") (add->list "z")(add->list1 z)(play-sound "z")]
    [(key=? key "w") (add->list "w")(add->list1 w)(play-sound "w")]
    [(key=? key "s") (add->list "s")(add->list1 s)(play-sound "s")]
    [(key=? key "x") (add->list "x")(add->list1 x)(play-sound "x")]
    [(key=? key "e") (add->list "e")(add->list1 e)(play-sound "e")]
    [(key=? key "d") (add->list "d")(add->list1 d)(play-sound "d")]
    [(key=? key "c") (add->list "c")(add->list1 c)(play-sound "c")]
    [(key=? key "r") (add->list "play and record")(play-and-record (add->list1 ding))]
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
                                        (text (string-join(map ~a (remove-duplicates (add->list ""))) "") 30 "yellow")
                                        (swoosh (circle 300 "solid" "black") 90)
                                        )))
                                         
(define (game n)
  (if (eqv? n 'true)
      ; scene initialization
      (begin (set! playing #t)(big-bang 0
                                        (on-key handle-rsound)
                                        (name "Hero")
                                        (to-draw render2)))
      (error "error")))


; text
(define game-text (text/font "Press [Space] to start!" 35 "white"
                             #f 'modern 'italic 'bold #f))
; help handle
(define (handle-key2 n key)
  (cond
    ; open game window2
    [(key=? key " ") (game 'true)]
    [else n]
    )
)

; set intro window
(define (render1 y)
  (stop)
  (underlay/xy (bitmap "Pics/helpmenu.png") 20 100 game-text))

(define (intro n)
  (if (eqv? n 'true)
      ; scene initialization
      (big-bang 0
                (on-key handle-key2)
                (name "Help")
                (to-draw render1))
      (error "error")))

; set main scene
(define (render y)
  (pstream-play as intro-sound)
  (underlay  (bitmap "Pics/studio.png")  (above
                                          ;(text (number->string (add1 y)) 36 "silver")
                                          (text/font "Producer Hero" 60 "yellow"
                                                #f 'modern 'italic 'bold #f)
                                          (text/font "Press [h] to help." 35 "yellow"
                                              #f 'modern 'italic 'bold #f))))
; main scene handle                                             
(define (handle-key n key)
  (cond
    ; open intro window
    [(key=? key "h") (intro 'true)]
    [else n]
    )
)
; scene initialization
(big-bang 0
          (on-key handle-key)
          (name "Main")
          (to-draw render))
