#lang racket
(require 2htdp/universe 2htdp/image rsound)


; reads the musics
(define a (rs-read "/home/emmanuel/Desktop/Final-P/FP/sounds/Beethoven_5th_Symphony.wav"))
(define as (make-pstream))

;;start

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
    [(key-event? key-d) (play a)]
    [(key-event? key-q) (play a)]
    [(key-event? key-w) (play a)]
    [(key-event? key-e) (play a)]
    [else n]
    )
)
;;end
;;
(define background1 (rectangle 1000 600 "solid" "black")) 
(define star1 (star-polygon 40 7 3 "outline" "darkred"))
(define ellipse1 (overlay (ellipse 20 20 "solid" "red")
           (ellipse 40 40 "solid" "black")
           (ellipse 60 60 "solid" "red")
           (ellipse 80 80 "solid" "black")
           (ellipse 100 100 "solid" "red")
           (ellipse 140 140 "solid" "black")
           (ellipse 180 180 "solid" "black")
           (ellipse 200 200 "solid" "red")
           (ellipse 240 240 "solid" "black")))
;;set game window
;;scene drawing
(define (render2 y)
  (stop)
(underlay background1 ;;add
            ellipse1)) ;;add
(define (game n)
  (if (eqv? n 'true)
      ; scene initialization
      (big-bang 0
                (on-key key-st)  ;add
                (to-draw render2))
      (error "error")))

;;scene intro

; text
(define help (text/font "Press [s] to help or [Space] to start!." 35 "red"
                             #f 'modern 'italic 'bold #f))
(define game-text (text/font "Press [Space] to start!." 35 "red"
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
