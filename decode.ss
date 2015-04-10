;
; *********************************************
; Firas Sattar
; Spring 2014
; CS314 Principles of Programming Languages
; *********************************************
; 
;; -----------------------------------------------------
;; ENVIRONMENT
;; contains "ctv", "vtc",and "reduce" definitions
(load "include.ss")

;; contains a test document consisting of three paragraphs. 
(load "document.ss")

;; contains a test-dictionary, which has a much smaller dictionary for testing
;; the dictionary is needed for spell checking
;;(load "test-dictionary.ss")

(load "dictionary.ss") ;; the real thing with 45,000 words

;; -----------------------------------------------------
;; HELPER FUNCTIONS

;; returns a function to "spin" arg "letter" by "val"
(define spin
  (lambda (val)
    (lambda (letter)
      (vtc(modulo (+ val (ctv letter)) 26)))))

(define spin_to_e
  (lambda (pos)
    (+ (- 26 pos) 4)
    ))

;;counts how many of a target letter are in a word. (count_letter 'x) returns a func that counts x in a list. ((count_letter 'x) '(list)) counts x in list
(define count_letter
  (lambda (ltr)
    (lambda (lis)
      (if (null? lis)
          0
          (if (equal? (car lis) ltr)
              (+ 1 ((count_letter ltr) (cdr lis)))
              (+ 0 ((count_letter ltr) (cdr lis)))))
    )))

;;counts how many elements in a list == #t
(define count_true
  (lambda (l)
    (reduce + (map (lambda (x) (if (equal? x #t) 1 0)) l) 0) )) ;;HERE'S MY USE OF REDUCE. Count's how many #t's are in a list

(define containstrue?
  (lambda (l)
    (if (null? l)
        #f
        (if (equal? (car l) #t)
            #t
            (containstrue? (cdr l))))
    ))

(define (sortappend l piece) ;;adds one by one, putting element at the head if >= current head
    (if (null? l) (append '() l)
        (if (>= piece (car l))
            (cons piece l)
            (append l (list piece)))))

(define find_index ;;finds target element, returns its "index" from 0 26
  (lambda (l t)
    (if (null? l) 0
        (if (equal? t (car l))
            0
            (+ 1 (find_index (cdr l) t)) ))
    ))
        
 
;; *** CODE FOR ANY HELPER FUNCTION GOES HERE ***

;; -----------------------------------------------------
;; SPELL CHECKER FUNCTION

;;check a word's spell correctness
;;INPUT:a word(a global variable "dictionary" is included in the file "test-dictionary.ss", and can be used directly here)
;;OUTPUT:true(#t) or false(#f)
(define spell-checker 
  (lambda (w)
    (if (member w dictionary) #t #f)
    ;; DONE
   ))

;; -----------------------------------------------------
;; ENCODING FUNCTIONS

;;(define (multiplyBy n) (lambda (x) (* n x)))
;;((multiplyBy 5) 2)       ^^how to ret a function

;;generate an Caesar Cipher single word encoders
;;INPUT:a number "n"
;;OUTPUT:a function, whose input=a word, output=encoded word
(define encode-n
  (lambda (n);;"n" is the distance, eg. n=3: a->d,b->e,...z->c
    (lambda (w);;"w" is the word to be encoded
      (map (spin n) w) ;;performs helper func 'spin' on every letter in given word w
      )))

;;encode a document
;;INPUT: a document "d" and a "encoder"
;;OUTPUT: an encoded document using a provided encoder
(define encode-d;;this encoder is supposed to be the output of "encode-n"
  (lambda (d encoder)
    (if (null? d) '() ;;catches recursive base case, returns empty list
        (append (cons(map encoder (car d)) '()) (encode-d (cdr d) encoder) )) ;;encode first para, concat w/ recursive call on rest
    ))

;; -----------------------------------------------------
;; DECODE FUNCTION GENERATORS
;; 2 generators should be implemented, and each of them returns a decoder

;;generate a decoder using brute-force-version spell-checker
;;INPUT:an encoded paragraph "p"
;;OUTPUT:a decoder, whose input=a word, output=decoded word
(define Gen-Decoder-A
  (lambda (p)
    (define return_decoder
      (lambda (i)
        (encode-n i)
    ))
    
    (define valid_wordcounts
      (map count_true
          (list
            (map spell-checker (map (encode-n 0) p))
            (map spell-checker (map (encode-n 1) p))
            (map spell-checker (map (encode-n 2) p))
            (map spell-checker (map (encode-n 3) p))
            (map spell-checker (map (encode-n 4) p))
            (map spell-checker (map (encode-n 5) p))
            (map spell-checker (map (encode-n 6) p))
            (map spell-checker (map (encode-n 7) p))
            (map spell-checker (map (encode-n 8) p))
            (map spell-checker (map (encode-n 9) p))
            (map spell-checker (map (encode-n 10) p))
            (map spell-checker (map (encode-n 11) p))
            (map spell-checker (map (encode-n 12) p))
            (map spell-checker (map (encode-n 13) p))
            (map spell-checker (map (encode-n 14) p))
            (map spell-checker (map (encode-n 15) p))
            (map spell-checker (map (encode-n 16) p))
            (map spell-checker (map (encode-n 17) p))
            (map spell-checker (map (encode-n 18) p))
            (map spell-checker (map (encode-n 19) p))
            (map spell-checker (map (encode-n 20) p))
            (map spell-checker (map (encode-n 21) p))
            (map spell-checker (map (encode-n 22) p))
            (map spell-checker (map (encode-n 23) p))
            (map spell-checker (map (encode-n 24) p))
            (map spell-checker (map (encode-n 25) p)))))
      
    (return_decoder
     (find_index valid_wordcounts (apply max valid_wordcounts)))
    
     ))

;;generate a decoder using frequency analysis
;;INPUT:same as above ;;sample of a doc, so a para
;;OUTPUT:same as above
(define Gen-Decoder-B
  (lambda (p)
    (define return_decoder
      (lambda (i)
        (encode-n i)
    ))
    
    (define lettercounts
      (list
       (reduce + (map (count_letter 'a)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'b)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'c)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'd)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'e)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'f)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'g)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'h)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'i)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'j)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'k)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'l)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'm)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'n)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'o)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'p)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'q)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'r)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 's)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 't)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'u)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'v)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'w)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'x)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'y)(reduce append (list p) '())) 0)
       (reduce + (map (count_letter 'z)(reduce append (list p) '())) 0)))
    
     (return_decoder (spin_to_e (find_index lettercounts (apply max lettercounts))))
    ))

;; -----------------------------------------------------
;; CODE-BREAKER FUNCTION

;;a codebreaker
;;INPUT: an encoded document(of course by a Caesar's Cipher), a decoder(generated by functions above)
;;OUTPUT: a decoded document
(define Code-Breaker
  (lambda (d decoder)
    (if (null? d) '() ;;catches recursive base case, returns empty list
        (append (cons(map decoder (car d)) '()) (Code-Breaker (cdr d) decoder)) ) ;;encode first para, concat w/ recursive call on rest
     ))

;; -----------------------------------------------------
;; EXAMPLE APPLICATIONS OF FUNCTIONS
;;(spell-checker '(h e l l o))
;;(define add5 (encode-n 5))
;;(encode-d document add5)
;;(define decoderSP1 (Gen-Decoder-A paragraph))
;;(define decoderFA1 (Gen-Decoder-B paragraph))
;;(Code-Breaker document decoderSP1)
