(*
   VARIABLES

   On remplace la valeur de chaque variable selon le syllogisme donnée.
   Si par exemple la deuxième premisse est une particuliere negatif,
   Alors u2 = FAUX et a2 = FAUX.
   Car u2 designe le booleen signifiant si la 2e premisse est universelle ou non,
   et a2 le booleen si la 2e premisse est affirmative ou non.
*)

(* z.(0) *) let u1 : bool = true;; (* Variable verifiant si la premiere premisse est universelle *)
(* z.(1) *) let u2 : bool = true;; (* Variable verifiant si la deuxieme premisse est universelle *)
(* z.(2) *) let uc : bool = true;; (* Variable verifiant si la conclusion est universelle *)
(* z.(3) *) let a1 : bool = true;; (* Variable verifiant si la premiere premisse est affirmative *)
(* z.(4) *) let a2 : bool = true;; (* Variable verifiant si la deuxieme premisse est affirmative *)
(* z.(5) *) let ac : bool = true;; (* Variable verifiant si la conclusion est affirmative *)
(* z.(6) *) let s : bool = true;; (* Variable verifiant si le sujet de la conclusion est sujet dans sa premisse *)
(* z.(7) *) let p : bool = true;; (* Variable verifiant si le predicat de la conclustion est predicat dans sa premisse *)

(* Notre syllogisme contenant les 8 variables qui le representent *)
let z : bool array = [|u1;u2;uc;a1;a2;ac;s;p|];;

(* ===================== FONCTIONS ===================== *)

(* fonction rmt *)
let rmt(z : bool array) : bool =
  if Array.length(z) <> 8
  then failwith("erreur rmt : z doit etre un tableau de variables contenant 8 valeurs")
  else 
    if (z.(0) = true || z.(1) = true)
      then true
else false
;;

(* fonction rlh *)
let rlh(z : bool array) : bool =
  if Array.length(z) <> 8
  then failwith("erreur rlh : z doit etre un tableau de variables contenant 8 valeurs")
else (
  (
    z.(6)=true && z.(7)=true && (
    (z.(1)=false && z.(3)=true && z.(4)=true) 
      || (z.(1)=true && z.(3)=false && z.(0)=true) 
      || (z.(1)=false && z.(3)=false) 
      || (z.(1)=true && z.(3)=true && z.(0)=true && z.(4)=true)
        )
      )
  || (
    z.(6)=false && z.(7)=false && (
      (z.(2)=false && z.(0)=false && z.(4)=true && z.(3)=true) 
      || (z.(2)=false && z.(0)=true && z.(4)=false && z.(1)=true) 
      || (z.(2)=false && z.(0)=true && z.(4)=true && not(z.(1)=false && z.(3)=true)) 
      || (z.(2)=true && z.(4)=false)
        )
      ) 
  || (
    z.(6)=true && z.(7)=false && (
      (z.(0)=true && z.(1)=false && not(z.(3)=true && z.(4)=true)) 
      || (z.(0)=true && z.(1)=true && not(z.(3)=true && z.(4)=true))
        )
      ) 
  || ((z.(6)=false && z.(7)=true && (z.(2)=false && (z.(4)=true))))
)
;;

(* Fonction rnn *)
let rnn(z : bool array) : bool =
  if Array.length(z) <> 8
  then failwith("erreur rnn : z doit etre un tableau de variables contenant 8 valeurs")
  else
    if ((z.(3) = true || z.(4) = true))
    then true
    else false
;;

(* Fonction rn *)
let rn(z : bool array) : bool =
  if Array.length(z) <> 8
  then failwith("erreur rn : z doit etre un tableau de variables contenant 8 valeurs")
  else
    if ( (z.(5)=false && (z.(3)=false || z.(4)=false )) || (z.(3)=true && z.(4)=true))
    then true
else false
;;

(* fonction raa *)
let raa(z : bool array) : bool =
  if Array.length(z) <> 8
  then failwith("erreur raa : z doit etre un tableau de variables contenant 8 valeurs")
  else
    if (z.(3) = true && z.(4) = true && z.(5) = false)
    then false
    else true
;;

(* fonction rpp *)
let rpp(z : bool array) : bool =
  if Array.length(z) <> 8
  then failwith("erreur rpp : z doit etre un tableau de variables contenant 8 valeurs")
  else
    if (z.(1) = false && z.(0) = false) = false
      then true
else false
;;

(* fonction rp *)
let rp(z : bool array) : bool =
  if Array.length(z) <> 8
  then failwith("erreur rp : z doit etre un tableau de variables contenant 8 valeurs")
  else
    if ((z.(0)=true && z.(1)=true)) || ((z.(0)=false || z.(1)=false) && z.(2)=false)
    then true
    else false
;;

