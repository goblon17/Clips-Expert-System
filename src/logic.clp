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

;//////
;Swim
;//////

(defrule swim-favorite
    (favorite swim)
=>
    (assert (question "where;4;Where?;The sand;In the shallows;The deep blue sea;No, the DEEP blue sea;sand;shallows;sea;deep-sea"))
)

(defrule where-sand
    (where sand)
=>
    (printout t "Desert Monitor" crlf)
    (assert (finish "Desert Monitor"))
)

;//////
;Swim->shallows
;//////

(defrule where-shallows
    (where shallows)
=>
    (assert (question "shallows;3;In the shallows...;Sidewalk puddles;Ponds & lakes;Rivers & streams;puddles;ponds;rivers"))
)

;//////
;Swim->shallows->puddles
;//////

(defrule shallows-puddles
    (shallows puddles)
=>
    (assert (question "fries;2;Do you eat french fries?;Yes, and pretzels;No;yes;no"))
)

(defrule fries-yes
    (fries yes)
=>
    (printout t "Feral Pigeon" crlf)
    (assert (finish "Feral Pigeon"))
)

(defrule fries-no
    (fries no)
=>
    (printout t "Probably Algae" crlf)
    (assert (finish "Probably Algae"))
)

;//////
;Swim->shallows->ponds
;//////

(defrule shallows-ponds
    (shallows ponds)
=>
    (assert (question "buoyancy;2;How's your buoyancy?;I couldn't sink if I tried;I sink like a rock;swim;sink"))
)

(defrule buoyancy-swim
    (buoyancy swim)
=>
    (printout t "Lesser Snow Goose" crlf)
    (assert (finish "Lesser Snow Goose"))
)

(defrule buoyancy-sink
    (buoyancy sink)
=>
    (printout t "Thick Shelled River Mussel" crlf)
    (assert (finish "Thick Shelled River Mussel"))
)


;//////
;Swim->shallows->rivers
;//////

(defrule shallows-rivers
    (shallows rivers)
=>
    (assert (question "recreationally;2;Recreationally?;I like to goof around;I can be pretty intense;goof;intense"))
)

(defrule recreationally-goof
    (recreationally goof)
=>
    (printout t "Eurasion River Otter" crlf)
    (assert (finish "Eurasion River Otter"))
)

(defrule recreationally-intense
    (recreationally intense)
=>
    (printout t "Red Pirhana" crlf)
    (assert (finish "Red Pirhana"))
)

;//////
;Swim->sea
;//////

(defrule shallows-sea
    (shallows sea)
=>
    (assert (question "alone;2;Alone?;Yes;No;yes;no"))
)

;//////
;Swim->sea->yes
;//////

(defrule alone-yes
    (alone yes)
=>
    (assert (question "why-alone;2;Bummer. Why?;Because I'm mean;Because I feel... invisible;mean;invisible"))
)

(defrule why-alone-mean
    (why-alone mean)
=>
    (printout t "Bull Shark" crlf)
    (assert (finish "Bull Shark"))
)

(defrule why-alone-invisible
    (why-alone invisible)
=>
    (printout t "Transparent Jellyfish" crlf)
    (assert (finish "Transparent Jellyfish"))
)

;//////
;Swim->deep-sea
;//////

(defrule where-deep-sea
    (where deep-sea)
=>
    (assert (question "scary;2;Are you scary?;Yes;No;yes;no"))
)

(defrule scary-yes-no
    (or
        (scary yes)
        (scary no)
    )
=>
    (assert (question "more-of;2;Which do you have more of?;Teeth;Appendages;teeth;appendages"))
)

(defrule more-of-teeth
    (more-of teeth)
=>
    (printout t "Viperfish" crlf)
    (assert (finish "Viperfish"))
)

(defrule more-of-appendages
    (more-of appendages)
=>
    (printout t "Giant Squid" crlf)
    (assert (finish "Giant Squid"))
)

;//////
;Mate
;//////

(defrule mate-favorite
    (favorite mate)
=>
    (assert (question "hit-n-quit;2;Hit it & quit it?;Yes;No;yes;no"))
)

