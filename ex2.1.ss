#lang racket

;Auteurs : AMACHAT Yousra et AIT EL HADJ Anas
;Devoir TM scheme


;2.1 Fonctions utilitaires
;1 :
(define (puissance n e)
    ;une fonction qui calcule l'elevation d'un nombre a une puissance
    ;entree : {nombre->entier} {l'exposant->reel positif} 
    ;sortie : {la puissance->entier}
        (cond ((= n 0) 0)
        ((= e 0) 1)
        ((< e 0) (puissanceNeg n e))
        (else (> e 0 ) (* n (puissance n (- e 1))))
    ))
(define (puissanceNeg n e) 
    ;entree : {nonbre->entier} {l'exposant->reel negatif} 
    ;sortie : {la puissance->entier}
    (quotient 1 (puissance n (* -1 e))))
;;neg inclus dans la premiere
;exemple
(puissanceNeg 4 -2)


;2 :
(define (nbChiffres n) 
    ;une fonction qui renvoie le nombre de chiffres nécessaires à l’écriture de cet entier en chiffres.
    ;entree :{nombre->entier} 
    ;sortie :entier
        (cond 
            ((< n 10) 1)
            ((< (quotient n 10) 10) 2)
            (else (+ (nbChiffres (quotient n 10)) 1))
        
        )
    )

;exemple
(nbChiffres 3839)

; ;2.2 Écriture d’entiers inférieurs à 1000000
; ;1 :
(define (base10 n)
    ;une fonction qui renvoie une chaîne de caractères contenant son écriture en lettres
    ;entree :{nombre->entier tq n>=0 et n<=9}
    ;sortie :string
    (cond 
    ((= n 1) "un")
    ((= n 2) "deux")
    ((= n 3) "trois")
    ((= n 4) "quatre")
    ((= n 5) "cinq")
    ((= n 6) "six")
    ((= n 7) "sept")
    ((= n 8) "huit")
    ((= n 9) "neuf")
    (else ("zero"))
    )
)

;exemple :
(base10 8)

;2 :
(define (ecritureDizaine n)
    ;une fonction qui renvoie une chaîne de caractères l’écriture d’une dizaine exacte.
    ;entree :{nombre->entier}
    ;sortie :string
    (cond 
    ((= n 10) "dix")
    ((= n 20) "vingt")
    ((= n 30) "trente")
    ((= n 40) "quarante")
    ((= n 50) "cinqante")
    ((= n 60) "soixante")
    ((= n 70) "soixante dix") ;
    ((= n 80) "quatre vingt")
    ((= n 90) "quatre vingt dix")
    ((= n 100) "cent")
    ((= n 1000) "mille")
    ((= n (puissance 10 6)) "million")
    ((= n (puissance 10 9)) "milliard")
    )
)
 ;exemple

 ;3 :
  (define (ecriture_0_19 n)
    ;une fonction qui renvoie l’écriture d’un entier compris entre 0 et 19
    ;;entree :{nombre->entier}
    ;sortie :string
    (cond
    ((<= n 9) (base10 n))
    ((= n 10) (ecritureDizaine n))
    ((= n 11) "onze")
    ((= n 12) "douze")
    ((= n 13) "treize")
    ((= n 14) "quatorze")
    ((= n 15) "quinze")
    ((= n 16) "seize")
    ((and (> n 16) (<= n 19)) 

    (string-append (string-append (ecritureDizaine (- n (remainder n 10))) " ") (base10 (remainder n 10)))
    
    )))

(ecriture_0_19 2)

;4 :
(define (ecriture2Chiff n)
    ;
    ;entree :{nombre->entier}
    ;sortie :string
    (cond
    ((<= n 19) (ecriture_0_19 n))
    ((= (remainder n 10) 0)  (ecritureDizaine n))
    ((and (> n 19) (< n 91)) (string-append (string-append (ecritureDizaine (- n (remainder n 10))) " ") (ecriture_0_19 (remainder n 10))))
    ((> n 90) (string-append (string-append (ecritureDizaine (- (- n 10) (remainder n 10))) " ") (ecriture_0_19 (+ 10 (remainder n 10)))))
    )
)
;exemple
(ecriture2Chiff 98)

;5 :
(define (ecriture3Chiff n)
   (cond
    ((= (nbChiffres n) 2) (ecriture2Chiff n))
    ((= 0 (remainder n 100)) (aideEcriture3Chiff n))
    ((>= n 100) (string-append (string-append (aideEcriture3Chiff n) " ") (ecriture2Chiff (remainder n  ))))
    )
) 
(define (aideEcriture3Chiff n)
   (if (= n 100) (ecritureDizaine n)
    (string-append (string-append (base10 (/ n 100)) " ") (ecritureDizaine 100)))
)
;(aideEcriture3Chiff 300)

(ecriture3Chiff 234)

;6 :
(define (ecriture6Chiff n)
    (cond
    ((= 3 (nbChiffres n)) (ecriture3Chiff n))
    ((= 4 (nbChiffres n)) (string-append (string-append (ecritureDizaine (- n (remainder n 1000))) " ") (base10 (remainder n 10))))

    


    )
)
(define (calculDizaine n)
    (cond
    ((= n 1000) (ecritureDizaine n))
    ((= n (puissance 10 e)) (/ n (puissance 10 e)))
        
    )
)