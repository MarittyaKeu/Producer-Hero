#lang racket
(require 2htdp/universe 2htdp/image rsound)

;
(define add1
   (let ((the-list '()))
      (lambda (new-item)
         (set! the-list
               (append the-list (list new-item)))
         the-list)))

;list to string conversion
(define (slist->string lst)
  (string-join (map ~a lst) ""))

; text
(define stop-text (text "Press [a] to play a randomly-chosen frequency. 
Press [p] to play Beethoven Symphony 5. Press [s] to stop." 16 "blue"))
;images
(define (swoosh image s)
        (cond
          [(zero? s) image]
          [else (swoosh
                 (overlay/align "center" "top"
                                 (square (* s 1/2) "solid" (color (random 256) (random 256) (random 256)))
                                ;(square (* s 1/2) "solid" "red")
                                (rotate 8 image))
                 (- s 1))]))
; scene drawing
(define (render y)
(underlay (rectangle 1000 600 "solid" "black") (overlay/align "center" "center"
                                                              (text (slist->string (add1 "")) 10 "silver")
                                                              (swoosh (circle 300 "solid" "black") 90)
                                                              ))) ;;add
  
; reads the musics
(define a (rs-read "/home/emmanuel/Desktop/Final-P/FP3/Beethoven_5th_Symphony.wav"))

; handle input
(define (handle-key n key)
  (cond   
    ; stop 
    [(key=? key "s") (add1 "s")]
    ; play the song
    [(key=? key "p") (add1 "p")]
    [else n]
    )
)

; handle input
(define (handle-key2 n key)
  (cond   
    ; stop 
    [(key=? key "s") (stop)]
    ; play the song
    [(key=? key "p") (play a)]
    [else n]
    )
)
; scene initialization
(big-bang 0
          (on-key handle-key2)
          (on-release handle-key)
(to-draw render))