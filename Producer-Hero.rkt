#lang racket
(require 2htdp/universe 2htdp/image rsound)
(require "sound.rkt")

; reads the musics
(define intro-sound (rs-read "Sounds/Beethoven_5th_Symphony.wav"))
(define as (make-pstream))

;define
(define lst '())
;add a string and sound to the list
(define addstring-sound 
  (lambda (new-item)
    (begin (set! lst (append lst (list new-item))))
    lst))    

; handle input and adds text to add->list to display onto screen 
; also add rsound objects into add-list1 to be used as arguements in other functions
(define (handle-rsound n key)
  (cond   
    ; play the song
    [(key=? key "q") (addstring-sound "q")(addstring-sound q)(play-sound "q")]
    [(key=? key "a") (addstring-sound "a")(addstring-sound a)(play-sound "a")]
    [(key=? key "z") (addstring-sound "z")(addstring-sound z)(play-sound "z")]
    [(key=? key "w") (addstring-sound "w")(addstring-sound w)(play-sound "w")]
    [(key=? key "s") (addstring-sound "s")(addstring-sound s)(play-sound "s")]
    [(key=? key "x") (addstring-sound "x")(addstring-sound x)(play-sound "x")]
    [(key=? key "e") (addstring-sound "e")(addstring-sound e)(play-sound "e")]
    [(key=? key "d") (addstring-sound "d")(addstring-sound d)(play-sound "d")]
    [(key=? key "c") (addstring-sound "c")(addstring-sound c)(play-sound "c")]
    [(key=? key "f") (addstring-sound "f")(addstring-sound f)(play-sound "f")]
    [(key=? key "t") (addstring-sound "t")(addstring-sound t)(play-sound "t")]
    [(key=? key "v") (addstring-sound "v")(addstring-sound v)(play-sound "v")]
    [(key=? key "r") (addstring-sound "r")(addstring-sound r)(play-sound "r")]
    [(key=? key "p") (addstring-sound "play and record")(play-and-record (filter rsound? (addstring-sound ding)))]
    [(key=? key "o") (addstring-sound "reverse playlist")(reverse-playlist (filter rsound? (addstring-sound ding)))]
    [(key=? key "l") (addstring-sound "playlist")(playlist (filter rsound? (addstring-sound ding)))]
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
                                        (text (string-join (map ~a (filter string? (remove-duplicates (addstring-sound " ")))) " ") 30 "yellow")
                                        (swoosh (circle 300 "solid" "black") 90))))
                                         
(define (game n)
  (if (eqv? n 'true)
      ; scene initialization
      (big-bang 0
                (on-key handle-rsound)
                (name "Producer Hero")
                (to-draw render2))
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
