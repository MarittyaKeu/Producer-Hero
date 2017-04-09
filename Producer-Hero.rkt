#lang racket
(require 2htdp/universe 2htdp/image rsound)

; reads the musics
(define a (rs-read "/home/emmanuel/Desktop/Final-P/FP/sounds/Beethoven_5th_Symphony.wav"))
(define as (make-pstream))

;for next week, april 10
;;defines
(define key-a "a")
(define key-s "s")
(define key-d "d")
(define key-q "q")
(define key-w "w")
(define key-e "e")
(define key-p "p")
(define key-sp " ")

;;new key-st
(define (key-st n key)
  (cond
    [(key-event? key-a) (play a)]
    [(key-event? key-s) (stop)]
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
                                (circle (* s 1/2) "solid" "red")
                                (rotate 4 image))
                 (- s 1))]))


; set sounds scene
(define (render2 y)
  (stop)
(underlay background1 
             (swoosh (circle 300 "solid" "black")
              90))) ;;add
(define (game n)
  (if (eqv? n 'true)
      ; scene initialization
      (big-bang 0
                (on-key key-st)  ;add
                (to-draw render2))
      (error "error")))

; text
(define game-text (text/font "Press [Space] to start!" 35 "white"
                             #f 'modern 'italic 'bold #f))
; handle input
(define (handle-key n key)
  (cond
    ; open intro window
    [(key=? key "h") (intro 'true)]
    [(key=? key "up") (stop)]
    ; open game window2
    [(key-event? key-sp) (game 'true)]
    [(key-event? key-p) (play a)]
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
                (to-draw render1))
      (error "error")))

; set main scene
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
