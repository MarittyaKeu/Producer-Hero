#lang racket
(require rsound)
(provide play-sound)
(provide play-nonstop)
(provide play-and-record)
(provide playlist)
(provide q a z w s x e d c)

(define q (rs-read "/home/mike/Desktop/Producer-Hero-master/newsound/clap1.wav"))
(define a (rs-read "/home/mike/Desktop/Producer-Hero-master/newsound/clap2.wav"))
(define z (rs-read "/home/mike/Desktop/Producer-Hero-master/newsound/kick1.wav"))
(define w (rs-read "/home/mike/Desktop/Producer-Hero-master/newsound/kick2.wav"))
(define s (rs-read "/home/mike/Desktop/Producer-Hero-master/newsound/hi-hat1.wav"))
(define x (rs-read "/home/mike/Desktop/Producer-Hero-master/newsound/hi-hat2.wav"))
(define e (rs-read "/home/mike/Desktop/Producer-Hero-master/newsound/snare1.wav"))
(define d (rs-read "/home/mike/Desktop/Producer-Hero-master/newsound/cymbal1.wav"))
(define c (rs-read "/home/mike/Desktop/Producer-Hero-master/newsound/cymbal2.wav"))
 
;play a continuous sound
(define (play-nonstop sound)
  (define p (make-pstream)) ;creates a pstream
  (define len (rs-frames sound))
  (let loop ([t 0])
    (pstream-queue p sound (+ t 44100))
    (define next-t (+ t len))
    (sleep (* 1/44100 (- next-t (pstream-current-frame p))))
    (loop next-t)))

(define (play-sound sound)
  (if(null? sound)
     "Error: Must play a valid RSound"
     (cond
       ((eq? sound 'q) (play q))
       ((eq? sound 'a) (play a))
       ((eq? sound 'z) (play z))
       ((eq? sound 'w) (play w))
       ((eq? sound 's) (play s))
       ((eq? sound 'x) (play x))
       ((eq? sound 'e) (play e))
       ((eq? sound 'd) (play d))
       ((eq? sound 'c) (play c))
       )))


;plays an rsound, records it, then replay the sound
(define (play-and-record sound)
  (play (rs-append* sound))
  (sleep .125)
  (play (record-sound (rs-frames (rs-append* sound)))))


;plays a list of arbitruary sounds using dotted tail notation
(define (playlist sound)
  (play (rs-append* sound)))
