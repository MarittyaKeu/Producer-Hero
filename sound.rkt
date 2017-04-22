#lang racket
(require rsound
         rsound/piano-tones)

(provide play-sound)
(provide play-and-record)
(provide playlist)
(provide reverse-playlist)
(provide q a z w s x e d c f t v r)


; sound keys
(define q (rs-read "Sounds/clap1.wav"))
(define a (rs-read "Sounds/clap2.wav"))
(define z (rs-read "Sounds/kick1.wav"))
(define w (rs-read "Sounds/kick2.wav"))
(define s (rs-read "Sounds/hi-hat1.wav"))
(define x (rs-read "Sounds/hi-hat2.wav"))
(define e (rs-read "Sounds/snare1.wav"))
(define d (rs-read "Sounds/cymbal1.wav"))
(define c (rs-read "Sounds/cymbal2.wav"))

;piano keys
(define f (piano-tone '30))
(define v (piano-tone '40))
(define t (piano-tone '50))
(define r (piano-tone '60))

(define (play-sound sound)
  (if(null? sound)
     "Error: Must play a valid RSound"
     (cond
       ((eq? sound "q") (play q))
       ((eq? sound "a") (play a))
       ((eq? sound "z") (play z))
       ((eq? sound "w") (play w))
       ((eq? sound "s") (play s))
       ((eq? sound "x") (play x))
       ((eq? sound "e") (play e))
       ((eq? sound "d") (play d))
       ((eq? sound "c") (play c))
       ((eq? sound "f") (play f))
       ((eq? sound "v") (play v))
       ((eq? sound "t") (play t))
       ((eq? sound "r") (play r))
       )))


;plays an rsound, records it, then replay the sound
(define (play-and-record sound)
  (play (rs-append* sound)
  (sleep .125)
  (play (record-sound (rs-frames (rs-append* sound)))) (sleep (/ 3 (length sound)))))
  
;plays a list of sounds from a list in reverse using foldr
(define (reverse-playlist sound)
  (playlist (foldr (lambda (x y) (append y (list x))) '() sound)))


(define stream (make-pstream))


;plays a stream of rsounds 
(define (playlist sound)
  (for ([i (length sound)])
  (pstream-play stream (list-ref sound i)) (sleep (/ 3 (length sound )))))

