(deftemplate elective
	(slot code)
	(slot name)
	(slot cf)
)

(deftemplate electiveg
	(slot code)
	(slot name)
	(slot cf)
)

(deftemplate electivewg
	(slot code)
	(slot name)
	(slot cf)
)

(deffacts load
	(elective (code 0) (name 1) (cf 0.1))
	(elective (code 0) (name 2) (cf 0.1))
	(elective (code 0) (name 3) (cf 0.1))
	(elective (code 0) (name 4) (cf 0.1))
)

(deffacts loadg
	(electiveg (code 0) (name 1) (cf 0.1))
	(electiveg (code 0) (name 2) (cf 0.1))
	(electiveg (code 0) (name 3) (cf 0.1))
	(electiveg (code 0) (name 4) (cf 0.1))
)

(defglobal
    ?*FONE* = 0
)

;combine POSITIVE certainty factors for multiple conclusions
;cf(cf1,cf2) = cf1 + cf2 * (1- cf1)

(defrule combine_positive_cf
  ?f1 <- (electiveg (code ?c) (name ?n) (cf ?cf1&:(>= ?cf1 0)))
  ?f2 <- (electivewg (code ?c)(name ?n) (cf ?cf2&:(>= ?cf2 0)))
  (test (neq ?f1 ?f2)) ; test pointers and not value
  =>
  (printout t crlf "combine cfs" crlf)
  (retract ?f2)
  (modify ?f1 (cf =(+ ?cf1 (* ?cf2 (- 1 ?cf1)))))
)

(defrule FONE_get_value
	(electiveg (code ?c) (name ?n) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FONE*)
        then
    (bind ?*FONE* ?cf1)        
    )
    ;;(printout t crlf "FONE --> "?*FONE* crlf)
)

(deffunction getSubject ()
  (bind ?facts (find-all-facts ((?f electiveg))
                               (and (eq ?f:code 0)
                                    (= ?f:cf ?*FONE*))))
)
  