; *********************************************
; *  314 Principles of Programming Languages  *
; *  Spring 2014                              *
; *  Author: Liu Liu                          *
; *          Ulrich Kremer                    *
; *  April 5, 2014                            *
; *********************************************
;; -----------------------------------------------------

(define test-document '(
                        ((h e l l o));;paragraph1
                        ((t h i s)(i s)(t e s t));;paragraph2
                        ))


(define document '(
                   ((t h i s)(c o u r s e)(c o v e r s)(t o p i c s)(i n)(p r o g r a m m i n g)(l a n g u a g e s)(a n d)(c o m p i l e r s))
                   ((a t t r i b u t e)(g r a m m a r s)(a n d)(t h e i r)(u s e)(i n)(s y n t a x)(d i r e c t e d)(t r a n s l a t i o n))
                   ((m o d e l s)(o f)(p r o g r a m m i n g)(l a n g u a g e)(s e m a n t i c s))
                   ((i n t e r m e d i a t e)(r e p r e s e n t a t i o n s)(o f)(p r o g r a m s)(p a r a l l e l)(p r o g r a m m i n g)(m o d e l s))
                   ))

(define document2 '(((y m n x) (h t z w x j) (h t a j w x) (y t u n h x) (n s) (u w t l w f r r n s l) (q f s l z f l j x) (f s i) (h t r u n q j w x))
 ((f y y w n g z y j) (l w f r r f w x) (f s i) (y m j n w) (z x j) (n s) (x d s y f c) (i n w j h y j i) (y w f s x q f y n t s))))

(define document3 '(((u i j t)
  (d p v s t f)
  (d p w f s t)
  (u p q j d t)
  (j o)
  (q s p h s b n n j o h)
  (m b o h v b h f t)
  (b o e)
  (d p n q j m f s t))
 ((b u u s j c v u f)
  (h s b n n b s t)
  (b o e)
  (u i f j s)
  (v t f)
  (j o)
  (t z o u b y)
  (e j s f d u f e)
  (u s b o t m b u j p o))
 ((n p e f m t) (p g) (q s p h s b n n j o h) (m b o h v b h f) (t f n b o u j d t))
 ((j o u f s n f e j b u f)
  (s f q s f t f o u b u j p o t)
  (p g)
  (q s p h s b n t)
  (q b s b m m f m)
  (q s p h s b n n j o h)
  (n p e f m t))))

(define secret-doc '(((x f w f) (n x) (f) (g z y y)))
  )
(define enc5 '(((y m n x) (j j j j j j j j j j j j j j j j) (h t z w x j) (h t a j w x) (y t u n h x) (n s) (u w t l w f r r n s l) (q f s l z f l j x) (f s i) (h t r u n q j w x))
 ((f y y w n g z y j) (l w f r r f w x) (f s i) (y m j n w) (z x j) (n s) (x d s y f c) (i n w j h y j i) (y w f s x q f y n t s))
 ((r t i j q x) (t k) (u w t l w f r r n s l) (q f s l z f l j) (x j r f s y n h x))
 ((n s y j w r j i n f y j) (w j u w j x j s y f y n t s x) (t k) (u w t l w f r x) (u f w f q q j q) (u w t l w f r r n s l) (r t i j q x)(e e e e e e e e e e e e e e e e e e e e))))

(define eel '(((f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m)(f f m))))
