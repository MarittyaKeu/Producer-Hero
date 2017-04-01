#lang racket
(require 2htdp/universe 2htdp/image rsound)

; reads the musics
(define a (rs-read "/home/emmanuel/Desktop/Final-P/FP/sounds/Beethoven_5th_Symphony.wav"))
(define as (make-pstream))
; text
(define stop-text (text/font "Press [s] to help or [Space] to start!." 35 "red"
                             #f 'modern 'italic 'bold #f))
(define game-text (text/font "Press [Space] to start!." 35 "red"
                             #f 'modern 'italic 'bold #f))
(define key-p " ")
(define key-m "p")
  
; handle input
(define (handle-key n key)
  (cond
    ; open intro window
    [(key=? key "s") (intro 'true)]
    [(key=? key "up") (stop)]
    ; open game window2
    [(key-event? key-p) (game 'true)]
    [(key-event? key-m) (play a)]
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
  (underlay (overlay(beside
                (bitmap "pics/up.png")
                (bitmap "pics/left.png")
                (bitmap "pics/right.png")
                (bitmap "pics/down.png"))
                (bitmap "pics/music-back.jpg"))  stop-text))


; scene initialization
(big-bang 0
          (on-key handle-key)
(to-draw render))