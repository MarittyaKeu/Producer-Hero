#lang racket

(require 2htdp/universe 2htdp/image rsound)
(require "sound.rkt")

(define addstring
   (let ((lst '()))
      (lambda (new->item)
         (set! lst (append lst (list new->item)))
         lst)))

(addstring "b")
(addstring "c")
(addstring 1)
(addstring 2)
(addstring a)
(addstring q)

(display "String")
(filter string? (remove-duplicates(addstring "")))

(display "Number")
(filter number? (addstring ""))

(display "Sound")
(filter rsound? (addstring ding))