;;;======================================================
;;; 	Basic Electives Expert System
;;;
;;;     This expert system suggests some electives
;;;     that you may wish you take up for your M.Tech
;;;		course.
;;;
;;;======================================================

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate elective
    (slot code)       ;; ELECTIVE CODE
    (multislot name)  ;; NAME
    (slot stream (type SYMBOL) (allowed-symbols KE SE))     ;; KE/SE
    (slot setf)       ;; ONE TO EIGHT
    (slot setp)       ;; ONE TO FOUR
    (slot type)       ;; TECHNICAL/MANAGEMENT
    (slot prg)        ;; INVOLVES PGMING
    (slot mode)       ;; ONLINE/CLASSROOM/ONLINE_SUPPORT
    (multislot preq)       ;; 
    (slot cf (type FLOAT) (default 0.5))     
)


(deftemplate elective_goal
    (slot code)       ;; ELECTIVE CODE
    (multislot name)  ;; NAME
    (slot stream (type SYMBOL) (allowed-symbols KE SE))     ;; KE/SE
    (slot setf)       ;; ONE TO EIGHT
    (slot setp)       ;; ONE TO FOUR
    (slot type)       ;; TECHNICAL/MANAGEMENT
    (slot prg)        ;; INVOLVES PGMING
    (slot mode)       ;; ONLINE/CLASSROOM/ONLINE_SUPPORT
    (multislot preq)       ;; 
    (slot cf (type FLOAT) (default 0.5))     
)


(deftemplate elective_wgoal
    (slot code)       ;; ELECTIVE CODE
    (multislot name)  ;; NAME
    (slot stream (type SYMBOL) (allowed-symbols KE SE))     ;; KE/SE
    (slot setf)       ;; ONE TO EIGHT
    (slot setp)       ;; ONE TO FOUR
    (slot type)       ;; TECHNICAL/MANAGEMENT
    (slot prg)        ;; INVOLVES PGMING
    (slot mode)       ;; ONLINE/CLASSROOM/ONLINE_SUPPORT
    (multislot preq)       ;; 
    (slot cf (type FLOAT))     
)