(* fonction valide qui verifie la validité d'un syllogisme en verifiant si les 7 regles sont valides *)
let valide(z :bool array) : bool = rmt(z) && rlh(z) && rnn(z) && rn(z) && raa(z) && rpp(z) && rp(z) ;;


(* 
Fonction principale qui regroupe juste le code des fonctions precedentes ,
et affichant la valeur de chaque variable, ainsi que l'affirmation si le syllogisme est valide ou non
*)
let main(z : bool array) : unit =
if Array.length(z)<>8
  then failwith("erreur : z doit etre un tableau de variables contenant 8 valeurs")
else
  let rmt : bool = (z.(0) = true || z.(1) = true) in
  let rlh : bool =
      (
  (
    z.(6)=true && z.(7)=true && (
    (z.(1)=false && z.(3)=true && z.(4)=true) 
      || (z.(1)=true && z.(3)=false && z.(0)=true) 
      || (z.(1)=false && z.(3)=false) 
      || (z.(1)=true && z.(3)=true && z.(0)=true && z.(4)=true)
        )
      )
  || (
    z.(6)=false && z.(7)=false && (
      (z.(2)=false && z.(0)=false && z.(4)=true && z.(3)=true) 
      || (z.(2)=false && z.(0)=true && z.(4)=false && z.(1)=true) 
      || (z.(2)=false && z.(0)=true && z.(4)=true && not(z.(1)=false && z.(3)=true)) 
      || (z.(2)=true && z.(4)=false)
        )
      ) 
  || (
    z.(6)=true && z.(7)=false && (
      (z.(0)=true && z.(1)=false && not(z.(3)=true && z.(4)=true)) 
      || (z.(0)=true && z.(1)=true && not(z.(3)=true && z.(4)=true))
        )
      ) 
  || ((z.(6)=false && z.(7)=true && (z.(2)=false && (z.(4)=true))))
)
     in
  let rnn : bool =
    (z.(3) = true || z.(4) = true) in
  let rn : bool = 
    ((z.(5)=false && (z.(3)=false || z.(4)=false )) || (z.(3)=true && z.(4)=true)) in
  let raa : bool = (
    if (z.(3) = true && z.(4) = true && z.(5) = false)
      then false
  else true
     ) in
  let rpp : bool =
    (
      if (z.(1) = false && z.(0) = false) = false
        then true
    else false
    ) in
  let rp : bool =
    (
      if ((z.(0)=true && z.(1)=true)) || ((z.(0)=false || z.(1)=false) && z.(2)=false)
        then true
    else false
    ) in
  let valide : bool = (rmt && rlh && rnn && rn && raa && rpp && rp) in
print_string("Valeur de U1 : "^string_of_bool(z.(0))^"\n");
print_string("Valeur de U2 : "^string_of_bool(z.(1))^"\n");
print_string("Valeur de Uc : "^string_of_bool(z.(2))^"\n");
print_string("Valeur de A1 : "^string_of_bool(z.(3))^"\n");
print_string("Valeur de A2 : "^string_of_bool(z.(4))^"\n");
print_string("Valeur de Ac : "^string_of_bool(z.(5))^"\n");
print_string("Valeur de S : "^string_of_bool(z.(6))^"\n");
print_string("Valeur de P : "^string_of_bool(z.(7))^"\n");
print_string("Le syllogisme est-il valide ? : "^string_of_bool(valide)^"\n");
;;

(* =========================================================================================================== *)
(* =========================================================================================================== *)

(* 
Ici nous avons les syllogismes censés etre valide,
le l_ signigie "ligne" et le numéro apres represente la ligne du syllogisme dans le tableur.
  *)

let l_75 : bool array = [|false;true;false;false;true;false;false;true|];;
let l_94 : bool array = [|false;true;false;true;true;true;false;false|];;
let l_95 : bool array = [|false;true;false;true;true;true;false;true|];;
let l_138 : bool array = [|true;false;false;false;true;false;false;false|];;
let l_139 : bool array = [|true;false;false;false;true;false;false;true|];;
let l_140 : bool array = [|true;false;false;false;true;false;true;false|];;
let l_141 : bool array = [|true;false;false;false;true;false;true;false|];;
let l_148 : bool array = [|true;false;false;true;false;false;true;false|];;
let l_159 : bool array = [|true;false;false;true;true;true;false;true|];;
let l_161 : bool array = [|true;false;false;true;true;true;true;true|];;
let l_202 : bool array = [|true;true;false;false;true;false;false;false|];;
let l_203 : bool array = [|true;true;false;false;true;false;false;true|];;
let l_204 : bool array = [|true;true;false;false;true;false;true;false|];;
let l_205 : bool array = [|true;true;false;false;true;false;true;true|];;
let l_210 : bool array = [|true;true;false;true;false;false;false;false|];;
let l_212 : bool array = [|true;true;false;true;false;false;true;false|];;
let l_222 : bool array = [|true;true;false;true;true;true;false;false|];;
let l_223 : bool array = [|true;true;false;true;true;true;false;true|];;
let l_225 : bool array = [|true;true;false;true;true;true;true;true|];;
let l_236 : bool array = [|true;true;true;false;true;false;true;false|];;
let l_237 : bool array = [|true;true;true;false;true;false;true;true|];;
let l_242 : bool array = [|true;true;true;true;false;false;false;false|];;
let l_244 : bool array = [|true;true;true;true;false;false;true;false|];;
let l_257 : bool array = [|true;true;true;true;true;true;true;true|];;
