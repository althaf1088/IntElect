;; Management Experience

(defrule determine_student_management_experience

(logical ( and (or (branch KE) (branch SE)) 
               (or (experience High) (experience Medium) (experience Low)) ))

=>

(assert (UI-state (display management_exp)
(relation-asserted management_exp)
(response No)
(valid-answers Yes No)))

)


(defrule student_management_exp_weightage_yes ;; Subjects that will benefit from management experience
                                              ;; Using only 0.6 because prior experience is not a huge factor

(logical (management_exp Yes))

(elective (code ITSM) (cf ?cf1))
(elective (code BPM) (cf ?cf2)) 
(elective (code ASPM) (cf ?cf3))
(elective (code ITL) (cf ?cf4))
(elective (code KM) (cf ?cf5))
(elective (code MITOS) (cf ?cf6))

=>

(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.6))))
(assert (elective_wgoal (code BPM) (cf (* ?cf2 0.6))))
(assert (elective_wgoal (code ASPM) (cf (* ?cf3 0.6))))
(assert (elective_wgoal (code ITL) (cf (* ?cf4 0.6))))
(assert (elective_wgoal (code KM) (cf (* ?cf5 0.6))))
(assert (elective_wgoal (code MITOS) (cf (* ?cf6 0.6))))

)

(defrule student_management_exp_weightage_no ;; Subjects that might be tough or not-so-relevant w/o mgmt exp

(logical (management_exp No))

(elective (code ITSM) (cf ?cf1))
(elective (code ASPM) (cf ?cf2))
(elective (code MITOS) (cf ?cf3))

=>

(assert (elective_wgoal (code ITSM) (cf (* ?cf1 -0.2))))
(assert (elective_wgoal (code ASPM) (cf (* ?cf2 -0.2))))
(assert (elective_wgoal (code MITOS) (cf (* ?cf3 -0.2))))

)

;; Management Interest

(defrule determine_student_management_interest

(logical ( and (or (branch KE) (branch SE)) 
               (or (experience High) (experience Medium) (experience Low)) 
               (or (management_exp Yes) (management_exp No))))

=>

(assert (UI-state (display management_int)
(relation-asserted management_int)
(response No)
(valid-answers Yes No Maybe)))

)


(defrule student_management_int_weightage_yes ;; Relevant subjects if student is interested in management
                                       
(logical (management_int Yes))

(elective (code ITSM) (cf ?cf1))
(elective (code BPM) (cf ?cf2)) 
(elective (code ASPM) (cf ?cf3))
(elective (code ITL) (cf ?cf4))
(elective (code KM) (cf ?cf5))
(elective (code MITOS) (cf ?cf6))

=>

(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.8))))
(assert (elective_wgoal (code BPM) (cf (* ?cf2 0.8))))
(assert (elective_wgoal (code ASPM) (cf (* ?cf3 0.8))))
(assert (elective_wgoal (code ITL) (cf (* ?cf4 0.8))))
(assert (elective_wgoal (code KM) (cf (* ?cf5 0.8))))
(assert (elective_wgoal (code MITOS) (cf (* ?cf6 0.8))))

)

(defrule student_management_int_weightage_no ;; Reducing weightage for mgmt subjects if not interested in mgmt

(logical (management_int No))

(elective (code ITSM) (cf ?cf1))
(elective (code BPM) (cf ?cf2)) 
(elective (code ASPM) (cf ?cf3))
(elective (code ITL) (cf ?cf4))
(elective (code KM) (cf ?cf5))
(elective (code MITOS) (cf ?cf6))

=>

(assert (elective_wgoal (code ITSM) (cf (* ?cf1 -0.5))))
(assert (elective_wgoal (code BPM) (cf (* ?cf2 -0.5))))
(assert (elective_wgoal (code ASPM) (cf (* ?cf3 -0.5))))
(assert (elective_wgoal (code ITL) (cf (* ?cf4 -0.5))))
(assert (elective_wgoal (code KM) (cf (* ?cf5 -0.5))))
(assert (elective_wgoal (code MITOS) (cf (* ?cf6 -0.5))))

)