(defrule hit-n-quit-yes
    (hit-n-quit yes)
=>
    (printout t "Bottlenose Dolphin" crlf)
    (assert (finish "Bottlenose Dolphin"))
)

(defrule hit-n-quit-no
    (hit-n-quit no)
=>
    (assert (question "home-dad;2;Are you a stay at home dad?;Yes;No;yes;no"))
)

(defrule home-dad-yes
    (home-dad yes)
=>
    (printout t "Pygmy Seahorse" crlf)
    (assert (finish "Pygmy Seahorse"))
)

(defrule home-dad-no
    (home-dad no)
=>
    (printout t "Turtle Dove" crlf)
    (assert (finish "Turtle Dove"))
)

;//////
;Dunno
;//////

(defrule dunno-favorite
    (favorite dunno)
=>
    (assert (question "dunno;1;I don't understand this chart;It's ok. No one expects you to; dunno"))
)

(defrule dunno-dunno
    (dunno dunno)
=>
    (printout t "Belgium Milk Sheep" crlf)
    (assert (finish "Belgium Milk Sheep"))
)

;//////
;Run
;//////

(defrule run-favorite
    (favorite run)
=>
    (assert (question "speed;3;How fast?;Kidding... I walk.;So fast I fly;I'm pretty quick;walk;fly;quick"))
)

;//////
;Run->walk
;//////

(defrule speed-walk
    (speed walk)
=>
    (assert (question "haste;2;With haste?;Yes;No;yes;no"))
)

(defrule haste-no
    (haste no)
=>
    (printout t "Galapagos Tortoise" crlf)
    (assert (finish "Galapagos Tortoise"))
)

(defrule haste-yes
    (haste yes)
=>
    (assert (question "posture;2;How's your posture?;Bloody good, mate;Quasimodo;good;quasimodo"))
)

(defrule posture-good
    (posture-good)
=>
    (printout t "Antilopine Kangaroo" crlf)
    (assert (finish "Antilopine Kangaroo"))
)

(defrule posture-quasimodo
    (posture-quasimodo)
=>
    (printout t "Silverback Gorilla" crlf)
    (assert (finish "Silverback Gorilla"))
)

;//////
;Run->fly
;//////

(defrule speed-fly
    (speed fly)
=>
    (assert (question "literally;2;Literally?;Yes;No;yes;no"))
)

(defrule literally-yes
    (literally yes)
=>
    (printout t "Peregrine Falcon" crlf)
    (assert (finish "Peregrine Falcon"))
)

(defrule literally-no
    (literally no)
=>
    (assert (question "how-so;2;How so, then?;In my dreams;Metaphorically;dreams;metaphore"))
)

(defrule how-so-dreams
    (how-so dreams)
=>
    (printout t "Tanzania Ostrich" crlf)
    (assert (finish "Tanzania Ostrich"))
)

(defrule how-so-metaphore
    (how-so metaphore)
=>
    (printout t "Cheetah" crlf)
    (assert (finish "Cheetah"))
)

;//////
;Run->quick
;//////

(defrule speed-quick
    (speed quick)
=>
    (assert (question "indoors;2;Mostly indoors?;Yes;No;yes;no"))
)

;//////
;Run->quick->yes
;//////

(defrule indoors-yes
    (indoors yes)
=>
    (assert (question "house;2;Do you own, or rent?;I'm in between floors at the moment;If I pee on it, I own it, right?;between;pee"))
)

(defrule house-between
    (house between)
=>
    (printout t "Cockroach" crlf)
    (assert (finish "Cockroach"))
)

(defrule house-pee
    (house pee)
=>
    (printout t "Miniature Schnauzer" crlf)
    (assert (finish "Miniature Schnauzer"))
)

;//////
;Run->quick->no
;//////

(defrule indoors-no
    (indoors no)
=>
    (assert (question "ipod;2;What's on your IPod?;\"My Old Kentucky Home\";\"Hakuna Matata\";kentucky;hakuna"))
)

(defrule ipod-kentucky
    (ipod kentucky)
=>
    (printout t "Quarterhorse" crlf)
    (assert (finish "Quarterhorse"))
)

(defrule ipod-hakuna
    (ipod hakuna)
=>
    (printout t "African Lion" crlf)
    (assert (finish "African Lion"))
)