(deffacts load_electives
    ;; CBR 
    (elective 
        (code CBR) 
        (name CASE BASED REASONING) 
        (stream KE) 
        (setf FOUR) 
        (setp TWO) 
        (type KE/BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Business Analytics (previously Data Mining) 
    (elective 
        (code BADM) 
        (name BUSINESS ANALYTICS) 
        (stream KE) 
        (setf SEVEN) 
        (setp THREE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Knowledge Management 
    (elective 
        (code KM) 
        (name KNOWLEDGE MANAGEMENT) 
        (stream KE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Genetic Algorithms
    (elective 
        (code GA) 
        (name GENETIC ALGORITHMS) 
        (stream KE) 
        (setf THREE) 
        (setp ONE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Text Mining
    (elective 
        (code TM) 
        (name TEXT MINING) 
        (stream KE) 
        (setf FIVE) 
        (setp THREE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Human Computer Interface
    (elective 
        (code HCI) 
        (name HUMAN COMPUTER INTERFACE) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type TECHNICAL/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Mobile Wireless Application Development
    (elective 
        (code MWAD) 
        (name MOBILE WIRELESS APPLICATION DEVELOPMENT) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OBJECTIVE-C)
    )

    ;; Information Systems Security
    (elective 
        (code ISS) 
        (name INFORMATION SYSTEMS SECURITY) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type TECHNICAL/MANAGEMENT/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )

   ;; Architecting Software Solutions
    (elective 
        (code ASWS) 
        (name ARCHITECTING SOFTWARE SOLUTIONS) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type TECHNICAL/MANAGEMENT) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING AND DESIGN)
    )

    ;; Enterprise .NET II
    (elective 
        (code ENETTWO) 
        (name ENTERPRISE .NET II) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq COURSE NETONE)
    )

    ;; Open Source for the Enterprise
    (elective 
        (code OSE) 
        (name OPEN SOURCE FOR THE ENTERPRISE) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type TECHNICAL/MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Service Innovation
    (elective 
        (code SI) 
        (name SERVICE INNOVATION) 
        (stream SE) 
        (setf FIVE) 
        (setp THREE) 
        (type MANAGEMENT/BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Software Maintenance and Evolution
    (elective 
        (code SWME) 
        (name SOFTWARE MAINTENANCE AND EVOLUTION) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )

    ;; Software Prototyping
    (elective 
        (code SWP) 
        (name SOFTWARE PROTOTYPING) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )

    ;; Agile Software Project Management
    (elective 
        (code ASPM) 
        (name AGILE SOFTWARE PROJECT MANAGEMENT) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type MANAGEMENT/TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Research on Advanced IT Topics I
    (elective 
        (code RAITONE) 
        (name RESEARCH ON ADVANCED IT TOPICS I) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type RESEARCH) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq KE PROPOSAL FOR KE/ONLY CASE STUDY FOR FT)
    )

    ;; Research on Advanced IT Topics II
    (elective 
        (code RAITTWO) 
        (name RESEARCH ON ADVANCED IT TOPICS II) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type RESEARCH) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq COURSE SG 5220)
    )

    ;; Enterprise integration 
    (elective 
        (code EI) 
        (name ENTERPRISE INTEGRATION) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Dot NET 1 
    (elective 
        (code ENETONE) 
        (name ENTERPRISE .NET I) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )
   ;; Cloud Computing 
    (elective 
        (code CC) 
        (name CLOUD COMPUTING) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq JAVA)
    )
   ;; Software Metrics & process improvement
    (elective 
        (code SMPI) 
        (name SOFTWARE METRICS AND PROCESS IMPROVEMENT) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Managing IT Outsourcing and subcontracting 
    (elective 
        (code MITOS) 
        (name MANAGING IT OUTSORCING AND SUBCONTRACTING) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode ONLINE) 
        (preq NONE)
    )
   ;; OODP 
    (elective 
        (code OODP) 
        (name OBJECT ORIENTED DESIGN PATTERNS) 
        (stream SE) 
        (setf FIVE) 
        (setp THREE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )
   ;; Java 
    (elective 
        (code EJ) 
        (name ENTERPRISE JAVA) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq JAVA)
    )
   ;; BPM
    (elective 
        (code BPM) 
        (name BUSINESS PROCESS MANAGEMENT) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Software Requirements Engg 
    (elective 
        (code SWRE) 
        (name SOFTWARE REQUIREMENTS ENGINEERING) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; IT Law
    (elective 
        (code ITL) 
        (name IT LAW) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; IT Service Management 
    (elective 
        (code ITSM) 
        (name IT SERVICE MANAGEMENT) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

)

;;;;;;;;;;;;;; FACTS FOR GOALS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffacts load_elective_goals
    ;; CBR 
    (elective_goal 
        (code CBR) 
        (name CASE BASED REASONING) 
        (stream KE) 
        (setf FOUR) 
        (setp TWO) 
        (type KE/BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Business Analytics (previously Data Mining) 
    (elective_goal 
        (code BADM) 
        (name BUSINESS ANALYTICS) 
        (stream KE) 
        (setf SEVEN) 
        (setp THREE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Knowledge Management 
    (elective_goal 
        (code KM) 
        (name KNOWLEDGE MANAGEMENT) 
        (stream KE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Genetic Algorithms
    (elective_goal 
        (code GA) 
        (name GENETIC ALGORITHMS) 
        (stream KE) 
        (setf THREE) 
        (setp ONE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Text Mining
    (elective_goal 
        (code TM) 
        (name TEXT MINING) 
        (stream KE) 
        (setf FIVE) 
        (setp THREE) 
        (type KE) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Human Computer Interface
    (elective_goal 
        (code HCI) 
        (name HUMAN COMPUTER INTERFACE) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type TECHNICAL/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Mobile Wireless Application Development
    (elective_goal 
        (code MWAD) 
        (name MOBILE WIRELESS APPLICATION DEVELOPMENT) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OBJECTIVE-C)
    )

    ;; Information Systems Security
    (elective_goal 
        (code ISS) 
        (name INFORMATION SYSTEMS SECURITY) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type TECHNICAL/MANAGEMENT/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )

   ;; Architecting Software Solutions
    (elective_goal 
        (code ASWS) 
        (name ARCHITECTING SOFTWARE SOLUTIONS) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type TECHNICAL/MANAGEMENT) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING AND DESIGN)
    )

    ;; Enterprise .NET II
    (elective_goal 
        (code ENETTWO) 
        (name ENTERPRISE .NET II) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq COURSE NETONE)
    )

    ;; Open Source for the Enterprise
    (elective_goal 
        (code OSE) 
        (name OPEN SOURCE FOR THE ENTERPRISE) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type TECHNICAL/MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Service Innovation
    (elective_goal 
        (code SI) 
        (name SERVICE INNOVATION) 
        (stream SE) 
        (setf FIVE) 
        (setp THREE) 
        (type MANAGEMENT/BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Software Maintenance and Evolution
    (elective_goal 
        (code SWME) 
        (name SOFTWARE MAINTENANCE AND EVOLUTION) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )

    ;; Software Prototyping
    (elective_goal 
        (code SWP) 
        (name SOFTWARE PROTOTYPING) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL/BA) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )

    ;; Agile Software Project Management
    (elective_goal 
        (code ASPM) 
        (name AGILE SOFTWARE PROJECT MANAGEMENT) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type MANAGEMENT/TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq NONE)
    )

    ;; Research on Advanced IT Topics I
    (elective_goal 
        (code RAITONE) 
        (name RESEARCH ON ADVANCED IT TOPICS I) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type RESEARCH) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq KE PROPOSAL FOR KE/ONLY CASE STUDY FOR FT)
    )

    ;; Research on Advanced IT Topics II
    (elective_goal 
        (code RAITTWO) 
        (name RESEARCH ON ADVANCED IT TOPICS II) 
        (stream SE) 
        (setf SEVEN) 
        (setp THREE) 
        (type RESEARCH) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq COURSE SG 5220)
    )

    ;; Enterprise integration 
    (elective_goal 
        (code EI) 
        (name ENTERPRISE INTEGRATION) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Dot NET 1 
    (elective_goal 
        (code ENETONE) 
        (name ENTERPRISE .NET I) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )
   ;; Cloud Computing 
    (elective_goal 
        (code CC) 
        (name CLOUD COMPUTING) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq JAVA)
    )
   ;; Software Metrics & process improvement
    (elective_goal 
        (code SMPI) 
        (name SOFTWARE METRICS AND PROCESS IMPROVEMENT) 
        (stream SE) 
        (setf ONE) 
        (setp ONE) 
        (type TECHNICAL/MANAGEMENT) 
        (prg BASIC) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Managing IT Outsourcing and subcontracting 
    (elective_goal 
        (code MITOS) 
        (name MANAGING IT OUTSORCING AND SUBCONTRACTING) 
        (stream SE) 
        (setf EIGHT) 
        (setp FOUR) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode ONLINE) 
        (preq NONE)
    )
   ;; OODP 
    (elective_goal 
        (code OODP) 
        (name OBJECT ORIENTED DESIGN PATTERNS) 
        (stream SE) 
        (setf FIVE) 
        (setp THREE) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq OO PROGRAMMING)
    )
   ;; Java 
    (elective_goal 
        (code EJ) 
        (name ENTERPRISE JAVA) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type TECHNICAL) 
        (prg ADVANCED) 
        (mode CLASSROOM) 
        (preq JAVA)
    )
   ;; BPM
    (elective_goal 
        (code BPM) 
        (name BUSINESS PROCESS MANAGEMENT) 
        (stream SE) 
        (setf SIX) 
        (setp FOUR) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; Software Requirements Engg 
    (elective_goal 
        (code SWRE) 
        (name SOFTWARE REQUIREMENTS ENGINEERING) 
        (stream SE) 
        (setf FOUR) 
        (setp TWO) 
        (type BA) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; IT Law
    (elective_goal 
        (code ITL) 
        (name IT LAW) 
        (stream SE) 
        (setf THREE) 
        (setp ONE) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )
   ;; IT Service Management 
    (elective_goal 
        (code ITSM) 
        (name IT SERVICE MANAGEMENT) 
        (stream SE) 
        (setf TWO) 
        (setp TWO) 
        (type MANAGEMENT) 
        (prg NONE) 
        (mode CLASSROOM) 
        (preq NONE)
    )

)

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list)
)

;;;****************
;;;* GLOBAL VARS  *
;;;****************

(defglobal
	?*temp* = 0
    ?*FONE* = 0.5
    ?*FTWO* = 0.5
    ?*FTHREE* = 0.5
    ?*FFOUR* = 0
    ?*FFIVE* = 0
    ?*FSIX* = 0
    ?*FSEVEN* = 0
    ?*FEIGHT* = 0

    ?*PONE* = 0
    ?*PTWO* = 0
    ?*PTHREE* = 0
    ?*PFOUR* = 0
)

;;;********************
;;;* CF COMBINATIONS  *
;;;********************

;combine POSITIVE certainty factors for multiple conclusions
;cf(cf1,cf2) = cf1 + cf2 * (1- cf1)

(defrule combine_positive_cf
  ?f1 <- (elective_goal (code ?c)(cf ?cf1&:(>= ?cf1 0)))
  ?f2 <- (elective_wgoal (code ?c)(cf ?cf2&:(>= ?cf2 0)))
  (test (neq ?f1 ?f2)) ; test pointers and not value
  =>
  (retract ?f2)
  (modify ?f1 (cf =(+ ?cf1 (* ?cf2 (- 1 ?cf1)))))
)


;combine NEGATIVE cf
;cf(cf1,cf2) = cf1 + cf2 * (1 + cf1)

(defrule combine_negative_cf
 (declare (salience -1))
  ?f1 <- (elective_goal   (code ?c)(cf ?cf1&:(<= ?cf1 0)))
  ?f2 <- (elective_wgoal (code ?c)(cf ?cf2&:(<= ?cf2 0)))
  (test (neq ?f1 ?f2))
  =>
  (retract ?f2)
  (modify ?f1 (cf =(+ ?cf1 (* ?cf2 (+ 1 ?cf1)))))
)

;combine one POSITIVE and one NEGATIVE
;cf(cf1,cf2) = (cf1 + cf2) / 1 - MIN[abs(cf1),abs(cf2)]

(defrule negative_positive_cf
 (declare (salience -1))
  ?f1 <- (elective_goal (code ?c) (cf ?cf1))
  ?f2 <- (elective_wgoal (code ?c) (cf ?cf2))
  (test (neq ?f1 ?f2))
  (test (< (* ?cf1 ?cf2) 0))
  =>
  (retract ?f2)
  (modify ?f1 (cf =(/ (+ ?cf1 ?cf2) (- 1 (min (abs ?cf1) (abs ?cf2))))))
)

;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule determine_student_type 

   (logical (start))

   =>

   (assert (UI-state (display type)
                     (relation-asserted fulltime)
                     (response Yes)
                     (valid-answers No Yes))))
   
(defrule determine_student_branch 

   (logical (or (fulltime Yes) (fulltime No)))

   =>
   

   (assert (UI-state (display branch)
                     (relation-asserted branch)
                     (response KE)
                     (valid-answers KE SE))))


;;KE specific rule based on prev rules!
(defrule ke_special

	(logical (branch KE))
	=>
	(assert (elective_wgoal (code BADM) (cf 0.9)))
)

(defrule determine_student_has_worked

   (logical (or (branch KE) (branch SE)))

   =>

   (assert (UI-state (display worked)
                     (relation-asserted worked)
                     (response No)
                     (valid-answers No Yes))))
   

(defrule determine_student_experience

   (logical (worked Yes))

   =>

   (assert (UI-state (display experience)
                     (relation-asserted experience)
                     (response Medium)
                     (valid-answers High Medium Low))))

                                          
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   

;;;****************
;;;* FINAL RULES *
;;;****************

(defrule display_recommendations

   (logical (or (worked Yes)(worked No)))
   
   =>

   (assert (UI-state (display recommendation)
                     (state final))))


(defrule FSEVEN_get_value
	(elective_goal (code ?c) (setf SEVEN) (cf ?cf1))
=>	
    (if (> ?cf1 ?*FSEVEN*)
        then
    (bind ?*FSEVEN* ?cf1)        
    )
    ;;(printout t crlf "FSEVEN --> "?*FSEVEN* crlf)
)

(deffunction getSubject ()
  (bind ?facts (find-all-facts ((?f elective_goal))
                               (and (eq ?f:setf SEVEN)
                                    (= ?f:cf ?*FSEVEN*))))
)