; System ekspercki
; "What species did you evolve from?"

;///////////
;Start point
;///////////

(deffacts starter
    (start)
)

;////////////
;First relations
;////////////

(defrule first-favorite
    ?x <- (start)
=>
    (assert (question "favorite;6;My favorite thing to do is;Eat;Sleep;Swim;Mate;Run;I don't understand this chart;eat;sleep;swim;mate;run;dunno"))
    (retract ?x)
)

;////////
;Eating
;/////////

(defrule eat-favorite
    (favorite eat)
=>
    (assert (question "what_eat;3;What food do you eat?;No meat;Eh, I'm not that picky;Things with blood;no_meat;no_choice_eat;blood_eat"))
)

;////////
;Eating->No meat
;////////

(defrule eat-no-meat
    (what_eat no_meat)
=>
    (assert (question "hippie;2;Are you a hippie?;Yes;No;yes;no"))
)

;///////
;Eating->No meat->Hippie
;//////

(defrule eat-hippie-yes
    (hippie yes)
=>
    (assert (question "rockin;2;Rockin' the beard?;Full-Body;I'm more into tats;full_body;tattoo"))
)

(defrule eat-tattoos
    (rockin tattoo)
=>
    (printout t "Grant's zebra" crlf)
    (assert (finish "Grant's zebra"))
)

(defrule eat-fullbody
    (rockin full_body)
=>
    (printout t "Wolly yak" crlf)
    (assert (finish "Wolly yak"))
)

;///////
;Eating->No meat->No hippie
;//////

(defrule eat-hippie-no
    (hippie no)
=>
    (assert (question "vote;2;How do you vote?;For guns!;For the undeground movement!;guns;underground"))
)

(defrule eat-guns
    (vote guns)
=>
    (printout t "African elephant" crlf)
    (assert (finish "African elephant"))
)

(defrule eat-undeground
    (vote underground)
=>
    (printout t "Garden worm" crlf)
    (assert (finish "Garden worm"))
)

;///////
;Eating->No choice
;///////

(defrule eat-no-choice
    (what_eat no_choice_eat)
=>
    (assert (question "tree;2;Would you climb a tree to get it?;Yes;No;yes;no"))
)

;//////
;Eating->No choice->Yes climb
;///////

(defrule eat-climb
    (tree yes)
=>
    (assert (question "quick;2;How quickly?;Faster than you'd think;Slower than you'd think;faster;slower"))
)

(defrule eat-fast-climb
    (quick faster)
=>
    (printout t "Himalayah black bear" crlf)
    (assert (finish "Himalayah black bear"))
)

(defrule eat-slow-climb
    (quick slower)
=>
    (printout t "Two-toed sloth" crlf)
    (assert (finish "Two-toed sloth"))
)

;///////
;Eating->No choice->No climb
;///////

(defrule eat-no-climb
    (tree no)
=>
    (assert (question "lazy;2;Why so lazy?;I need 9 months of beauty sleep;Trash cans are easier;sleep;trash"))
)

(defrule eat-sleep
    (lazy sleep)
=>
    (printout t "Alpine marmot" crlf)
    (assert (finish "Alpine marmot"))
)

(defrule eat-trash
    (lazy trash)
=>
    (printout t "Northern racoon" crlf)
    (assert (finish "Northern racoon"))
)

;///////
;Eating->Blood
;///////

(defrule eat-blood
    (what_eat blood_eat)
=>
    (assert (question "kill;2;Do you kill it?;Yes;No;yes;no"))
)

;///////
;Eating->Blood->Yes kill
;///////

(defrule eat-kill
    (kill yes)
=>
    (assert (question "how_long;3;How long does it take;I tie it up and kill it later;A few seconds;Hours;tie;seconds;hours"))
)

(defrule eat-tie
    (how_long tie)
=>
    (printout t "Black widow spider" crlf)
    (assert (finish "Black widow spider"))
)

(defrule eat-seconds
    (how_long seconds)
=>
    (printout t "Saltwater crocodile" crlf)
    (assert (finish "Saltwater crocodile"))
)

(defrule eat-hours
    (how_long hours)
=>
    (printout t "Burmese python" crlf)
    (assert (finish "Burmese python"))
)

;///////
;Eating->Blood->No kill
;///////

(defrule eat-no-kill
    (kill no)
=>
    (assert (question "why_not_kill;2;Why not?;'cuz someone else does;I like my steak EXTRA rare;else;rare"))
)

(defrule eat-else
    (why_not_kill else)
=>
    (printout t "Ruppell's griffin vulture" crlf)
    (assert (finish "Ruppell's griffin vulture"))
)

(defrule eat-rare
    (why_not_kill rare)
=>
    (printout t "Horse leech" crlf)
    (assert (finish "Horse leech"))
)

;//////
;Sleep
;//////

(defrule sleep-favorite
    (favorite sleep)
=>
    (assert (question "graveyard;2;'cuz you work the graveyard shift?;Yes;No;yes;no"))
)

(defrule graveyard-yes
    (graveyard yes)
=>
    (printout t "Brown Bat" crlf)
    (assert (finish "Brown Bat"))
)

(defrule graveyard-no
    (graveyard no)
=>
    (assert (question "cuddly;2;Are you cuddly?;My mother says I am;People other than my mother say I am;mother;other"))
)

(defrule cuddly-mother
    (cuddly mother)
=>
    (printout t "Koala Bear" crlf)
    (assert (finish "Koala Bear"))
)

(defrule cuddly-other
    (cuddly other)
=>
    (printout t "Giant Armadillo" crlf)
    (assert (finish "Giant Armadillo"))
)