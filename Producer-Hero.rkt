#lang racket
(require 2htdp/universe 2htdp/image rsound)

; reads the wav file
(define a (rs-read "/home/emmanuel/Desktop/Final-P/FP/sounds/Beethoven_5th_Symphony.wav"))
(define as (make-pstream))
; text
(define stop-text (text/font "Press [s] to help or [Space] to start!." 35 "red"
                             #f 'modern 'italic 'bold #f))
(define game-text (text/font "Press [Space] to start!." 35 "red"
                             #f 'modern 'italic 'bold #f))
;;(define key-s " ")
(define key-p "p")
  
; handle input
(define (handle-key n key)
  (cond
    ; open intro window
    [(key=? key "h") (intro 'true)]
    [(key=? key "up") (stop)]
    ; open game window2
    [(key-event? " ") (game 'true)]
    [(key-event? key-p) (play a)]
    [else n]
    )
)

;;set game window
; scene drawing
(define (render2 y)
  (stop)
  (underlay (bitmap "pics/music-back2.jpg")  game-text))

(define (game n)
  (if (eqv? n 'true)
      ; scene initialization
      (big-bang 0
                (on-key handle-key)
                (to-draw render2))
      (error "error")))

;;set intro window
; scene drawing
(define (render1 y)
  (stop)
  (underlay (bitmap "pics/music-back1.jpg")  game-text))

(define (intro n)
  (if (eqv? n 'true)
      ; scene initialization
      (big-bang 0
                (on-key handle-key)
                (to-draw render1))
      (error "error")))

; window1
; scene drawing
(define (render y)
  (pstream-play as a)
   (underlay  (bitmap "pics/studio.png")  (above
                                     (text/font "Producer Hero" 60 "yellow"
                                                #f 'modern 'italic 'bold #f)
                                     (text/font "Press [Space] to start or Press [h] to help." 35 "yellow"
                                                #f 'modern 'italic 'bold #f))))

; scene initialization
(big-bang 0
          (on-key handle-key)
(to-draw render))