(defrule student_management_int_weightage_maybe ;; If student 'maybe' interested in management 
                                                ;; we set cf for mgmt subjects as 0.4
(logical (management_int Maybe))

(elective (code ITSM) (cf ?cf1))
(elective (code BPM) (cf ?cf2)) 
(elective (code ASPM) (cf ?cf3))
(elective (code ITL) (cf ?cf4))
(elective (code KM) (cf ?cf5))
(elective (code MITOS) (cf ?cf6))

=>

(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.4))))
(assert (elective_wgoal (code BPM) (cf (* ?cf2 0.4))))
(assert (elective_wgoal (code ASPM) (cf (* ?cf3 0.4))))
(assert (elective_wgoal (code ITL) (cf (* ?cf4 0.4))))
(assert (elective_wgoal (code KM) (cf (* ?cf5 0.4))))
(assert (elective_wgoal (code MITOS) (cf (* ?cf6 0.4))))

)

;; Project Management or Enterprise Management

(defrule determine_student_management_project_enterprise

(logical ( and (or (branch KE) (branch SE)) 
               (or (experience High) (experience Medium) (experience Low)) 
               (or (management_exp Yes) (management_exp No))
               (or (management_int Yes) (management_int Maybe)))) ;; rule not applicable if mgmt_int = no

=>

(assert (UI-state (display management_pm_ent)
(relation-asserted management_pm_ent)
(response PM)
(valid-answers PM EM Both)))

)


(defrule student_management_pm_ent_weightage_pm ;; If student is interested in PM 
                                                ;; boost PM subjects by a 'probably' factor (0.6/Probably)
                                       
(logical (management_pm_ent PM))

(elective (code BPM) (cf ?cf1)) 
(elective (code ASPM) (cf ?cf2))

=>

(assert (elective_wgoal (code BPM) (cf (* ?cf1 0.6))))
(assert (elective_wgoal (code ASPM) (cf (* ?cf2 0.6))))

)

(defrule student_management_pm_ent_weightage_em ;; If student is interested in EM 
                                                ;; boost EM subjects by a 'probably' factor (0.6/Probably)

(logical (management_pm_ent EM))

(elective (code ITSM) (cf ?cf1))
(elective (code ITL) (cf ?cf2))
(elective (code KM) (cf ?cf3))
(elective (code MITOS) (cf ?cf4))

=>

(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.6))))
(assert (elective_wgoal (code ITL) (cf (* ?cf2 0.6))))
(assert (elective_wgoal (code KM) (cf (* ?cf3 0.6))))
(assert (elective_wgoal (code MITOS) (cf (* ?cf4 0.6))))

)

(defrule student_management_pm_ent_weightage_both ;; If student is interested in both PM and EM 
                                                  ;; we set equal cf for all mgmt subjects (0.4/Maybe)
(logical (management_pm_ent Both))

(elective (code ITSM) (cf ?cf1))
(elective (code BPM) (cf ?cf2)) 
(elective (code ASPM) (cf ?cf3))
(elective (code ITL) (cf ?cf4))
(elective (code KM) (cf ?cf5))
(elective (code MITOS) (cf ?cf6))

=>

(assert (elective_wgoal (code ITSM) (cf (* ?cf1 0.4))))
(assert (elective_wgoal (code BPM) (cf (* ?cf2 0.4))))
(assert (elective_wgoal (code ASPM) (cf (* ?cf3 0.4))))
(assert (elective_wgoal (code ITL) (cf (* ?cf4 0.4))))
(assert (elective_wgoal (code KM) (cf (* ?cf5 0.4))))
(assert (elective_wgoal (code MITOS) (cf (* ?cf6 0.4))))

)
