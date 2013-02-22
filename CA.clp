;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic Electives Recommendation System
;; TO-DO
;; 1. Need to write rules for all expect profiling
;; 2. Rules for individual subjects based on student profile
;; 3. Final recommendation rules for all schedules
;;
;; getnpk@gmail.com Feb 21 2013
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate student
    (slot id (default M))
    ;;PROFILING
    (slot type (type SYMBOL) (allowed-symbols FULLTIME PARTTIME))    
    (slot branch (type SYMBOL) (allowed-symbols KE SE NONE) (default NONE))
    (slot worked (type SYMBOL) (allowed-symbols YES NO NONE) (default NONE))
    (slot experience (type SYMBOL) (allowed-symbols HIGH MEDIUM LOW NONE) (default NONE))

    ;;TECHNICAL
    (slot programming (type SYMBOL) (allowed-symbols LOW MEDIUM HIGH NONE) (default NONE))
    (slot learn_programming (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot exp_programming (type SYMBOL) (allowed-symbols YES NO NONE) (default NONE))      
    (slot microsoft (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot opensource (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot exp_java (type SYMBOL) (allowed-symbols YES NO NONE) (default NONE))
    (slot frontend (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot ba (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    (slot mobile (type SYMBOL) (allowed-symbols YES NO MAYBE NONE) (default NONE))
    
    ;;MANAGERIAL
    (slot management (type SYMBOL) (allowed-symbols YES NO MAYBE))
    (slot pm_em (type SYMBOL) (allowed-symbols YES NO MAYBE))
    (slot exp_management (type SYMBOL) (allowed-symbols YES NO MAYBE))

    ;;TECHNOPRENURSHIP/ENTERPRISE
    (slot ideator (type SYMBOL) (allowed-symbols YES NO MAYBE))
    (slot research (type SYMBOL) (allowed-symbols YES NO MAYBE))
    (slot field_research (type SYMBOL) (allowed-symbols KE SE BIZ))
    (slot proposal_research (type SYMBOL) (allowed-symbols YES NO))
    (slot experience_research (type SYMBOL) (allowed-symbols YES NO))
    (slot new_research (type SYMBOL) (allowed-symbols YES NO))

    ;;INFRASTRUCTURE
    (slot infrastructure (type SYMBOL) (allowed-symbols YES NO MAYBE))
    (slot applied_opensource (type SYMBOL) (allowed-symbols YES NO MAYBE))

    ;;KE
    (slot ke (type SYMBOL) (allowed-symbols YES NO MAYBE))
    (slot soft_computing (type SYMBOL) (allowed-symbols YES NO MAYBE))
    (slot kbs (type SYMBOL) (allowed-symbols YES NO MAYBE))
    (slot data_analysis (type SYMBOL) (allowed-symbols YES NO MAYBE))
    (slot search (type SYMBOL) (allowed-symbols YES NO MAYBE))
)

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

;;;;;;;;;;;;;;;;;;;;;;;;;GLOBAL VARS;;;;;;;;;;;;;;;;;;;;

(defglobal
	?*temp* = 0
    ?*FONE* = 0
    ?*FTWO* = 0
    ?*FTHREE* = 0
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffacts load_electives
    ;; CBR 
    (elective 
        (code KE_ONE) 
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
        (code KE_TWO) 
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
        (code KE_THREE) 
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
        (code KE_FOUR) 
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
        (code KE_FIVE) 
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
        (code SG3204) 
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
        (code SG4205) 
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
        (code SG5225) 
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
        (code NETTWO) 
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
        (code SG5227) 
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
        (code SG5228) 
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
        (code SG5229) 
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
        (code SG5231) 
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
        (code SG5220) 
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
        (code SG5221) 
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
        (code SG4206) 
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
        (code NETONE) 
        (name ENTERPRISE DOTNET1) 
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
        (code SG4211) 
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
        (code SG5205) 
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
        (code SG5207) 
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
        (code SG5208) 
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
        (code SG5211) 
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
        (code SG5214) 
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
        (code SG5219) 
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
        (code SG5222) 
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
        (code KE_ONE) 
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
        (code KE_TWO) 
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
        (code KE_THREE) 
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
        (code KE_FOUR) 
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
        (code KE_FIVE) 
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
        (code SG3204) 
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
        (code SG4205) 
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
        (code SG5225) 
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
        (code NETTWO) 
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
        (code SG5227) 
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
        (code SG5228) 
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
        (code SG5229) 
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
        (code SG5231) 
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
        (code SG5220) 
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
        (code SG5221) 
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
        (code SG4206) 
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
        (code NETONE) 
        (name ENTERPRISE DOTNET1) 
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
        (code SG4211) 
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
        (code SG5205) 
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
        (code SG5207) 
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
        (code SG5208) 
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
        (code SG5211) 
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
        (code SG5214) 
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
        (code SG5219) 
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
        (code SG5222) 
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;CF combination;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PERSONAL;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule Personal
    (declare (salience 10))
=>	
	(printout t crlf "Are you a Full time student? (y/n)") 
	(bind ?response (read))
	(if (= (str-compare ?response y) 0)
	then
		(assert (student (id M) (type FULLTIME)))
	else 
		(assert (student (id M) (type PARTTIME)))
	)
	
	(printout t crlf "Are you from the Knowledge Engineering stream? (y/n)") 
	(bind ?response (read))
	
	(if (= (str-compare ?response y) 0)
	then
		(assert (student (id M) (branch KE)))	
        else 
		(assert (student (id M) (branch SE)))
	)

	(printout t crlf "Do you have any work expirence? (y/n)") 
	(bind ?response (read))

	(if (= (str-compare ?response y) 0)
	       	then
        		(assert (student (id M) (worked YES)))	
        	else 
        		(assert (student (id M) (worked NO)))
        )
	
)

(defrule KE_Weightage
    (student (id M) (branch KE))
	(elective (code KE_ONE) (cf ?cf1))
	(elective (code KE_TWO) (cf ?cf2))
	(elective (code KE_THREE) (cf ?cf3))
	(elective (code KE_FOUR) (cf ?cf4))
	(elective (code KE_FIVE) (cf ?cf5))
=>
		;; Give weightage to all KE related subjects.
		(assert (elective_wgoal (code KE_ONE) (cf (* ?cf1 0.9))))
		(assert (elective_wgoal (code KE_TWO) (cf (* ?cf2 0.9))))
		(assert (elective_wgoal (code KE_THREE) (cf (* ?cf3 0.9))))
		(assert (elective_wgoal (code KE_FOUR) (cf (* ?cf4 0.9))))
		(assert (elective_wgoal (code KE_FIVE) (cf (* ?cf5 0.9))))
)

(defrule Work_Experience
	(student (id M) (worked YES))
=>
	(printout t crlf "How long have you been working? (l/m/h)")
        (bind ?response (read))
	
	(switch ?response
		(case l then
			(assert(student (id M) (experience LOW))))
		(case m then
			(assert(student (id M) (experience MEDIUM))))
		(case h then
			(assert(student (id M) (experience HIGH))))
	)
)    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;; TECHNICAL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;TECHNICAL
;;   (slot exp_java (type SYMBOL) (allowed-symbols YES NO))
;;  (slot frontend (type SYMBOL) (allowed-symbols YES NO MAYBE))
;; (slot ba (type SYMBOL) (allowed-symbols YES NO MAYBE))
;;  (slot mobile (type SYMBOL) (allowed-symbols YES NO MAYBE))

(defrule technical
    (declare (salience 9))
=>
  	(printout t crlf "How would rate yourself in programming? (h/m/l)") 
	(bind ?response (read))
	(switch ?response
		(case l then
			(assert(student (id M) (programming LOW))))
		(case m then
			(assert(student (id M) (programming MEDIUM))))
		(case h then
			(assert(student (id M) (programming HIGH))))
	)    

  	(printout t crlf "Would you be interested in programming? (y/n/m)") 
	(bind ?response (read))
	(switch ?response
		(case y then
			(assert(student (id M) (learn_programming YES))))
		(case n then
			(assert(student (id M) (learn_programming NO))))
		(case m then
			(assert(student (id M) (learn_programming MAYBE))))
	)    

  	(printout t crlf "Do you have any experience in programming? (y/n)") 
	(bind ?response (read))
	(if (= (str-compare ?response y) 0)
	       	then
        		(assert (student (id M) (exp_programming YES)))	
        	else 
        		(assert (student (id M) (exp_programming NO)))
        )

)

(defrule programming_advanced
    ;; DO FOR ALL ADVANCED AND BASIC
    (and (student (id M) (learn_programming YES)) (student (id M) (exp_programming YES)))
    (elective (code MWAD) (cf ?cf1))
    (elective (code EJ) (cf ?cf2))
=>
    (assert (elective_wgoal (code MWAD) (cf (* ?cf1 0.8))))
    (assert (elective_wgoal (code EJ) (cf (* ?cf1 0.8))))
)

(defrule programming_basic
    ;; DO FOR ALL BASIC
    (student (id M) (learn_programming MAYBE))
    (elective (code EI) (cf ?cf1))
=>
    (assert (elective_wgoal (code EI) (cf (* ?cf1 0.8))))
)

(defrule microsoft
    (student (id M) (learn_programming YES))
    (elective (code NETONE) (cf ?cf1))
    (elective (code NETTWO) (cf ?cf2))
=>
    (printout t crlf "Would you interested in Microsoft based technologies? (y/n/m)")
    	(bind ?response (read))
	(switch ?response
		(case y then
            (assert (elective_wgoal (code NETONE) (cf (* ?cf1 0.9))))
            (assert (elective_wgoal (code NETTWO) (cf (* ?cf1 0.9)))))
		(case m then
            (assert (elective_wgoal (code NETONE) (cf (* ?cf1 0.6))))
            (assert (elective_wgoal (code NETTWO) (cf (* ?cf1 0.6)))))
        (case n then
            (assert (elective_wgoal (code NETONE) (cf (* ?cf1 -1.0))))
            (assert (elective_wgoal (code NETTWO) (cf (* ?cf1 -1.0)))))
	)    
)

(defrule opensource
    (or (student (id M) (learn_programming YES)) (student (id M) (learn_programming MAYBE)))
    (elective (code SWP) (cf ?cf1))
=>
    (printout t crlf "Would you interested in Open Source technologies? (y/n/m)")
  	(bind ?response (read))
	(switch ?response
		(case y then
            (assert (student (id M) (opensource YES)))
            (assert (elective_wgoal (code SWP) (cf (* ?cf1 0.9)))))
		(case m then
            (assert (student (id M) (opensource MAYBE)))
            (assert (elective_wgoal (code SWP) (cf (* ?cf1 0.6)))))
        (case n then
            (assert (student (id M) (opensource NO)))
            (assert (elective_wgoal (code SWP) (cf (* ?cf1 -0.5)))))
	)    

)


;;;;;;;;;;;;;;;;;;;;;;;;;RECOMMENDATIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule FFIVE_get_value

	(elective_goal (code ?c) (setf FIVE) (cf ?cf))
=>	
    (if (> ?cf ?*FFIVE*)
        then
    (bind ?*FFIVE* ?cf)        
    )
    ;;(printout t crlf "Value of cf is " ?*temp*)
)

(defrule FFIVE_get_recommendation
   	(declare (salience -10))
    (elective_goal (name $?n) (code ?c) (setf FIVE) (cf ?cf))
=>
    (if (= ?cf ?*FFIVE*)
    then
        (printout t crlf "FULL TIME PART FIVE Elective(s): " ?n " Code: " ?c crlf)
    )
    
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;