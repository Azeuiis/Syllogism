# Syllogisme
Un programme qui vérifie si un syllogisme est valide ou non.
⚠️ Syllogisme valide =/= Syllogisme Correcte.

Le fichier ``syllogisme.ml`` comprend le code du programme en langage ocaml.
``syllogisme.xlsx`` comprend un tableur avec les 256 formes de syllogismes possibles, ainsi que la valeur de chaque règle (détails ci-dessous)
appliqués sur celui-ci; Il comprends également le type de chaque proposion , ainsi que la proposition et la figure du syllogisme.

**Notions et notations :** Un syllogisme est la donnée de trois propositions. Les deux premières sont appelées
prémisses (n°1 et n°2) et la troisième la conclusion (C). Une proposition est de la forme s → p, où et s et p sont appelés
termes, appelés respectivement sujet et prédicat. La conclusion est notée S → P. La prémisse n°1 est composée de P
et d’un terme M, dit moyen. Elle est de la forme P → M ou M → P. La prémisse n°2 est composée de S et du terme M.
Elle est de la forme S → M ou M → S. Les quatre formes de syllogismes, dites figures, sont donc :

|       Proposition        | Figure 1 | Figure 2 | Figure 3 | Figure 4 |
|:-------------:|:--------:|----------|----------|----------|                       
| 1ere prémisse | M → P    | P → M    | M → P    | P → M    |                       
| 2e prémisse   | S → M    | S → M    | M → S    | M → S    |                       
| Conclusion    | S → P    | S → P    | S → P    | S → P    |

Chaque proposition a une quantité : universelle ou particulière, et une qualité : affirmative ou négative. Il est donc vrai
ou faux que la quantité d’une proposition est universelle et que sa qualité est affirmative. Comme un syllogisme a 3
propositions, il faut 3 × 2 = 6 variables booléennes pour coder leurs qualités et quantités. Dans les prémisses, à la
figure 1, S et P demeurent respectivement sujet et prédicat. Dans les prémisses de la figure 2, P devient sujet. Dans
celles de la figure 3, S devient prédicat. Enfin, dans celles de la figure 4, P devient sujet et S devient prédicat. Il faut
donc une variable booléenne pour coder la fonction de S dans sa proposition, et une autre pour coder la nature de P
dans sa proposition. On caractérise donc un syllogisme de façon complète par 8 variables booléennes (tableau 1).

| Variable |          Vraie quand...         |
|:--------:|:-------------------------------:|
| U1       | la 1re prémisse est universelle |
| U2       | la 2re prémisse est universelle |
| Uc       | la conclusion est universelle   |
| A1       | la 1re prémisse est affirmative |
| A2       | la 2e prémisse est affirmative  |
| Ac       | la conclusion est affirmative   |
| S        | S est sujet dans sa prémisse    |
| P        | P est prédicat dans sa prémisse |
1. Variables d’un syllogisme

| Proposition | U = vrai | U = faux |
|:-----------:|:--------:|----------|
| A = vrai    | A        | I        |
| A = faux    | E        | O        |
2. Types des propositions

|  Figure  | S = vrai | S = faux |
|:--------:|:--------:|----------|
| P = vrai | 1        | 3        |
| P = faux | 2        | 4        |
3. Type des figures

Il existe donc 2^8 = 256 types de syllogismes. Chacun est défini par les valeurs « vrai » ou « faux » que prennent les 8
variables qui le caractérisent. Pour une proposition donnée par ses variables U et A, le tableau 2 donne le type de
proposition avec les notations usuelles pour les syllogismes. Pour un syllogisme donné par ses variables S et P, le
tableau 3 donne la figure correspondante.

  **Exemple:** Soit le syllogisme suivant, repris comme exemple dans la suite du texte :
  
*Tous les chats sont gris – Il existe un animal qui n’est pas gris – Il existe un animal qui n’est pas un chat*



Dans la conclusion, le sujet S est animal et le prédicat P est chat. La première prémisse est universelle et
affirmative, donc U1 = vrai et A1 = vrai. La seconde prémisse est particulière et négative, donc U2 = faux et A2 =
faux. La conclusion est particulière et négative, donc Uc = faux et Ac = faux. Le sujet de la conclusion (animal) est
sujet dans sa prémisse, donc S = vrai. Le prédicat de la conclusion est sujet dans sa prémisse, donc P = faux. Le
syllogisme proposé est donc représenté par l’octuplet de variables booléennes Z = (U1, U2, Uc, A1, A2, Ac, S, P) =
(vrai, faux, faux, vrai, faux, faux, vrai, faux). D’après le tableau 3, il correspond à la figure 2. À ce stade, l’on
constate seulement que les trois propositions forment un syllogisme, mais l’on ne sait pas s’il est valide.

Comme une proposition, un terme a une quantité. S’il est sujet de la proposition, sa quantité est celle de sa
proposition. Un sujet est donc universel quand sa proposition l’est (et particulier quand sa proposition l’est). Si un
terme est prédicat de sa proposition, sa quantité est universelle quand sa proposition est négative (et particulière
quand elle est affirmative).

Pour trouver les syllogismes valides parmi tous les syllogismes possibles, une méthode consiste à ne retenir que ceux
qui vérifient toutes les règles suivantes, dont certaines portent sur les quantités et d’autres sur les qualités. La
démonstration de la validité de ces règles n’entre pas dans le cadre de ce repo Github.

| Règles sur les quantités                                                                                                                           |
|----------------------------------------------------------------------------------------------------------------------------------------------------|
| Règle du moyen terme Rmt : la quantité de M doit être universelle dans l’une des prémisses au moins.                                               |
| Règle du latius hos. Rlh : la quantité d’un terme de la conclusion ne peut être universelle que si elle l’est dans la prémisse contenant ce terme. |

Ces règles expriment, indirectement pour Rmt et directement pour Rlh, que les éléments de la conclusion ne peuvent
être plus forts que ceux des prémisses, au sens où une proposition universelle est plus forte qu’une proposition
particulière et une proposition affirmative est plus forte qu’une proposition négative.

**Exemple, suite.**

   *Règle Rmt.* Dans la figure 2, M (gris) est prédicat. Comme la proposition n°2 qui le contient est négative, sa
   quantité est universelle. La règle est donc vérifiée.
   
   *Règle Rlh.* La quantité de S (animal) est particulière, parce que la quantité de la conclusion l’est. La quantité de P
   (chat) est universelle, parce que la conclusion est négative. P (chat) est le sujet de la première prémisse. Sa
   quantité est donc celle de la première prémisse, c’est-à-dire universelle aussi. La règle est donc vérifiée, puisqu’il
   ne figure pas dans la conclusion de terme de quantité universelle qui serait de quantité particulière dans son
   prédicat.

| Règles sur les qualités                                               |
|-----------------------------------------------------------------------|
| Rnn : deux prémisses négatives ne donnent pas de conclusion.          |
| Rn : si une prémisse est négative, la conclusion est négative.        |
| Raa : deux prémisses affirmatives donnent une conclusion affirmative. |
| Rpp : deux prémisses particulières ne donnent pas de conclusion.      |
| Rp : si une prémisse est particulière la conclusion est particulière. |

**Toutes les règles sont vérifiées pour le syllogisme proposé : il est donc valide.**

| Sources & aides :                                  |
|----------------------------------------------------|
| https://fr.wikipedia.org/wiki/Syllogisme           |
| https://www.youtube.com/watch?v=M09waFKxbO4&t=129s |
| https://www.youtube.com/watch?v=H4HK0ycJWls        |
